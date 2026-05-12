#' Apply AAGI theme and default scales to a ggplot2 object
#'
#' Convenience wrapper that applies [theme_aagi()], [scale_colour_aagi()] and
#' [scale_fill_aagi()] together.
#'
#' @param palette Character name of a palette supported by
#'   [AAGIPalettes::aagi_palettes()]. If `NULL` and `discrete = TRUE`, use the
#'   official colours in [AAGIPalettes::aagi_colours].
#' @param discrete Logical; if `TRUE`, use discrete colour/fill scales.
#'   Defaults to `TRUE`.
#' @param reverse Logical; if `TRUE`, reverse the palette order.
#' @param colours Character vector of official \acronym{AAGI} colour names used
#'   for continuous interpolation. Ignored for default discrete scales unless
#'   `discrete = FALSE`.
#' @param ... Arguments passed to [theme_aagi()].
#'
#' @return A list of \CRANpkg{ggplot} components that can be added with `+`.
#'
#' @examples
#' library(ggplot2)
#'
#' # Default AAGI theme + official AAGI discrete colours
#' ggplot(mtcars, aes(wt, mpg, colour = factor(cyl), fill = factor(cyl))) +
#'   geom_point(shape = 21, size = 3) +
#'   use_aagi_style()
#'
#' # Use a named palette instead
#' ggplot(mtcars, aes(wt, mpg, colour = factor(cyl), fill = factor(cyl))) +
#'   geom_point(shape = 21, size = 3) +
#'   use_aagi_style(palette = "aagi_RdTl")
#'
#' # Continuous colours
#' ggplot(mtcars, aes(wt, mpg, colour = hp)) +
#'   geom_point(size = 3) +
#'   use_aagi_style(discrete = FALSE)
#'
#' @export
use_aagi_style <- function(
  palette = NULL,
  discrete = TRUE,
  reverse = FALSE,
  colours = NULL,
  ...
) {
  list(
    theme_aagi(...),
    scale_colour_aagi(
      palette = palette,
      discrete = discrete,
      reverse = reverse,
      colours = colours
    ),
    scale_fill_aagi(
      palette = palette,
      discrete = discrete,
      reverse = reverse,
      colours = colours
    )
  )
}

.aagi_default_colour_order <- function() {
  c(
    "AAGI Bright Green",
    "AAGI Blue",
    "AAGI Orange",
    "AAGI Green",
    "AAGI Yellow",
    "AAGI Black",
    "AAGI Teal",
    "AAGI Grey"
  )
}

.aagi_default_colours <- function(reverse = FALSE) {
  vals <- unname(AAGIPalettes::aagi_colours[.aagi_default_colour_order()])

  if (isTRUE(reverse)) {
    vals <- rev(vals)
  }

  vals
}
