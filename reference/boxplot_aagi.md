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
  or a hexadecimal code, *e.g.*, "#ec8525".

- pch:

  plotting 'character', *i.e.*, symbol to use.

- ...:

  Arguments to be passed to methods, such as graphical parameters (see
  [`graphics::par()`](https://rdrr.io/r/graphics/par.html)).

## Value

Called for its side effect of creating a boxplot with the AAGI style.

## See also

- [`graphics::boxplot()`](https://rdrr.io/r/graphics/boxplot.html) for
  full documentation of the basic boxplot capabilities, and

- [`graphics::par()`](https://rdrr.io/r/graphics/par.html) for full
  documentation of `pch`.

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
