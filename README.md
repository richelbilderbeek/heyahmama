# heyahmama

<!-- markdownlint-disable MD013 --><!-- Badges cannot be split up over lines, hence will break 80 characters per line -->

[![R-CMD-check](https://github.com/richelbilderbeek/heyahmama/actions/workflows/R-CMD-check.yaml/badge.svg?branch=main)](https://github.com/richelbilderbeek/heyahmama/actions/workflows/R-CMD-check.yaml)
[![codecov.io](https://codecov.io/github/richelbilderbeek/heyahmama/coverage.svg?branch=main)](https://codecov.io/github/richelbilderbeek/heyahmama/branch/main)
[![DOI](https://zenodo.org/badge/908638871.svg)](https://doi.org/10.5281/zenodo.14561968)

<!-- markdownlint-enable MD013 -->

`heyahmama` is an R package about the Flemish/Dutch band K3,
contain data about its musical output,
as well as functions to easily access that data.

## Installation

To install `heyahmama`, do:

```r
remotes::install_github("richelbilderbeek/heyahmama")
```

## Example usage

```r
library(heyahmama)

# An overview of which member was in which formation
formations <- get_formations()

# Get a list of all CDs' titles and band formations
cds <- get_cds()

# Get the composers for each song
composers <- get_composers()

# Get an overview of all songs' CD, track number, song title and duration
songs <- get_songs()
```

## How to cite this package


## Files used by continuous integration scripts

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Filename                                  |Descriptions
------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------
[mlc_config.json](mlc_config.json)        |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[.spellcheck.yml](.spellcheck.yml)        |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)            |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.markdownlint.jsonc](.markdownlint.jsonc)|Configuration of the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.
[.markdownlintignore](.markdownlintignore)|Files ignored by the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.

<!-- markdownlint-enable MD013 -->
