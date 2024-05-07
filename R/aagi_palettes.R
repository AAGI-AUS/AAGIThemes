
#' List AAGI Palette Colour Combinations
#'
#' Returns a list of curated palettes of \acronym{AAGI} colours, which includes:
#'  \describe{
#'    \item{primary}{The three primary \acronym{AAGI} colours}
#'    \item{secondary}{The three secondary support colours in the \acronym{AAGI}
#'        colour palette.}
#'    \item{full}{The full set of all six colours in the \acronym{AAGI}
#'        palette}
#'    \item{colourful}{All colours in the palette minus \dQuote{AAGI Black}}
#'    \item{bright}{Four \dQuote{bright} colours including,
#'      \dQuote{AAGI Bright Green}, \dQuote{AAGI Blue} and \dQuote{AAGI Yellow}}
#'    \item{bluegreeen}{Three blue, green or bluegreen \acronym{AAGI} colours
#'      including \dQuote{AAGI Bright Green}, \dQuote{AAGI Turquoise},
#'      \dQuote{AAGI Blue}, \dQuote{AAGI Green} and \dQuote{AAGI Bluegreen}}
#'  }
#'
#' @examples
#' # View all five palettes' names and hexadecimal colour codes
#'   aagi_palettes()
#'   aagi_palettes()$colourful
#'   aagi_palettes()$bluegreen
#'
#' @return A `list` object of \acronym(AAGI) colours grouped by palette
#'   combinations
#' @export
aagi_palettes <- function() {
  return(list("primary" = aagi_colours[1:3],
              "secondary" = aagi_colours[4:6],
              "colourful" = aagi_colours[2:6],
              "full" = aagi_colours,
              "bright" = aagi_colours[c(2, 4, 6)],
              "bluegreen" = aagi_colours[3:5]))
}

#' Extract AAGI Colours as Hex Codes
#'
#' @param ... Character names of \acronym{AAGI} colours
#' @export
aagi_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(theme.aagi::aagi_colours)

  theme.aagi::aagi_colours[cols]
}


#' Interpolate an AAGI Palette
#'
#' Interpolate an \acronym{AAGI} palette to have more colours for use in
#'   graphing.  This should be used sensibly and within reason, _e.g._, no 15
#'   colour graphs, 6 or 7 unique colours is a sensible value for discrete
#'   variables.  Luckily the [aagi_colours] have 6!  However, with this
#'   function, you can create new palettes by interpolating the colours in
#'   `aagi_colours`. Also see \CRANpkg{RColorBrewer} and \CRANpkg{viridis} for
#'   sensible palettes.
#'
#' @param Palette `Character` name of a \acronym{AAGI} palette in
#'   `aagi_palettes()`.  Defaults to `NULL` returning a randomly selected
#'   palette.
#' @param reverse `Boolean` argument indicating whether the palette should be
#'   reversed, _i.e._ light to dark.  Defaults to `FALSE`.
#' @param ... Additional arguments to pass to [grDevices::colorRampPalette()].
#'
#' @export
aagi_pal <- function(palette = NULL,
                     reverse = FALSE,
                    ...) {
  if (is.null(palette)) {
    palette <- names(sample(aagi_palettes(), size = 1))
  }

  pal <- unname(aagi_palettes()[[palette]])
  if (reverse)
    pal <- rev(pal)
  grDevices::colorRampPalette(pal, ...)
}


#' Construct AAGI Colour Scales for ggplot2
#'
#' Uses AAGI colours to create colour scales suitable for use in
#'   \CRANpkg{ggplot2} objects.
#'
#' @param pal `Character` name of a \acronym{AAGI} palette in [aagi_palettes()].
#'   Defaults to `NULL` and a random selection is made from the five palettes,
#'   \describe{
#'    \item{Primary}{The three primary \acronym{AAGI} colours}
#'    \item{Secondar}{The six secondary support colours in the \acronym{AAGI}
#'        colour palette.}
#'    \item{Bright}{Four \dQuote{bright} colours including,
#'      \dQuote{AAGI Bright Green}, \dQuote{AAGI Turquoise}, \dQuote{AAGI Blue}
#'      and \dQuote{AAGI Yellow}}
#'    \item{Bluegreeen}{Five blue, green or bluegreen \acronym{AAGI} colours
#'      including \dQuote{AAGI Bright Green}, \dQuote{AAGI Turquoise},
#'      \dQuote{AAGI Blue}, \dQuote{AAGI Green} and  \dQuote{AAGI Bluegreen}}
#'    \item{Monochrome Grey}{Three black or grey shades, \dQuote{AAGI Black},
#'      \dQuote{AAGI Dark Grey} and \dQuote{AAGI Light Grey}}
#'  }
#' @param discrete `Boolean` argument indicating whether colour aesthetic is
#'  discrete, _e.g._, a `factor` (`TRUE`) or continuous, *e.g., `numeric`
#'  (`FALSE`).
#' @param reverse `Boolean` argument indicating whether the palette should be
#'   reversed, _i.e._, light to dark.  Defaults to `FALSE`.
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            [ggplot2::scale_colour_gradientn()], used respectively when
#'            discrete is `TRUE`.
#' @export
#'
scale_colour_aagi <-
  function(pal = NULL,
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    if (is.null(palette)) {
      selected_palette <-
        names(sample(theme.aagi::aagi_palettes, size = 1))
    }
    pal <- aagi_palettes()[palette]

    if (discrete) {
      ggplot2::discrete_scale("colour", sprintf("aagi%s", palette),
                              palette = pal, ...)
    } else {
      ggplot2::scale_colour_gradientn(colours = pal(256), ...)
    }
  }

#' Construct AAGI Colour Fill Scales for ggplot2
#'
#' @param palette `Character` name of a \acronym{AAGI} palette in
#'   [aagi_palettes()].  Defaults to `colourful`.
#' @param discrete `Boolean` argument indicating whether colour aesthetic is
#'  discrete, _e.g._, a `factor` (`TRUE`) or continuous, *e.g., `numeric`
#'  (`FALSE`).
#' @param reverse `Boolean` indicating whether the palette should be reversed
#' @param ... Additional arguments passed to [discrete_scale()] or
#'            [scale_fill_gradientn()], used respectively when discrete is
#'            `TRUE` or `FALSE`
#' @seealso [aagi_palettes()]
#' @export
#'
#'
scale_fill_aagi <-
  function(palette = "colourful",
           discrete = TRUE,
           reverse = FALSE,
           ...) {

    pal <- aagi_pal(palette = palette, reverse = reverse)

    if (discrete) {
      ggplot2::discrete_scale(aesthetics = "fill",
                              palette = pal,
                              ...)
    } else {
      ggplot2::scale_fill_gradientn(colours = pal(256), ...)
    }
  }
