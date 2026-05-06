# Basic Histograms Using a Unified AAGI Style and Typography

Basic histograms that follow a standard AAGI style including typography
guidelines that uses (hopefully) sensible defaults. All valid
[`hist()`](https://rdrr.io/r/graphics/hist.html) options are supported
through `...`, for *e.g.*, `col` to set the colour. Defaults to "AAGI
Black", a very dark grey colour.

## Usage

``` r
hist_aagi(
  x,
  main = "",
  sub = "",
  xlab = "",
  ylab = "Count",
  breaks = "scott",
  ...
)
```

## Arguments

- x:

  A vector of values for which the histogram is desired.

- main:

  Main title. Optional, if not supplied it will be blank.

- sub:

  Sub title below x-axis label. Optional, if not supplied it will be
  blank.

- xlab:

  X-axis label. Optional, if not supplied will be an empty string.

- ylab:

  Y-axis label. Optional, if not supplied will default to "Count".

- breaks:

  One of "scott" (default), "fd", "sturges" (R's default), or "exact"
  (fixed bin width of 1 for integer. counts).

- ...:

  Arguments to be passed to methods, such as graphical parameters (see
  [`graphics::par()`](https://rdrr.io/r/graphics/par.html)). The most
  commonly used argument would be `y` for the factor to use for the
  y-axis, `type` describing what type of plot should be drawn, or `col`
  for point colour (defaults to AAGI Black), a very dark grey.

## Value

A `histogram` object, returned invisibly (see
[`graphics::hist()`](https://rdrr.io/r/graphics/hist.html)).

## References

Scott, D.W. (1979) On optimal and data-based histograms. *Biometrika*,
66, 605–610.

Hyndman, R.J., The Problem with Sturges' Rule for Constructing
Histograms, 1995, Monash University,
<https://www.robjhyndman.com/papers/sturges.pdf>.

## See also

- [`graphics::hist()`](https://rdrr.io/r/graphics/hist.html) for full
  documentation of the basic histogram capabilities.

- barplot_aagi, boxplot_aagi, plot_aagi

Other Baseplots:
[`barplot_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/barplot_aagi.md),
[`boxplot_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/boxplot_aagi.md),
[`plot_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/plot_aagi.md)

## Author

Adam Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r

hist_aagi(islands)

```
