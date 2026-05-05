# Basic Barplots Using a Unified AAGI Style and Typography

Basic barplots that follow a standard AAGI style including typography
guidelines that uses (hopefully) sensible defaults.

## Usage

``` r
barplot_aagi(height, col = "AAGI Black", ...)
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

- col:

  Colour to use as fill for bars Defaults to "AAGI Black", a very dark
  grey. Can be supplied as a named AAGI colour; *e.g.*, "AAGI Black"; a
  named colour, "black"; or a hexadecimal code, "#414042".

- ...:

  Arguments to be passed to methods, such as graphical parameters (see
  [`graphics::par()`](https://rdrr.io/r/graphics/par.html)).

## Value

Called for its side effect of creating a barplot with the AAGI style.

## Author

Adam Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r

barplot_aagi(islands)

```
