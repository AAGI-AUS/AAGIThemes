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
#'   plot should be drawn, or `col` for point colour (defaults to AAGI Black),
#'   a very dark grey.
#'
#' @seealso
#' * [graphics::plot()] for full documentation of the basic plotting
#'   capabilities.
#' * barplot_aagi, boxplot_aagi, hist_aagi
#' @family Baseplots
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

plot_aagi <- function(x, ...) {
  dots <- .normalise_dots_colours(
    list(...),
    defaults = list(col = "AAGI Black")
  )

  withr::local_par(.par_aagi())
  showtext::showtext_begin()
  withr::defer(showtext::showtext_end())

  do.call(graphics::plot, c(list(x = x), dots))
}
