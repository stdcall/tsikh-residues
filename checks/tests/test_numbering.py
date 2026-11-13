"""Statements are numbered per kind within a subsection, and a kind that
occurs once in its subsection has no number; inserting a statement
renumbers the statements of its subsection and the references to them;
formulas are numbered per subsection; subsections are referred to as
"§5.2" or "subsection 2"; sections are numbered through the book (a
chapter does not restart them)."""
from pathlib import Path
import subprocess
import tempfile
import unittest

import fitz

ROOT = Path(__file__).resolve().parents[2]
SOURCE = """#import "/content/book-style.typ": book-style
#import "/content/main-defs.typ": tagged-equation
#import "/content/statements.typ": *
#show: book-style
= First Chapter <ch:first>
Introduction.
== First Section <sec:first>
#subsection[First] <ss:first>
Text.
#lemma[One lemma.] <lem:one>
#lemma[Another lemma.] <lem:two>
#theorem[A theorem.] <th:alone>

#subsection[Second] <ss:second>
Text $ x = y $ <eq:first> and
$ u = v $ <eq:second>
{insertion}
#lemma[The target lemma.] <lem:target>

Compare Lemma~@lem:two, @eq:first, @eq:second, @ss:first,
@ss:first[subsection], @lem:target[the lemma].

#subsection[Third] <ss:third>
$ p = q $ <eq:third>
Back to @eq:third.

= Second Chapter <ch:second>
Introduction.
== A Section <sec:fifth>
#subsection[Only] <ss:only>
#lemma[Another chapter.] <lem:fifth>

Back to @ss:second, @sec:fifth, @ss:only.
"""


class StatementNumbering(unittest.TestCase):
    def compile(self, text):
        with tempfile.TemporaryDirectory(prefix='tsikh-numbering-',
                                         dir='/tmp') as tmp:
            output = Path(tmp) / 'sample.pdf'
            result = subprocess.run([
                'typst', 'compile', '--root', str(ROOT),
                '--ignore-system-fonts', '--font-path',
                str(ROOT / 'assets/fonts'), '--input', 'stage=draft', '-',
                str(output),
            ], input=text, text=True, capture_output=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(result.stderr, '')
            with fitz.open(output) as pdf:
                text = ' '.join(' '.join(p.get_text().split()) for p in pdf)
                links = [link for page in pdf for link in page.get_links()
                         if link.get('kind') == fitz.LINK_GOTO]
                return text, links

    def test_numbering_within_subsections(self):
        before, links = self.compile(SOURCE.format(insertion=''))
        self.assertIn('§1. First Section', before)
        self.assertIn('1. First. Text.', before)
        self.assertIn('Lemma 1. One lemma.', before)
        self.assertIn('Lemma 2. Another lemma.', before)
        self.assertIn('Theorem. A theorem.', before)
        self.assertIn('Lemma. The target lemma.', before)
        self.assertIn('Compare Lemma 2, (1), (2), §1.1, subsection 1, '
                      'the lemma.', before)
        self.assertIn('Back to (1).', before)
        # The second chapter goes on with the sections of the book.
        self.assertIn('§5. A Section', before)
        self.assertIn('Back to §1.2, §5, §5.1.', before)
        self.assertGreaterEqual(len(links), 9)
        after, _ = self.compile(SOURCE.format(
            insertion='#lemma[An inserted lemma.] <lem:inserted>'))
        self.assertIn('Lemma 1. An inserted lemma.', after)
        self.assertIn('Lemma 2. The target lemma.', after)
        self.assertIn('Compare Lemma 2, (1), (2), §1.1, subsection 1, '
                      'the lemma.', after)


if __name__ == '__main__':
    unittest.main()
