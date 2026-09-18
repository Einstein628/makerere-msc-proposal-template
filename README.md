# Makerere MSc Research Proposal Template (LaTeX)

A LaTeX template that implements the Makerere University MSc research proposal format: A4, Times 12 pt, 1.5 line spacing, numbered hierarchical headings, Roman pagination for the preliminary pages and Arabic for the main text, table captions above and figure captions below, and APA 7th edition referencing through `biblatex-apa` and Biber.

It contains formatting and structure only. Every section holds a placeholder and a short note on what belongs there, so you can fill it in without reverse-engineering the layout. No research text from any particular proposal is included.

[![Build PDF](../../actions/workflows/build-pdf.yml/badge.svg)](../../actions/workflows/build-pdf.yml)

---

## What you get

- **Title page** built from one metadata file, with the university crest
- **Declaration** page with supervisor blocks and signature lines
- **Acknowledgements, List of Tables, List of Figures, List of Abbreviations, Summary**
- **Table of contents** in the expected style, with chapters rendered as `CHAPTER 1: INTRODUCTION`
- **Three chapters** with the standard Makerere proposal section structure
- **Two landscape appendices**: a budget table and a work plan with a symbol legend
- **APA 7th references** with clickable DOIs, generated from a `.bib` file
- Worked examples of a figure, a table and each citation command
- A `Makefile` and a GitHub Actions workflow that compiles the template on every push

The template builds to a 20-page skeleton PDF straight out of the box.

## Quick start

### On Overleaf

1. Download this repository as a ZIP (green **Code** button, then **Download ZIP**).
2. In Overleaf, choose **New Project → Upload Project** and drop the ZIP in. Do not unzip it first.
3. Open **Menu** and confirm: Compiler `pdfLaTeX`, Main document `main.tex`, newest TeX Live.
4. Click **Recompile**.

If you have an Overleaf Premium account, you can instead link the repository directly through Overleaf's GitHub integration and keep both copies in sync.

### Locally

Requires a TeX distribution with `latexmk` and `biber`, for example TeX Live or MiKTeX.

```bash
git clone https://github.com/<your-username>/makerere-msc-proposal-template.git
cd makerere-msc-proposal-template
make            # or: latexmk -pdf main.tex
```

### As a GitHub template

If you push this to GitHub, open **Settings** and tick **Template repository**. Anyone can then click **Use this template** to start their own proposal with a clean history.

## How to use it

Work through the files in this order.

**1. `metadata.tex`** holds your title, name, registration number, degree, supervisors, date and logo path. Nothing else needs your personal details, and the title page, declaration and PDF properties all read from here.

**2. `frontmatter/`** holds the declaration, acknowledgements, abbreviations and summary. Keep the abbreviation list alphabetical, and list only abbreviations that actually appear in the text or in a figure.

**3. `chapters/`** holds the three chapters. Each section carries a grey italic note describing what belongs there. Delete the notes as you write, or hide all of them at once by setting `\showguidancefalse` in `main.tex` before submission.

**4. `backmatter/`** holds the budget and work plan. Both are landscape. Appendix tables are numbered `I.1` and `II.1` so they cannot be confused with chapter tables.

**5. `references.bib`** holds your references. Four example entries show the conventions.

`preamble.tex` holds the formatting and should rarely need editing.

## File map

```
main.tex                  Master file; sets the order of everything
metadata.tex              Your details. Edit this first.
preamble.tex              All formatting. Edit rarely.
references.bib            Your references
frontmatter/              Title page, declaration, acknowledgements,
                          abbreviations, summary
chapters/                 Chapters 1 to 3
backmatter/               Appendix I (budget), Appendix II (work plan)
figures/                  university_logo.png, example_figure.png
Makefile                  make, make clean, make cleanall
.github/workflows/        Builds the PDF on every push
```

## Citing

Reference keys follow `firstauthor_year_keyword`.

| What you want | What to type | What prints |
|---|---|---|
| Parenthetical | `\parencite{example_2020_article}` | (Surname & Othersurname, 2020) |
| Two or more works | `\parencite{example_2020_article, example_2019_book}` | (Author, 2019; Surname & Othersurname, 2020) |
| Narrative | `\textcite{example_2019_book}` | Author (2019) |
| Inside a table, no brackets | `\nptextcite{example_2020_article}` | Surname & Othersurname, 2020 |
| With a prefix | `\parencite[e.g.,][]{example_2020_article}` | (e.g., Surname & Othersurname, 2020) |
| With a page number | `\parencite[p.~12]{example_2019_book}` | (Author, 2019, p. 12) |

Only cited works appear in the reference list, and `biblatex` adds any a/b year suffixes automatically. Two habits keep a reference list defensible: check that every DOI resolves before you paste an entry, and protect capitals that must survive APA sentence casing by bracing them, for example `{DNA}`, `{Uganda}`, `{Manihot}`.

## Figures and tables

Copy an existing block and change the file name, caption and label.

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.85\textwidth]{figures/your_figure.png}
  \caption[Short title for the List of Figures]{Full caption, ending with a full stop.}
  \label{fig:1.2}
\end{figure}
```

Refer to them as `Figure~\ref{fig:1.2}` and `Table~\ref{tab:3.1}` rather than typing numbers, so that numbering survives edits. Table captions go above the table body; figure captions go below the image.

## Adapting it for another university

Three changes cover most of it.

1. Replace `figures/university_logo.png` with your institution's logo, and update `\universitylogo` in `metadata.tex`.
2. Edit the wording of the submission statement in `frontmatter/titlepage.tex`.
3. Adjust margins, spacing or heading format in `preamble.tex`, where each block is commented.

## A note on the crest

`figures/university_logo.png` is the coat of arms of Makerere University. It is included so that Makerere candidates can build the template unchanged. It belongs to the university, is not covered by the MIT licence, and should be replaced if you are submitting elsewhere. See `LICENSE`.

## Requirements

A reasonably complete TeX distribution. The template uses `geometry`, `setspace`, `titlesec`, `tocloft`, `biblatex` with `biblatex-apa`, `booktabs`, `tabularx`, `longtable`, `pdflscape`, `xcolor`, `pifont`, `enumitem`, `caption`, `graphicx`, `hyperref`, `microtype` and `newtx`, with a fallback to `mathptmx` if `newtx` is unavailable. Bibliography processing needs **Biber**, not BibTeX.

## Contributing

Issues and pull requests are welcome, particularly corrections to the formatting where it departs from the current Makerere Directorate of Graduate Training guidance. Please keep the template free of subject-specific text.

## Licence

MIT, except the university crest as noted above. If you find the template useful, a link back is appreciated but not required.
