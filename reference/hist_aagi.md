# Basic Histograms Using a Unified AAGI Style and Typography

Basic histograms that follow a standard AAGI style including typography
guidelines that uses (hopefully) sensible defaults.

## Usage

``` r
hist_aagi(
  x,
  main = "",
  sub = "",
  xlab = "",
  ylab = "Count",
  breaks = "pretty",
  col = AAGIPalettes::aagi_colours["AAGI Black"],
  ...
)
```

## Arguments

- x:

  a vector of values for which the histogram is desired.

- main:

  Main title. Optional, if not supplied it will be blank.

- sub:

  Sub title below x-axis label. Optional, if not supplied it will be
  blank.

- xlab:

  X-axis label. Optional, if not supplied will be taken from data.

- ylab:

  Y-axis label. Optional, if not supplied will default to "Count".

- breaks:

  Either `pretty`, default, or `exact`. Pretty uses Scott's Rule,
  whereas exact uses a bin-width of 1 so each value is represented
  individually with a bar.

- col:

  Colour to use as fill for bars Defaults to a very dark grey.

- ...:

  Arguments to be passed to methods, such as graphical parameters (see
  [`graphics::par()`](https://rdrr.io/r/graphics/par.html)).

## Value

Called for its side effect of creating a histogram with the AAGI style.

## References

Scott, D.W. (1979) On optimal and data-based histograms. *Biometrika*,
66, 605–610.

Hyndman, R.J., The Problem with Sturges' Rule for Constructing
Histograms, 1995, Monash University,
<https://www.robjhyndman.com/papers/sturges.pdf>.

## See also

[`graphics::hist()`](https://rdrr.io/r/graphics/hist.html) for full
documentation of the basic histogram capabilities

## Author

Adam Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r
hist_aagi(islands)
#> Warning: "panel.first" is not a graphical parameter
#> Warning: "panel.first" is not a graphical parameter
#> Warning: "panel.first" is not a graphical parameter
#> Warning: "panel.first" is not a graphical parameter

```
