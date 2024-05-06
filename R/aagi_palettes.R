
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


#' Interpolate an AAGI Colourway or Palette
#'
#' @param colourway `Character` name of a \acronym{AAGI} colourway in
#'   `aagicolourways()`.  Defaults to `NULL` returning a randomly selected
#'   colourway.
#' @param reverse `Boolean` argument indicating whether the colourway should be
#'   reversed.  Defaults to `FALSE`.
#' @param ... Additional arguments to pass to `colorRampPalette()`.
#'
#' @export
aagipal <- function(colourway = NULL,
                    reverse = FALSE,
                    ...) {
  if (is.null(colourway)) {
    colourway <- names(sample(theme.aagi::aagi_colourways, size = 1))
  }

  pal <- theme.aagi::aagi_colourways[[colourway]]
  if (reverse)
    pal <- rev(pal)
  grDevices::colorRampPalette(pal, ...)
}


#' Construct AAGI Colour Scales for ggplot2
#'
#' Uses AAGI colours to create colour scales suitable for use in
#'   \CRANpkg{ggplot2} objects.
#'
#' @param colourway `Character` name of a \acronym{AAGI} colourway in
#'   `aagi_colourways`.  Defaults to `NULL` and a random selection is made from
#'   the three colourways, red, blue or green.
#' @param discrete `Boolean` argument indicating whether colour aesthetic is
#'  discrete, *e.g.*, a `factor` (`TRUE`) or continuous, *e.g., `numeric`
#'  (`FALSE`).
#' @param reverse `Boolean` argument indicating whether the palette should be
#'   reversed.  Defaults to `FALSE`.
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_colour_gradientn()`, used respectively when discrete is
#'            `TRUE` or `FALSE`.
#' @export
#'
scale_colour_aagi <-
  function(colourway = NULL,
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    if (is.null(colourway)) {
      colourway <-
        names(sample(theme.aagi::aagi_colourways, size = 1))
    }
    pal <- aagi_pal(colourway = colourway, reverse = reverse)

    if (discrete) {
      ggplot2::discrete_scale("colour", sprintf("aagi%s", colourway),
                              palette = pal, ...)
    } else {
      ggplot2::scale_colour_gradientn(colours = pal(256), ...)
    }
  }

#' Construct AAGI Colour Fill Scales for ggplot2
#'
#' @param colourway `Character` name of a \acronym{AAGI} colourway in
#'   `aagi_colourways`.  Defaults to `NULL` and a random selection is made from
#'   the three colourways, red, blue or green.
#' @param discrete `Boolean` argument indicating whether colour aesthetic is
#'  discrete, *e.g.*, a `factor` (`TRUE`) or continuous, *e.g., `numeric`
#'  (`FALSE`).
#' @param reverse `Boolean` indicating whether the palette should be reversed
#' @param ... Additional arguments passed to `discrete_scale()` or
#'            `scale_fill_gradientn()`, used respectively when discrete is
#'            `TRUE` or `FALSE`
#' @export
#'
scale_fill_aagi <-
  function(colourway = "AAGI blue",
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    if (is.null(colourway)) {
      colourway <- sample(theme.aagi::aagi_colourways, size = 1)
    }

    pal <- aagi_pal(colourway = colourway, reverse = reverse)

    if (discrete) {
      ggplot2::discrete_scale("fill", sprintf("aagi%s", colourway),
                              palette = pal, ...)
    } else {
      ggplot2::scale_fill_gradientn(colours = pal(256), ...)
    }
  }
