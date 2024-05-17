#' Construct AAGI Colour Scales for ggplot2
#'
#' Uses AAGI colours to create colour scales suitable for use in
#'   \CRANpkg{ggplot2} objects.
#'
#' @param make_aagi_palette `Character` name of a \acronym{AAGI} palette in
#'   [make_aagi_palettes()].  Defaults to `colourful`.
#'
#' ## Available Palettes
#'
#'  \describe{
#'    \item{primary}{The three primary \acronym{AAGI} colours}
#'    \item{secondary}{The three secondary support colours in the \acronym{AAGI}
#'        colour palette}
#'    \item{full}{The full set of all six colours in the \acronym{AAGI}
#'        palette}
#'    \item{colourful}{All colours in the palette minus \dQuote{AAGI Black}}
#'    \item{bright}{Four \dQuote{bright} colours including,
#'      \dQuote{AAGI Bright Green}, \dQuote{AAGI Blue} and \dQuote{AAGI Yellow}}
#'    \item{bluegreeen}{Three blue, green or bluegreen \acronym{AAGI} colours
#'      including \dQuote{AAGI Bright Green}, \dQuote{AAGI Turquoise},
#'      \dQuote{AAGI Blue}, \dQuote{AAGI Green} and \dQuote{AAGI Bluegreen}}
#'  }

#' @param discrete `Boolean` argument indicating whether colour aesthetic is
#'  discrete, _e.g._, a `factor` (`TRUE`) or continuous, _e.g._, `numeric`
#'  (`FALSE`).
#' @param reverse `Boolean` argument indicating whether the palette should be
#'   reversed, _i.e._, light to dark.  Defaults to `FALSE`.
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            [ggplot2::scale_colour_gradientn()], used respectively when
#'            discrete is `TRUE`.
#'
#' @seealso [make_aagi_palettes()] [scale_fill_aagi()]
#' @export
#'
scale_colour_aagi <-
  function(make_aagi_palette = "colourful",
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    selected_pal <- make_aagi_palette()[palette]

    if (discrete) {
      ggplot2::discrete_scale("colour",
                              sprintf("aagi%s", selected_pal),
                              palette = selected_pal, ...)
    } else {
      ggplot2::scale_colour_gradientn(colours = make_aagi_palette(n = 256), ...)
    }
  }

#' Construct AAGI Colour Fill Scales for ggplot2
#'
#' Uses AAGI colours to create fill colour scales suitable for use in
#'   \CRANpkg{ggplot2} objects.
#'
#' @inherit scale_colour_aagi params
#' @seealso [make_aagi_palettes()] [scale_colour_aagi()]
#' @export
#'
#'
scale_fill_aagi <-
  function(make_aagi_palette = "colourful",
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    selected_pal <- make_aagi_palette(palette = make_aagi_palette, reverse = reverse)

    if (discrete) {
      ggplot2::discrete_scale(aesthetics = "fill", palette = selected_pal, ...)
    } else {
      ggplot2::scale_fill_gradientn(colours = make_aagi_palette(n = 256), ...)
    }
  }
