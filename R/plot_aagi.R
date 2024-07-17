#' Basic X-Y Plotting Using a Unified AAGI Style and Typography
#'
#' @description Basic X-Y plotting that follows \acronym{AAGI} colour and
#'   typography guidelines that uses (hopefully) sensible defaults.
#'
#' @param x Values to be plotted on x-axis.
#' @param y Values to be used on y-axis.  Optional.
#' @param main Main title text.
#' @param sub Subtitle text below x-axis label.
#' @param xlab X-axis label.  Optional, if blank will default to data supplied
#'   label.
#' @param ylab Y-axis label.  Optional, if blank will default to data supplied
#'   label if one is available.
#' @param xlim Numeric value for x-axis limits.  Optional.
#' @param ylim Numeric value for y-axis limits.  Optional.
#' @param col Colour to use for points  Defaults to "AAGI Black", a very dark
#'   grey.  Can be supplied as a named AAGI colour; *e.g.*, "AAGI Black";
#'   a named colour, "black"; or a hexadecimal code, "#414042".
#' @param pch plotting ‘character’, \emph{i.e.}, symbol to use. This can either
#'   be a single character or an integer code for one of a set of graphics
#'   symbols. The full set of S symbols is available with `pch = 0:18`, see the
#'   examples below. (NB: \R uses circles instead of the octagons used in S.)
#' @param type What type of plot should be drawn.  Defaults to `p` for
#'   **p**oints``  See Section "Type" for more.
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
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}
#'
#' @export
#'
plot_aagi <- function(x,
                      y = NULL,
                      main = "",
                      sub = "",
                      xlab = "",
                      ylab = "",
                      xlim = NULL,
                      ylim = NULL,
                      col = "AAGI Black",
                      pch = 16,
                      type = "p",
                      ...) {
  # only validate if the colour is an official AAGI colour and convert to hex
  if (substr(col, 1, 5) == "AAGI ") {
    # validation/matching is done in {AAGIPalettes} so not needed here
    col <- AAGIPalettes::colour_as_hex(col)
  }
  if (!missing(xlab)) {
    xlab <- ""
  }
  if (!missing(ylab)) {
    ylab <- ""
  }

  # set new pars
  withr::local_par(.new = par_aagi())

  xy <- grDevices::xy.coords(x, y)
  if (is.null(xlim)) {
    xlimit <- range(xy$x[is.finite(xy$x)])
  }
  if (is.null(ylim)) {
    ylimit <- range(xy$y[is.finite(xy$y)])
  }
  graphics::plot.new()
  showtext::showtext_begin()
  graphics::plot(NULL,
    xlab = xlab,
    ylab = ylab,
    xlim = xlimit,
    ylim = ylimit,
    pch = "",
    main = main,
    sub = sub
  )
  graphics::points(xy$x, xy$y, col = col, pch = pch, type = type)
  graphics::axis(
    col = "#414042",
    lty = "solid",
    side = 1
  )
  graphics::axis(
    col = "#414042",
    lty = "solid",
    side = 2
  )
  showtext::showtext_end()
}
