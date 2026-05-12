# Scale Constructors for AAGI Colour Palettes to be Used in ggplot2 Objects

Helpers for applying AAGI colour palettes to
[ggplot2](https://CRAN.R-project.org/package=ggplot2) colour and fill
aesthetics.

## Usage

``` r
scale_colour_aagi(
  palette = NULL,
  discrete = TRUE,
  colours = NULL,
  values = NULL,
  ...
)

scale_fill_aagi(
  palette = NULL,
  discrete = TRUE,
  colours = NULL,
  values = NULL,
  ...
)
```

## Arguments

- palette:

  Character name of a palette supported by
  [`AAGIPalettes::aagi_palettes()`](https://AAGI-AUS.github.io/AAGIPalettes/reference/aagi_palettes.html).
  If `NULL` and `discrete = TRUE`, use the official colours in
  [AAGIPalettes::aagi_colours](https://AAGI-AUS.github.io/AAGIPalettes/reference/aagi_colours.html).

- discrete:

  Logical; should the scale be discrete? Defaults to `TRUE`.

- colours:

  Character vector of official AAGI colour names to interpolate for
  continuous scales. If `NULL`, defaults used by
  [`AAGIPalettes::interpolate_aagi_colours()`](https://AAGI-AUS.github.io/AAGIPalettes/reference/interpolate_aagi_colours.html)
  are applied.

- values:

  Optional character vector of colour values to use for discrete scales.
  This can be a vector of hex colours or values returned by
  [`AAGIPalettes::colour_as_hex()`](https://AAGI-AUS.github.io/AAGIPalettes/reference/colour_as_hex.html).
  If supplied, `values` takes precedence over `palette` and the default
  ordering of
  [AAGIPalettes::aagi_colours](https://AAGI-AUS.github.io/AAGIPalettes/reference/aagi_colours.html).

- ...:

  Additional arguments passed to the underlying
  [ggplot2](https://CRAN.R-project.org/package=ggplot2) scale functions.

## Details

By default, discrete scales use the official colours in
[AAGIPalettes::aagi_colours](https://AAGI-AUS.github.io/AAGIPalettes/reference/aagi_colours.html).
If `palette` is supplied, discrete scales use a named palette from
[`AAGIPalettes::aagi_palettes()`](https://AAGI-AUS.github.io/AAGIPalettes/reference/aagi_palettes.html).

Continuous scales use interpolated colours via
[`AAGIPalettes::interpolate_aagi_colours()`](https://AAGI-AUS.github.io/AAGIPalettes/reference/interpolate_aagi_colours.html).

## Functions

- `scale_colour_aagi()`: For colour scales

- `scale_fill_aagi()`: For fill scales
