# Insert AAGI's Logo Into Any Graphic File

Insert the AAGI logo in any graphical image. Particularly well- suited
for use with files created with AAGIThemes. The logo will be inserted in
the upper-left of the image with a size of at least 4.6 cm as per AAGI
brand guidelines.

## Usage

``` r
add_aagi_logo(file_in, file_out, logo_width = 4.6, overwrite = FALSE)
```

## Arguments

- file_in:

  Path to the graphical file to import and add the AAGI logo to apply
  the logo to.

- file_out:

  File name to create on disk as a .png format image.

- logo_width:

  Size for the logo in centimetres. Defaults to 4.6 cm, the smallest
  allowed by the AAGI guidelines. Larger sizes may be beneficial for
  larger graphical images than normal reporting and sharing.

- overwrite:

  A Boolean value that indicates whether to overwrite an existing file
  or not. Defaults to `FALSE` and will not overwrite the existing file.

## Value

An invisible `NULL`, called for its side effect of adding the AAGI logo
to the plot that's called.

## Author

Adam Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r
library("ggplot2")

p1 <- ggplot(mtcars) +
  geom_point(aes(
    x = wt,
    y = mpg,
    colour = factor(gear)
  )) +
  facet_wrap(~am) +
  theme_aagi()

ggsave(p1, filename = "AAGI.png", path = tempdir())
#> Saving 6.67 x 6.67 in image

add_aagi_logo(
  file_in = file.path(tempdir(), "AAGI.png"),
  file_out = file.path(tempdir(), "AAGI_logo.png")
)
#> Inserted logo width: 4.6 cm (DPI = 118).

x <- magick::image_read(file.path(tempdir(), "AAGI_logo.png"))
print(x)
#> # A tibble: 1 × 7
#>   format width height colorspace matte filesize density
#>   <chr>  <int>  <int> <chr>      <lgl>    <int> <chr>  
#> 1 PNG     1999   2299 sRGB       FALSE    51452 118x118
```
