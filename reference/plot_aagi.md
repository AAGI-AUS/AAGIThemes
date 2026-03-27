# Basic X-Y Plotting Using a Unified AAGI Style and Typography

Basic X-Y plotting that follows AAGI colour and typography guidelines
that uses (hopefully) sensible defaults.

## Usage

``` r
plot_aagi(x, ...)
```

## Arguments

- x:

  the coordinates of points in the plot. Alternatively, a single
  plotting structure, function or any R *object with a plot method* can
  be provided.

- ...:

  Arguments to be passed to methods, such as graphical parameters (see
  [`graphics::par()`](https://rdrr.io/r/graphics/par.html)). The most
  commonly used argument would be `y` for the factor to use for the
  y-axis or `type` describing what type of plot should be drawn.

## Value

Called for its side effect of creating a plot with the AAGI style.

## See also

[`graphics::plot()`](https://rdrr.io/r/graphics/plot.default.html) for
full documentation of the basic plotting capabilities.

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
