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
#' @param col Colour to use as fill for boxes  Defaults to white.  Can be
#'   supplied as a named AAGI colour, *e.g.*, "AAGI Orange"; named colour,
#'   "Orange"; or or a hexadecimal code, *e.g.*, "#ec8525".
#' @param pch plotting 'character', \emph{i.e.}, symbol to use.
#' @param ... Arguments to be passed to methods, such as graphical parameters
#'   (see [graphics::par()]).
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
#' @returns Called for its side effect of creating a boxplot with the
#'  \acronym{AAGI} style.
#' @export
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}

boxplot_aagi <- function(
  x,
  main = "",
  sub = "",
  xlab = "",
  ylab = "",
  col = "white",
  pch = 16,
  ...
) {
  # Validate and convert colour
  if (!rlang::is_scalar_character(col)) {
    col <- "white"
  }
  col <- .convert_aagi_colour(col)

  # set new pars
  withr::local_par(.new = par_aagi())
  graphics::plot.new()
  showtext::showtext_begin()
  on.exit(showtext::showtext_end(), add = TRUE)

  graphics::boxplot(
    x,
    col = scales::alpha(col, 0.5),
    border = AAGIPalettes::colour_as_hex("AAGI Black"),
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
    pch = pch,
    ...
  )
}
