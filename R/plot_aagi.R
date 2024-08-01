#' Basic X-Y Plotting Using a Unified AAGI Style and Typography
#'
#' @description Basic X-Y plotting that follows \acronym{AAGI} colour and
#'   typography guidelines that uses (hopefully) sensible defaults.
#'
#' @param x the coordinates of points in the plot. Alternatively, a single
#'  plotting structure, function or any \R _object with a plot method_ can be
#'  provided.
#' @param y coordinates of points in the plot, optional if `x`` is an
#'  appropriate structure.
#' @param ... Arguments to be passed to methods, such as graphical parameters
#'   (see [graphics::par()]).  The most commonly used argument would be
#'   `type` what type of plot should be drawn.
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
#'
#' @export
#'
plot_aagi <- function(x,
                      y,
                      ...) {

  if (is.null(col)) {
    # validation/matching is done in {AAGIPalettes} so not needed here
    col2 <- AAGIPalettes::colour_as_hex("AAGI Black")
  } else {
    col2 <- col
  }

  withr::local_par(.new = par_aagi())
  showtext::showtext_begin()
  graphics::plot(x, y, ...)
  showtext::showtext_end()
}
