# Basic X-Y Plotting Using a Unified AAGI Style and Typography

Basic plot that follow a standard AAGI style including typography
guidelines that uses (hopefully) sensible defaults. All valid
[`plot()`](https://rdrr.io/r/graphics/plot.default.html) options are
supported through `...`, for *e.g.*, `col` to set the colour. Defaults
to "AAGI Black", a very dark grey colour.

## Usage

``` r
plot_aagi(x, y = NULL, ...)
```

## Arguments

- x:

  the coordinates of points in the plot. Alternatively, a single
  plotting structure, function or any R *object with a plot method* can
  be provided.

- y:

  The y coordinates of points in the plot, optional. If `y` is `NULL`,
  `x` is assumed to describe the `y` values, and an index is used for
  `x`.

- ...:

  Arguments to be passed to methods, such as graphical parameters (see
  [`graphics::par()`](https://rdrr.io/r/graphics/par.html)). The most
  commonly used argument would be `y` for the factor to use for the
  y-axis, `type` describing what type of plot should be drawn, or `col`
  for point colour (defaults to AAGI Black), a very dark grey.

## Value

A `plot` object, returned invisibly (see
[`graphics::plot()`](https://rdrr.io/r/graphics/plot.default.html)).

## See also

- [`graphics::plot()`](https://rdrr.io/r/graphics/plot.default.html) for
  full documentation of the basic plotting capabilities.

- barplot_aagi, boxplot_aagi, hist_aagi

Other Baseplots:
[`barplot_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/barplot_aagi.md),
[`boxplot_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/boxplot_aagi.md),
[`hist_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/hist_aagi.md)

## Author

Adam Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r
library(datasets)

plot_aagi(airquality$Ozone,
  main = "Air Quality",
  xlab = "Ozone"
)


plot_aagi(pressure)

```
