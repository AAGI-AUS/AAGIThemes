# A ggplot2 Theme Using a Unified AAGI Style and Typography for Plots

This theme follows a standard AAGI style including typography guidelines
that uses (hopefully) sensible defaults for
[ggplot2](https://CRAN.R-project.org/package=ggplot2) graphics.

## Usage

``` r
theme_aagi(
  base_size = 12,
  major_grid = FALSE,
  minor_grid = FALSE,
  border = FALSE,
  showtext_auto = TRUE,
  ...
)
```

## Arguments

- base_size:

  `Numeric`. The figure's base size, set to 12 by default. For
  presentations using a larger `base_size` will make the fonts larger
  and more suitable for presentation slides, *e.g.*, `base_size = 24`.

- major_grid:

  `Boolean`. Include major gridlines in the panel. Defaults to `FALSE`.

- minor_grid:

  `Boolean`. Include minor gridlines in the panel. Defaults to `FALSE`.

- border:

  `Boolean`. Include a border around the figure on all four sides.
  Defaults to `FALSE`.

- showtext_auto:

  `Boolean`. If `TRUE`, enable
  [`showtext::showtext_auto()`](https://rdrr.io/pkg/showtext/man/showtext_auto.html)
  that provides full AAGI font support. Defaults to `TRUE`.

  **Important:**
  [`showtext::showtext_auto()`](https://rdrr.io/pkg/showtext/man/showtext_auto.html)
  changes global rendering behaviour for the entire R session/device.
  This can affect subsequent plots (including non-AAGIThemes plots)
  until it is disabled. However, since it is anticipated that this theme
  will only ever be used for official AAGI work, this seems unlikely to
  be an issue.

  To undo, call
  [`showtext_aagi_off()`](https://AAGI-AUS.github.io/AAGIThemes/reference/showtext_aagi_off.md).

- ...:

  Other arguments as passed along to
  [`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html).

## Author

Adam Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r
library("ggplot2")

p <- ggplot(mtcars) +
  geom_point(aes(wt, mpg)) +
  theme_aagi(showtext_auto = TRUE)

p


# Disable global showtext auto afterwards (recommended)
showtext_aagi_off()
```
