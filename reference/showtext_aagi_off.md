# Disable global showtext auto rendering (AAGIThemes)

`theme_aagi(showtext_auto = TRUE)` enables
[`showtext::showtext_auto()`](https://rdrr.io/pkg/showtext/man/showtext_auto.html),
which affects subsequent plots globally. Call this function to turn it
off.

## Usage

``` r
showtext_aagi_off()
```

## Value

Invisibly returns `NULL`.
