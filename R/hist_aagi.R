
#' @title Basic Histograms Using a Unified AAGI Style and Typography
#'
#' @description Basic histograms that follow a standard \acronym{AAGI} style
#'   including typography guidelines that uses (hopefully) sensible defaults.
#'
#' @param x a vector of values for which the histogram is desired.
#' @param main Main title.  Optional, if not supplied it will be blank.
#' @param sub Sub title below x-axis label.  Optional, if not supplied it will
#'   be blank.
#' @param xlab X-axis label.  Optional, if not supplied will be taken from data.
#' @param ylab Y-axis label.  Optional, if not supplied will default to "Count".
#' @param breaks Either `pretty`, default, or `exact`.  Pretty uses Scott's
#'   Rule, whereas exact uses a bin-width of 1 so each value is represented
#'   individually with a bar.
#' @param col Colour to use as fill for bars  Defaults to a very dark grey.
#' @param ... Arguments to be passed to methods, such as graphical parameters
#'   (see [graphics::par()]).
#'
#' @seealso [graphics::hist()] for full documentation of the basic histogram
#'  capabilities
#'
#' @references
#' Scott, D.W. (1979) On optimal and data-based histograms. _Biometrika_,
#'   66, 605–610.
#'
#' Hyndman, R.J., The Problem with Sturges' Rule for Constructing Histograms,
#'   1995, Monash University,
#'   \url{https://www.robjhyndman.com/papers/sturges.pdf}.
#'
#' @examples
#'
#' hist_aagi(islands)
#'
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}
#'
#' @export
#'
hist_aagi <- function(x,
                       main = "",
                       sub = "",
                       xlab = "",
                       ylab = "Count",
                       breaks = "pretty",
                       col = AAGIPallets::aagi_colours["AAGI Black"],
                       ...) {

  breaks <- tolower(breaks)

  if (breaks == "pretty") {
    breaks <- "scott"
  } else if (breaks == "exact") {
    # cleanup NAs in `x`
    x <- stats::na.omit(x)
    breaks <- seq(min(x), max(x),
                  by = ((max(x) - min(x)) /
                          (length(x) - 1)))
  } else {
    breaks <- "scott"
    message("You've selected an invalid value for `breaks`, using `pretty`.\n")
  }

  withr::local_par(.new = par_aagi())
  showtext::showtext_begin()
  graphics::hist.default(
    x,
    col = col,
    border = col,
    breaks = breaks,
    panel.first = graphics::grid(
      nx = NA,
      ny = NULL,
      col = NA
    ),
    main = main,
    sub = sub,
    xlab = xlab,
    ylab = ylab,
    xaxt = "n",
    yaxt = "n",
    ...
  )
  graphics::axis(side = 1, pos = 0)
  graphics::axis(side = 2, pos = 0)
  showtext::showtext_end()
}
