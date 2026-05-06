#' Basic Barplots Using a Unified AAGI Style and Typography
#'
#' @description Basic barplots that follow a standard \acronym{AAGI} style
#'   including typography guidelines that uses (hopefully) sensible defaults.
#'   All valid `barplot()` options are supported through `...`, for *e.g.*,
#'   `col` to set the colour.  Defaults to "AAGI Black", a very dark grey
#'   colour.
#'
#' @param height Either a vector or matrix of values describing the bars which
#'   make up the plot.  If height is a vector, the plot consists of a sequence
#'   of rectangular bars with heights given by the values in the vector.  If
#'   height is a matrix and beside is `FALSE` then each bar of the plot
#'   corresponds to a column of height, with the values in the column giving the
#'   heights of stacked sub-bars making up the bar.  If height is a matrix and
#'   beside is `TRUE`, then the values in each column are juxtaposed rather than
#'   stacked.
#' @inheritParams plot_aagi
#'
#' @seealso
#' * [graphics::plot()] for full documentation of the basic plotting
#'   capabilities.
#' * plot_aagi, boxplot_aagi, hist_aagi
#' @family Baseplots
#' @examples
#'
#' barplot_aagi(islands)
#' barplot_aagi(islands, col = "AAGI Orange")
#'
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}
#' @returns A `barplot` object, returned invisibly (see [graphics::barplot()]).
#'
#' @export

barplot_aagi <- function(height, ...) {
  dots <- .normalise_dots_colours(
    list(...),
    defaults = list(col = "AAGI Black", border = "AAGI Black")
  )

  # Optional: warn about unintended recycling
  n_bars <- if (is.matrix(height)) ncol(height) else length(height)
  if (!(length(dots$col) == 1L || length(dots$col) == n_bars)) {
    cli::cli_warn(
    cli::cli_warn(c(
      "{.arg col} has length {length(dots$col)}, but the barplot has {n_bars} bars.",
      "i" = "R will recycle colours; consider supplying length 1 or {n_bars}."
    ))
  }

  withr::local_par(.par_aagi())
  showtext::showtext_begin()
  withr::defer(showtext::showtext_end())

  bp <- do.call(
    graphics::barplot,
    c(
      list(height = height, xaxs = "i"),
      dots
    )
  )
  return(invisible(bp))
}
