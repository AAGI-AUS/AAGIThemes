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
