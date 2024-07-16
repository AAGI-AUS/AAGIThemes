
#' Basic Boxplots Using a Unified AAGI Style and Typography
#'
#' Basic boxplots that follow \acronym{AAGI} colour and typography guidelines
#'   that uses (hopefully) sensible defaults.
#'
#' @param x for specifying data from which the boxplots are to be produced.
#'   Either a numeric vector, or a single list containing such vectors.
#'   Additional unnamed arguments specify further data as separate vectors (each
#'   corresponding to a component boxplot).  `NA`s are allowed in the data.
#' @param main Main title.  Optional, if not supplied it will be blank.
#' @param sub Sub title below x-axis label.  Optional, if not supplied it will
#'   be blank.
#' @param xlab X-axis label.  Optional.
#' @param ylab Y-axis label.  Optional.
#' @param col Colour to use as fill and outline for boxes.  Defaults to white.
#' @param pch plotting ‘character’, \emph{i.e.}, symbol to use. This can either
#'   be a single character or an integer code for one of a set of graphics
#'   symbols. The full set of S symbols is available with `pch = 0:18`, see the
#'   examples below. (NB: \R uses circles instead of the octagons used in S.)
#'   Value `pch = "."` (equivalently `pch = 46`) is handled specially. It is a
#'   rectangle of side 0.01 inch (scaled by `cex`). In addition, if `cex = 1`
#'   (the default), each side is at least one pixel (1/72 inch on the
#'   [grDevices::pdf()], [grDevices::postscript()] and [grDevices::xfig()]
#'   devices).
#'   For other text symbols, `cex = 1` corresponds to the default font size of
#'   the device, often specified by an argument `pointsize`. For `pch` in 0:25
#'   the default size is about 75% of the character height (see `par("cin")`).
#' @param ... Arguments to be passed to methods, such as graphical parameters
#'   (see [graphics::par()]).
#'
#' @seealso [graphics::boxplot()] for full documentation of the basic boxplot
#'    capabilities
#' @examples
#' boxplot_aagi(decrease ~ treatment,
#'              data = OrchardSprays,
#'              xlab = "treatment",
#'              ylab = "decrease")
#' @export
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}

boxplot_aagi <- function(x,
                          main = "",
                          sub = "",
                          xlab = "",
                          ylab = "",
                          col = "white",
                          pch = 16,
                          ...) {

  # set new pars
  withr::local_par(.new = par_aagi())

  graphics::plot.new()
  graphics::grid(
    nx = NA,
    ny = NULL,
    col = NA
  )
  withr::local_par(new = TRUE)
  showtext::showtext_begin()
  graphics::boxplot(
    x,
    col = scales::alpha(col, 0.5),
    border = AAGIPallets::aagi_colours["AAGI Black"],
    pars = list(
      boxwex = 0.8,
      staplelty = 0,
      outwex = 0.5,
      cex = 1,
      whisklty = "solid"
    ),
    title = list(line = 2),
    main = main,
    sub = sub,
    xlab = xlab,
    ylab = ylab,
    pch = pch,
    ...
  )
  showtext::showtext_end()
}
