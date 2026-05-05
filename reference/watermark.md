# Add a Watermark Annotation Layer to a ggplot2 Object

Add a Watermark Annotation Layer to a ggplot2 Object

## Usage

``` r
watermark(
  watermark,
  fontsize = 120,
  colour = "grey90",
  alpha = 0.1,
  fontface = "bold",
  angle = 22
)
```

## Arguments

- watermark:

  String to be added as watermark

- fontsize:

  Font size

- colour:

  Font colour

- alpha:

  Alpha (transparency; lower number = more transparent)

- fontface:

  Font face ("bold" by default)

- angle:

  Angle of the watermark

## Value

A
[ggplot2](https://ggplot2.tidyverse.org/reference/ggplot2-package.html)
object with a watermark added to the plot that's called.

## Author

Matt Cowgill and Will Mackey

## Examples

``` r

library(ggplot2)
# First, start with a plot:
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_aagi()

# Then add a watermark:

p + watermark("DRAFT")

```
