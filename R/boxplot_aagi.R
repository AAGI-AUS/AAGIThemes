#' Basic Boxplots Using a Unified AAGI Style and Typography
#'
#' @description Basic boxplots that follow a standard \acronym{AAGI} style
#'   including typography guidelines that uses (hopefully) sensible defaults.
#'   All valid `boxplot()` options are supported through `...`, for *e.g.*,
#'   `col` to set the colour.  Defaults to "AAGI Black", a very dark grey
#'   colour.
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
#' @param pch plotting 'character', \emph{i.e.}, symbol to use.
#' @inheritParams plot_aagi
#'
#' @seealso
#'  * [graphics::boxplot()] for full documentation of the basic boxplot
#'    capabilities, and
#'  * [graphics::par()] for full documentation of `pch`.
#' @examples
#' boxplot_aagi(decrease ~ treatment,
#'   data = OrchardSprays,
#'   xlab = "treatment",
#'   ylab = "decrease"
#' )
#'
#' @seealso
#' * [graphics::boxplot()] for full documentation of the basic plotting
#'   capabilities.
#' * barplot_aagi, hist_aagi, plot_aagi
#' @family Baseplots
#' @returns A `boxplot` object, returned invisibly (see [graphics::boxplot()]).
#' @export
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}

boxplot_aagi <- function(
  x,
  main = "",
  sub = "",
  xlab = "",
  ylab = "",
  pch = 16,
  ...
) {
  dots <- .normalise_dots_colours(
    list(...),
    defaults = list(col = "white", border = "AAGI Black")
  )

  colour <- dots$col
  border <- dots$border
  dots$col <- NULL
  dots$border <- NULL

  withr::local_par(.par_aagi())
  showtext::showtext_begin()
  withr::defer(showtext::showtext_end())

  bx <- do.call(
    graphics::boxplot,
    c(
      list(
        x,
        col = grDevices::adjustcolor(colour, 0.5),
        border = border,
        boxwex = 0.8,
        staplelty = 0,
        outwex = 0.5,
        cex = 1,
        whisklty = "solid",
        title = list(line = 2),
        main = main,
        sub = sub,
        xlab = xlab,
        ylab = ylab,
        pch = pch
      ),
      dots
    )
  )
  return(invisible(bx))
}
