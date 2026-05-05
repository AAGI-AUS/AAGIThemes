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

## See also

Other tables:
[`theme_ft_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/theme_ft_aagi.md)

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
