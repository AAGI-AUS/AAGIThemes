#' Basic X-Y Plotting Using a Unified AAGI Style and Typography
#'
#' @description Basic X-Y plotting that follows \acronym{AAGI} colour and
#'   typography guidelines that uses (hopefully) sensible defaults.
#'
#' @inheritParams graphics::plot
#' @param ... Arguments to be passed to methods, such as graphical parameters
#'   (see [graphics::par()]).  The most commonly used argument would be
#'   `type` what type of plot should be drawn.
# "
#' @section Type:
#' Possible types are:
#'    \describe{
#'      \item{\dQuote{p}}{for **p**oints}
#'      \item{\dQuote{l}}{for **l**ines}
#'      \item{\dQuote{b}}{for **b**oth}
#'      \item{\dQuote{c}}{for the lines part alone of \dQuote{**b**}}
#'      \item{\dQuote{o}}{for both \sQuote{**o**verplotted}}
#'      \item{\dQuote{h}}{for \sQuote{**h**istogram} like (or
#'        \sQuote{**h**igh-density}) vertical lines}
#'      \item{\dQuote{s}}{for stair **s**teps}
#'      \item{\dQuote{n}}{for **n**o plotting}
#'    }
#'
#' Value `pch = "."` (equivalently `pch = 46`) is handled specially. It is a
#'   rectangle of side 0.01 inch (scaled by `cex`). In addition, if `cex = 1`
#'   (the default), each side is at least one pixel (1/72 inch on the
#'   [grDevices::pdf()], [grDevices::postscript()] and [grDevices::xfig()]
#'   devices).
#'
#' For other text symbols, `cex = 1` corresponds to the default fontsize of the
#'   device, often specified by an argument `pointsize`. For `pch` in 0:25 the
#'   default size is about 75% of the character height (see `par("cin")`).
#'
#' @seealso
#' [graphics::plot()] for full documentation of the basic plotting capabilities.
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
                      col = NULL,
                      pch = 16,
                      ...) {

  if (is.null(col)) {
    # validation/matching is done in {AAGIPalettes} so not needed here
    col2 <- AAGIPalettes::colour_as_hex("AAGI Black")
  } else {
    col2 <- col
  }

  withr::local_par(.new = par_aagi())
  showtext::showtext_begin()
  graphics::plot(x, col = col2, pch = pch, ...)
  showtext::showtext_end()
}
