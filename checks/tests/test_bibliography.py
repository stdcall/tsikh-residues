"""Compile bibliography entries before and after changing their BibLaTeX data."""
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import unittest

import fitz

ROOT = Path(__file__).resolve().parents[2]

# A compound entry with its English translation, and two more works of the
# same author (they print a dash for the names).
SAMPLE = '''\
#import "content/book-style.typ": book-style
#import "content/bibliography-style.typ": bib-item
#show: book-style
#set page(numbering: "1", header: none)
Integral representations @bib:Aizenberg1964 and integer points
@bib:Aizenberg1983a.
#pagebreak()
Again @bib:Aizenberg1983a.
#pagebreak()
#bib-item(key: "Aizenberg1964") <bib:Aizenberg1964>
#bib-item(key: "Aizenberg1977") <bib:Aizenberg1977>
#bib-item(key: "Aizenberg1983a") <bib:Aizenberg1983a>
'''


def bib_records(text):
    """Key -> {field: value} of a braced BibLaTeX file, one field per line."""
    records = {}
    for key, body in re.findall(r'^@\w+\{(\w+),\n(.*?)^\}', text,
                                re.MULTILINE | re.DOTALL):
        records[key] = dict(re.findall(r'^  (\w+) = \{(.*)\},$', body,
                                       re.MULTILINE))
    return records


class BibliographySource(unittest.TestCase):
    def test_bib_changes_reach_printed_text_and_links(self):
        with tempfile.TemporaryDirectory(prefix='bibliography-',
                                         dir='/tmp') as tmp:
            root = Path(tmp)
            shutil.copytree(ROOT / 'content', root / 'content')
            shutil.copytree(ROOT / 'assets', root / 'assets')
            bib_path = root / 'references.bib'
            original = (ROOT / 'references.bib').read_text()
            bib_path.write_text(original)
            shutil.copy(ROOT / 'editorial.bib', root)
            (root / 'sample.typ').write_text(SAMPLE)

            def compile_pdf(name):
                result = subprocess.run([
                    'typst', 'compile', '--root', str(root),
                    '--ignore-system-fonts', '--font-path',
                    str(root / 'assets/fonts'), '--input', 'stage=draft',
                    str(root / 'sample.typ'), str(root / name)],
                    capture_output=True, text=True)
                self.assertEqual(result.returncode, 0, result.stderr)
                self.assertEqual(result.stderr, '', result.stderr)
                with fitz.open(root / name) as doc:
                    # Word joiners keep a range together at its dash.
                    pages = [' '.join(
                        doc[i].get_text().replace('⁠', '').split())
                        for i in range(len(doc))]
                    links = {link['uri'] for page in doc
                             for link in page.get_links() if 'uri' in link}
                return pages, links

            before, _ = compile_pdf('before.pdf')
            self.assertIn('[1]', before[0])
            self.assertIn('[3]', before[0])
            entries = ' '.join(before[2:])
            self.assertIn('1. L. A. Aizenberg, Integral representations of '
                          'holomorphic functions of several complex '
                          'variables, Dokl. Akad. Nauk SSSR 155 (1964), '
                          '9–12; English transl. in Soviet Math. Dokl. 5 '
                          '(1964).', entries)
            # The later works of the same author print a dash for the
            # names.
            self.assertIn('2. , On a formula for the generalized', entries)
            self.assertIn('Dokl. Akad. Nauk SSSR 270 (1983), 521–523; '
                          'English transl. in Soviet Math. Dokl. 27 (1983).',
                          entries)
            self.assertIn('3. , Application of the multidimensional', entries)
            self.assertEqual(entries.count('Aizenberg'), 1)

            with fitz.open(root / 'before.pdf') as doc:
                self.check_mentions(doc)

            # Only the bibliographic data changes between compilations.
            records = bib_records(original)
            title = records['Aizenberg1983a']['title']
            changed = original.replace(
                'title = {' + title + '}', 'title = {Article mutation probe}',
                1)
            first = records['Aizenberg1977']['author']
            start = changed.index('@article{Aizenberg1977,')
            end = changed.index('\n}', start)
            entry = changed[start:end]
            entry = entry.replace('author = {' + first + '}',
                                  'author = {Probe, X.}').replace(
                '  year = {1977},\n',
                '  year = {1977},\n  doi = {10.1234/book-probe},\n')
            changed = changed[:start] + entry + changed[end:]
            self.assertIn('Article mutation probe', changed)
            self.assertIn('10.1234/book-probe', changed)
            bib_path.write_text(changed)
            after, new_links = compile_pdf('after.pdf')
            entries = ' '.join(after[2:])
            self.assertIn('2. X. Probe, On a formula for the generalized',
                          entries)
            # The names are no longer those of the record before: printed.
            self.assertIn('3. L. A. Aizenberg, Article mutation probe, Dokl.',
                          entries)
            self.assertIn('https://doi.org/10.1234/book-probe', new_links)

    def check_mentions(self, doc):
        """[3] is cited on pages 1 and 2: its entry lists exactly those
        pages and links to them; [1] once; [2] never."""
        text = ' '.join(doc[2].get_text().replace('⁠', '').split())
        self.assertRegex(text, r'Soviet Math\. Dokl\. 27 \(1983\)\.'
                               r'(?: DOI(?: \([a-z ]+\))?: \S+ ?\S*)?'
                               r' \[1, 2\]')
        self.assertRegex(text, r'Soviet Math\. Dokl\. 5 \(1964\)\.'
                               r'(?: DOI(?: \([a-z ]+\))?: \S+ ?\S*)? \[1\]')
        self.assertNotRegex(text, r'Soviet Math\. Dokl\. 18 \(1977\)\.'
                                  r'(?: DOI(?: \([a-z ]+\))?: \S+ ?\S*)? \[')
        targets = sorted(link['page'] for link in doc[2].get_links()
                         if link.get('kind') == fitz.LINK_GOTO)
        self.assertEqual(targets, [0, 0, 1])

    def test_entries_match_literal_labels_and_bib_keys(self):
        source = (ROOT / 'content/80-bibliography.typ').read_text()
        entries = re.findall(
            r'#bib-item\(key: "([A-Za-z][A-Za-z0-9]*)"\)\s*'
            r'<bib:([A-Za-z][A-Za-z0-9]*)>', source)
        self.assertTrue(entries)
        self.assertEqual(len(entries), source.count('#bib-item('))
        self.assertTrue(all(key == label for key, label in entries))
        keys = [key for key, _ in entries]
        records = bib_records((ROOT / 'references.bib').read_text())
        editorial = bib_records((ROOT / 'editorial.bib').read_text())
        components = {part for record in records.values()
                      for part in record.get('related', '').split(',')
                      if part}
        self.assertTrue(components <= set(records))
        # The editorial references follow the list of the book.
        self.assertEqual(keys[len(keys) - len(editorial):],
                         list(editorial))
        keys = keys[:len(keys) - len(editorial)]
        self.assertCountEqual(keys, set(records) - components)
        # The list follows the order of the records (the printed numbers
        # are their places).
        printed = [key for key in records if key not in components]
        self.assertEqual(keys, printed)
        for key in components:
            self.assertIn('userc', records[key])
        for key in keys:
            self.assertNotIn('userc', records[key])
            self.assertIn('annotation', records[key])
        for key, record in records.items():
            if 'journal' in record or 'shortjournal' in record:
                self.assertIn('userb', record, key)


if __name__ == '__main__':
    unittest.main()
