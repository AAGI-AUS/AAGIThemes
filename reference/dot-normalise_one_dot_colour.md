# Normalize and convert colour-related args found in dots

- If an arg is missing/empty/NA, use a default.

- If an arg is a character string starting with "AAGI ", convert via
  [`.convert_aagi_colour()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-convert_aagi_colour.md).

- Otherwise leave as-is (supports numeric palette indices, "red",
  "#RRGGBB", etc.).

## Usage

``` r
.normalise_one_dot_colour(value, default)
```

## Arguments

- dots:

  A list, typically created with `list(...)`.

- defaults:

  Named list of defaults, e.g. `list(col = "AAGI Black")`. Only names
  present here will be normalised.

## Value

`dots`, with normalised/converted values for any matching names.
