# Resolve the AAGI Font, Following the Quarto Template When Available

Precedence: (1) the `AAGI_MAINFONT` environment variable, (2) the
`aagi_mainfont` option of
[`knitr::opts_knit`](https://rdrr.io/pkg/knitr/man/opts_knit.html) (when
knitr is installed), (3)
[`.set_aagi_font()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-set_aagi_font.md)
(Proxima Nova, then Arial, then "sans"). The Quarto-derived value is
never cached so it can change per document.

## Usage

``` r
.resolve_aagi_font()
```

## Value

A character string with a font family name.
