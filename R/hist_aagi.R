#' @title Basic Histograms Using a Unified AAGI Style and Typography
#'
#' @description Basic histograms that follow a standard \acronym{AAGI} style
#'   including typography guidelines that uses (hopefully) sensible defaults.
#'   All valid `boxplot()` options are supported through `...`, for *e.g.*,
#'   `col` to set the colour.  Defaults to "AAGI Black", a very dark grey
#'   colour.
#'
#' @param x a vector of values for which the histogram is desired.
#' @param main Main title.  Optional, if not supplied it will be blank.
#' @param sub Sub title below x-axis label.  Optional, if not supplied it will
#'   be blank.
#' @param xlab X-axis label.  Optional, if not supplied will be an empty string
#'   with no value.
#' @param ylab Y-axis label.  Optional, if not supplied will default to "Count".
#' @param breaks Either `pretty`, default, or `exact`.  Pretty uses Scott's
#'   Rule, whereas exact uses a bin-width of 1 so each value is represented
#'   individually with a bar.
#' @inheritParams plot_aagi
#'
#' @seealso
#' * [graphics::hist()] for full documentation of the basic histogram
#'  capabilities.
#' * barplot_aagi, boxplot_aagi, plot_aagi
#' @family Baseplots
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
#' @returns Called for its side effect of creating a histogram with the
#' \acronym{AAGI} style.
#' @export
#'

hist_aagi <- function(
  x,
  main = "",
  sub = "",
  xlab = "",
  ylab = "Count",
  breaks = "pretty",
  ...
) {
  # Validate/default colour (base R)
  if (!is.character(col) || length(col) != 1L || is.na(col) || !nzchar(col)) {
    col <- "AAGI Black"
  }
  col <- .convert_aagi_colour(col)

  # Validate/default breaks (base R)
  if (
    !is.character(breaks) ||
      length(breaks) != 1L ||
      is.na(breaks) ||
      !nzchar(breaks)
  ) {
    breaks <- "pretty"
  }
  breaks <- tolower(breaks)

  if (!breaks %in% c("exact", "pretty", "scott")) {
    cli::cli_alert_warning(
      "You've selected an invalid value for {.var breaks}, using {.code pretty}."
    )
    breaks <- "pretty"
  }

  # Calculate breaks based on method
  breaks <- switch(
    breaks,
    exact = {
      xx <- stats::na.omit(x)
      if (length(xx) < 2L) {
        # Fall back; exact breaks don't make sense with <2 points
        "pretty"
      } else {
        seq(min(xx), max(xx), by = (max(xx) - min(xx)) / (length(xx) - 1L))
      }
    },
    pretty = "pretty",
    scott = "scott"
  )

  # Extract panel.first from ... if present
  dots <- list(...)
  panel_first <- dots$panel.first
  dots$panel.first <- NULL

  withr::local_par(.par_aagi())

  showtext::showtext_begin()
  withr::defer(showtext::showtext_end())

  # Create the histogram without panel.first (to avoid warnings)
  h <- do.call(
    graphics::hist.default,
    c(
      list(
        x = x,
        col = col,
        border = col,
        breaks = breaks,
        main = main,
        sub = sub,
        xlab = xlab,
        ylab = ylab,
        xaxt = "n",
        yaxt = "n"
      ),
      dots
    )
  )

  # Apply panel.first manually after histogram is drawn
  if (!is.null(panel_first)) {
    if (is.call(panel_first)) {
      eval(panel_first, envir = parent.frame())
    } else if (is.function(panel_first)) {
      panel_first()
    }
  } else {
    graphics::grid(nx = NA, ny = NULL, col = NA)
  }

  graphics::axis(side = 1, pos = 0)
  graphics::axis(side = 2, pos = 0)

  invisible(h)
}
