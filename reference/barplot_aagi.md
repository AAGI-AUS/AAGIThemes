# Basic Barplots Using a Unified AAGI Style and Typography

Basic barplots that follow a standard AAGI style including typography
guidelines that uses (hopefully) sensible defaults. All valid
[`barplot()`](https://rdrr.io/r/graphics/barplot.html) options are
supported through `...`, for *e.g.*, `col` to set the colour. Defaults
to "AAGI Black", a very dark grey colour.

## Usage

``` r
barplot_aagi(height, ...)
```

## Arguments

- height:

  Either a vector or matrix of values describing the bars which make up
  the plot. If height is a vector, the plot consists of a sequence of
  rectangular bars with heights given by the values in the vector. If
  height is a matrix and beside is `FALSE` then each bar of the plot
  corresponds to a column of height, with the values in the column
  giving the heights of stacked sub-bars making up the bar. If height is
  a matrix and beside is `TRUE`, then the values in each column are
  juxtaposed rather than stacked.

- ...:

  Arguments to be passed to methods, such as graphical parameters (see
  [`graphics::par()`](https://rdrr.io/r/graphics/par.html)). The most
  commonly used argument would be `y` for the factor to use for the
  y-axis, `type` describing what type of plot should be drawn, or `col`
  for point colour (defaults to AAGI Black), a very dark grey.

## Value

A `barplot` object, returned invisibly (see
[`graphics::barplot()`](https://rdrr.io/r/graphics/barplot.html)).

## See also

- [`graphics::plot()`](https://rdrr.io/r/graphics/plot.default.html) for
  full documentation of the basic plotting capabilities.

- plot_aagi, boxplot_aagi, hist_aagi

Other Baseplots:
[`boxplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/boxplot_aagi.md),
[`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md),
[`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md)

## Author

Adam Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r

barplot_aagi(islands)

barplot_aagi(islands, col = "AAGI Orange")

```
