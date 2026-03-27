# Basic Boxplots Using a Unified AAGI Style and Typography

Basic boxplots that follow AAGI colour and typography guidelines that
uses (hopefully) sensible defaults.

## Usage

``` r
boxplot_aagi(
  x,
  main = "",
  sub = "",
  xlab = "",
  ylab = "",
  col = "white",
  pch = 16,
  ...
)
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

- col:

  Colour to use as fill for boxes Defaults to white. Can be supplied as
  a named AAGI colour, *e.g.*, "AAGI Orange"; named colour, "Orange"; or
  or a hexadecimal code, "#ec8525".

- pch:

  plotting ‘character’, *i.e.*, symbol to use. This can either be a
  single character or an integer code for one of a set of graphics
  symbols. The full set of S symbols is available with `pch = 0:18`, see
  the examples below. (NB: R uses circles instead of the octagons used
  in S.) Value `pch = "."` (equivalently `pch = 46`) is handled
  specially. It is a rectangle of side 0.01 inch (scaled by `cex`). In
  addition, if `cex = 1` (the default), each side is at least one pixel
  (1/72 inch on the
  [`grDevices::pdf()`](https://rdrr.io/r/grDevices/pdf.html) and
  [`grDevices::postscript()`](https://rdrr.io/r/grDevices/postscript.html)
  devices). For other text symbols, `cex = 1` corresponds to the default
  font size of the device, often specified by an argument `pointsize`.
  For `pch` in 0:25 the default size is about 75% of the character
  height (see `par("cin")`).

- ...:

  Arguments to be passed to methods, such as graphical parameters (see
  [`graphics::par()`](https://rdrr.io/r/graphics/par.html)).

## Value

Called for its side effect of creating a boxplot with the AAGI style.

## See also

[`graphics::boxplot()`](https://rdrr.io/r/graphics/boxplot.html) for
full documentation of the basic boxplot capabilities

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
