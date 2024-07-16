
#' Basic Barplots Using a Unified AAGI Style and Typography
#'
#' @description Basic barplots that follow a standard \acronym{AAGI} style
#'   including typography guidelines that uses (hopefully) sensible defaults.
#'
#' @param height Either a vector or matrix of values describing the bars which
#'   make up the plot.  If height is a vector, the plot consists of a sequence
#'   of rectangular bars with heights given by the values in the vector.  If
#'   height is a matrix and beside is `FALSE` then each bar of the plot
#'   corresponds to a column of height, with the values in the column giving the
#'   heights of stacked sub-bars making up the bar.  If height is a matrix and
#'   beside is `TRUE`, then the values in each column are juxtaposed rather than
#'   stacked.
#' @param col Colour to use as fill for bars  Defaults to a very dark grey.
#' @param ... Arguments to be passed to methods, such as graphical parameters
#'   (see [graphics::par()]).
#'
#' @examples
#'
#' barplot_aagi(islands)
#'
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}
#'
#' @export
#'
barplot_aagi <- function(height,
                          col = AAGIPallets::aagi_colours["AAGI Black"],
                          ...) {

  withr::local_par(.new = par_aagi())

  graphics::plot.new()
  withr::local_par(new = TRUE)
  showtext::showtext_begin()
  graphics::barplot(height = height,
                    col = col,
                    border = col,
                    xaxs = "i",
                    ...)
  showtext::showtext_end()
}
