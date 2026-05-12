# Basic Boxplots Using a Unified AAGI Style and Typography

Basic boxplots that follow a standard AAGI style including typography
guidelines that uses (hopefully) sensible defaults. All valid
[`boxplot()`](https://rdrr.io/r/graphics/boxplot.html) options are
supported through `...`, for *e.g.*, `col` to set the colour. Defaults
to "AAGI Black", a very dark grey colour.

## Usage

``` r
boxplot_aagi(x, main = "", sub = "", xlab = "", ylab = "", pch = 16, ...)
```

## Arguments

- x:

  for specifying data from which the boxplots are to be produced. Either
  a numeric vector, or a single list containing such vectors. Additional
  unnamed arguments specify further data as separate vectors (each
  corresponding to a component boxplot). `NA`s are allowed in the data.

- main:

  Main title. Optional, if not supplied it will be blank.

- sub:

  Sub title below x-axis label. Optional, if not supplied it will be
  blank.

- xlab:

  X-axis label. Optional.

- ylab:

  Y-axis label. Optional.

- pch:

  plotting 'character', *i.e.*, symbol to use.

- ...:

  Arguments to be passed to methods, such as graphical parameters (see
  [`graphics::par()`](https://rdrr.io/r/graphics/par.html)). The most
  commonly used argument would be `y` for the factor to use for the
  y-axis, `type` describing what type of plot should be drawn, or `col`
  for point colour (defaults to AAGI Black), a very dark grey.

## Value

A `boxplot` object, returned invisibly (see
[`graphics::boxplot()`](https://rdrr.io/r/graphics/boxplot.html)).

## See also

- [`graphics::boxplot()`](https://rdrr.io/r/graphics/boxplot.html) for
  full documentation of the basic boxplot capabilities, and

- [`graphics::par()`](https://rdrr.io/r/graphics/par.html) for full
  documentation of `pch`.

&nbsp;

- [`graphics::boxplot()`](https://rdrr.io/r/graphics/boxplot.html) for
  full documentation of the basic plotting capabilities.

- barplot_aagi, hist_aagi, plot_aagi

Other Baseplots:
[`barplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/barplot_aagi.md),
[`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md),
[`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md)

## Author

Adam Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r
boxplot_aagi(decrease ~ treatment,
  data = OrchardSprays,
  xlab = "treatment",
  ylab = "decrease"
)

```
