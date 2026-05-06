# Font matching + caching utilities

These helpers standardise font selection across macOS, Windows and Linux
by using
[`systemfonts::match_fonts()`](https://systemfonts.r-lib.org/reference/match_fonts.html)
as the single source of truth (i.e., a font is considered "available" if
it resolves to an on-disk font file).

## Usage

``` r
.aagi_font_cache
```
