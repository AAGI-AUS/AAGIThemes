# Apply the AAGI Theme to a gt Object

Apply the AAGI theme to a [gt](https://CRAN.R-project.org/package=gt).
An AAGI formatted table body is grey with a teal header and white header
font. Header text is bold, text columns are left aligned, other columns
are right aligned.

## Usage

``` r
theme_gt_aagi(x)
```

## Arguments

- x:

  a [gt](https://CRAN.R-project.org/package=gt) object

## Value

a formatted [gt](https://CRAN.R-project.org/package=gt) object

## Font

The font is resolved as follows. Inside a Quarto document, the font
chosen by the AAGI Quarto template is used; the template should set the
`AAGI_MAINFONT` environment variable (or the `aagi_mainfont` option of
[`knitr::opts_knit`](https://rdrr.io/pkg/knitr/man/opts_knit.html)) to
the font it selected. Otherwise (e.g., standalone use) Proxima Nova is
used if available, then Arial, then "sans". The resolved font is
followed by "Arial" and
[`gt::default_fonts()`](https://gt.rstudio.com/reference/default_fonts.html).

## See also

Other tables:
[`theme_ft_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/theme_ft_aagi.md)

## Author

Adam H. Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r
library(gt)
library(dplyr)
gt <- head(airquality) |>
  mutate(`Month Name` = "May") |>
  gt()
gt <- theme_gt_aagi(gt)
gt


  

Ozone
```
