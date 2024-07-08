
#' AAGI Palettes
#'
#' A quick and dirty way to show \acronym{AAGI} colours in a palette plot.
#'
#' @param n `Numeric` Number of different colours in the palette, minimum 3,
#'   maximum depends on the palette. Defaults to `3`
#' @param name A palette name from the lists below
#'
#' There are 3 types of palettes, sequential, diverging, and qualitative.
#' \enumerate{
#'  \item{Sequential palettes are suited to ordered data that progress from low
#'   to high. Lightness steps dominate the look of these schemes, with light
#'   colours for low data values to dark colours for high data values.}
#'  \item{Diverging palettes put equal emphasis on mid-range critical values and
#'   extremes at both ends of the data range. The critical class or break in the
#'   middle of the legend is emphasized with light colours and low and high
#'   extremes are emphasized with dark colours that have contrasting hues.}
#'  \item{Qualitative palettes do not imply magnitude differences between legend
#'   classes, and hues are used to create the primary visual differences between
#'   classes. Qualitative schemes are best suited to representing nominal or
#'   categorical data.}
#'  }
#'
#' The sequential palettes names are:
#' * \dQuote{aagi_blues},
#' * \dQuote{aagi_bright_greens},
#' * \dQuote{aagi_BrYl},
#' * \dQuote{aagi_greens},
#' * \dQuote{aagi_greys},
#' * \dQuote{aagi_reds},
#' * \dQuote{aagi_oranges},
#' * \dQuote{aagi_RdYl},
#' * \dQuote{aagi_teals},
#' * \dQuote{aagi_TlGnYl},
#' * \dQuote{aagi_TlYl},
#' * \dQuote{aagi_yellows}
#'
#' All the sequential palettes are available in variations from 3 different
#'  values up to 9 different values.
#'
#' The diverging palettes are:
#' * \dQuote{aagi_BuOr},
#' * \dQuote{aagi_BuYl},
#' * \dQuote{aagi_GnYl},
#' * \dQuote{aagi_RdBu},
#' * \dQuote{aagi_RdTl},
#' * \dQuote{aagi_TlGn}
#'
#' All the diverging palettes are available in variations from 3 different
#'  values up to 11 different values.
#'
#' For qualitative palettes, the lowest number of distinct values available
#'  always is 3, but the largest number is different for different palettes.
#'  It is given together with the palette names in the following table.

#' @return `NULL`. Called for its side-effects, a plot of the given palette.
#' @export
#'
#' @examples
#' display_aagi_palette(n = 5, name = "aagi_BuOr")
#'
display_aagi_palette <- function(n = 3, name) {
  if (n < 3) {
    rlang::warn(
      "The minimal value for {.arg{n}} is 3.
      Displaying requested palette with 3 different levels\n"
    )

    return(scales::show_col(aagi_pal(
      n = 3,
      name = name,
      direction = direction
    )))
  }
  if (n > maxcolours[which(name == namelist)]) {
    rlang::warn(
      "n too large, allowed maximum for palette",
      name,
      "is",
      maxcolours[which(name == namelist)],
      "\nDisplaying the palette you asked for with that many colours\n"
    )
    return(display.aagi.pal(maxcolours[which(name == namelist)], name))
  }
}
