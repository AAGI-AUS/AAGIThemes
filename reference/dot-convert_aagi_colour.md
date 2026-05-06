# Check and convert AAGI colour

Checks a string value to see if it's a valid AAGI colour and converts it
to the corresponding hexadecimal colour code. This is done by checking
for an "AAGI " prefix in the string, as all valid colours from
AAGIPalettes will have this.

## Usage

``` r
.convert_aagi_colour(x)
```

## Arguments

- x:

  A character string to be checked/converted. Can be length-1 or a
  vector.

## Value

A character string/vector of hex colour codes, or the input unchanged if
it's not an AAGI colour name.
