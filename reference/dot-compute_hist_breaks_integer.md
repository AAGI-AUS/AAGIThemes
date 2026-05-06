# Compute safe histogram breaks for integer-count data

Provides three strategies:

- "pretty": pretty() style breaks (hist default)

- "scott": Scott's rule (hist supports this directly)

- "exact": fixed bin width of 1 over the data range

## Usage

``` r
.compute_hist_breaks_integer(x, method)
```

## Arguments

- x:

  Numeric vector.

- method:

  One of "pretty", "scott", "exact".

## Value

Either a character scalar ("pretty"/"scott") understood by
graphics::hist(), or a numeric vector of breakpoints.

## Details

Includes a guard for constant/degenerate inputs where pretty/scott can
fail.
