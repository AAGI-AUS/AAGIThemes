#' Basic X-Y Plotting Using a Unified AAGI Style and Typography
#'
#' @description Basic X-Y plotting that follows \acronym{AAGI} colour and
#'   typography guidelines that uses (hopefully) sensible defaults.
#'
#' @param x the coordinates of points in the plot. Alternatively, a single
#'  plotting structure, function or any \R _object with a plot method_ can be
#'  provided.
#' @param ... Arguments to be passed to methods, such as graphical parameters
#'   (see [graphics::par()]).  The most commonly used argument would be
#'   `y` for the factor to use for the y-axis, `type` describing what type of
#'   plot should be drawn, or `col` for point colour (defaults to AAGI Black).
#'
#' @seealso [graphics::plot()] for full documentation of the basic plotting
#'  capabilities.
#' @examples
#' library(datasets)
#'
#' plot_aagi(airquality$Ozone,
#'   main = "Air Quality",
#'   xlab = "Ozone"
#' )
#'
#' plot_aagi(pressure)
#'
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}
#' @returns Called for its side effect of creating a plot with the
#' \acronym{AAGI} style.
#' @export
#'
plot_aagi <- function(x, ...) {
  # Extract ... into a list to manipulate col
  dots <- list(...)

  # Handle col parameter: default to AAGI Black and convert
  if (is.null(dots$col)) {
    dots$col <- "AAGI Black"
  }

  # Validate col is scalar character
  if (!rlang::is_scalar_character(dots$col)) {
    dots$col <- "AAGI Black"
  }

  # Convert AAGI colour names to hex
  dots$col <- .convert_aagi_colour(dots$col)

  withr::local_par(par_aagi())
  showtext::showtext_begin()
  on.exit(showtext::showtext_end(), add = TRUE)

  # Use do.call with explicit col handling for formula support
  if (rlang::is_formula(x)) {
    # For formula interface, construct the call carefully
    graphics::plot(x, col = dots$col, ...)
  } else {
    # For regular interface, use do.call
    do.call(graphics::plot, c(list(x = x), dots))
  }
}
