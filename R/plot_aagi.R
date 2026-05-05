#' Basic X-Y Plotting Using a Unified AAGI Style and Typography
#'
#' @description Basic X-Y plotting that follows \acronym{AAGI} colour and
#'   typography guidelines that uses (hopefully) sensible defaults.
#'
#' @param x the coordinates of points in the plot. Alternatively, a single
#'  plotting structure, function or any \R _object with a plot method_ can be
#'  provided.
#' @param col Colour to use as fill for bars  Defaults to a very dark grey,
#'  *i.e.*, "AAGI Black".
#' @param ... Arguments to be passed to methods, such as graphical parameters
#'   (see [graphics::par()]).  The most commonly used argument would be
#'   `y` for the factor to use for the y-axis or `type` describing what type of
#'   plot should be drawn.
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
plot_aagi <- function(x, col = NULL, ...) {
  # Set default colour and convert
  col <- col %||% "AAGI Black"
  col <- .convert_aagi_colour(col)

  withr::local_par(par_aagi())
  showtext::showtext_begin()
  on.exit(showtext::showtext_end(), add = TRUE)

  graphics::plot(x, col = col, ...)
}
