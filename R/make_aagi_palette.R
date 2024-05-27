
#' Interpolate an AAGI Colour Palette
#'
#' This function takes a \acronym{AAGI} colour palette and generates more
#'   colours from it, so that there are enough to make your chart.
#'
#' The interpolation method is set to `spline` (the default is `linear`) in an
#'   attempt to reduce the number of vomit colours that get produced when
#'   generating many colours.
#'
#'
#' @param palette (`character`; default = `graph`) given name of an
#'   \acronym{AAGI} palette: [make_aagi_palettes()]
#' @param reverse (`Boolean`; default = `FALSE`) indicating if palette should
#'   be reverse
#' @param ... Additional arguments to pass to [grDevices::colorRampPalette()],
#'   see details here [grDevices::colorRamp()].
#'
#' @returns A function that takes a single value and makes that many colours.
#'
#' @seealso aagi_palettes
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = mpg, y = hp, colour = as.character(wt))) +
#'   geom_point() +
#'   scale_colour_manual(values = make_aagi_palette()(29))
#'
#' @export
make_aagi_palette <- function(make_aagi_palette = c("colourful",
                                                         "primary",
                                                         "secondary",
                                                         "sequential",
                                                         "diverging"),
                                   reverse = FALSE,
                                   ...) {
  rlang::arg_match(make_aagi_palette)

  pal <- make_aagi_palette[[make_aagi_palette]]

  if (reverse)
    pal <- rev(pal)

  grDevices::colorRampPalette(pal, ..., interpolate = "spline")
}
