#' @title Basic Histograms Using a Unified AAGI Style and Typography
#'
#' @description Basic histograms that follow a standard \acronym{AAGI} style
#'   including typography guidelines that uses (hopefully) sensible defaults.
#'   All valid `hist()` options are supported through `...`, for *e.g.*,
#'   `col` to set the colour. Defaults to "AAGI Black", a very dark grey colour.
#'
#' @param x A vector of values for which the histogram is desired.
#' @param main Main title. Optional, if not supplied it will be blank.
#' @param sub Sub title below x-axis label. Optional, if not supplied it will
#'   be blank.
#' @param xlab X-axis label. Optional, if not supplied will be an empty string.
#' @param ylab Y-axis label. Optional, if not supplied will default to "Count".
#' @param breaks One of "scott" (default), "fd", "sturges" (\R's default), or
#'  "exact" (fixed bin width of 1 for integer.
#'   counts).
#' @inheritParams plot_aagi
#'
#' @seealso
#' * [graphics::hist()] for full documentation of the basic histogram capabilities.
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
#' @returns A `histogram` object, returned invisibly (see [graphics::hist()]).
#' @export
#'

hist_aagi <- function(
  x,
  main = "",
  sub = "",
  xlab = "",
  ylab = "Count",
  breaks = "scott",
  ...
) {
  dots <- .normalise_dots_colours(
    list(...),
    defaults = list(col = "AAGI Black")
  )

  colour <- dots$col
  dots$col <- NULL

  method <- .normalise_hist_breaks(breaks)
  breaks <- .compute_hist_breaks_integer(x, method)

  # Extract panel.first from dots if present (avoid hist.default warning)
  panel_first <- dots$panel.first
  dots$panel.first <- NULL

  withr::local_par(.par_aagi())
  showtext::showtext_begin()
  withr::defer(showtext::showtext_end())

  h <- do.call(
    graphics::hist.default,
    c(
      list(
        x = x,
        col = colour,
        border = colour,
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

  # Apply panel.first manually after histogram is drawn (or draw default grid)
  if (is.null(panel_first)) {
    graphics::grid(nx = NA, ny = NULL, col = NA)
  } else if (is.call(panel_first)) {
    eval(panel_first, envir = parent.frame())
  } else if (is.function(panel_first)) {
    panel_first()
  }

  graphics::axis(side = 1, pos = 0)
  graphics::axis(side = 2, pos = 0)

  return(invisible(h))
}

#' Normalise the `breaks` argument for hist_aagi()
#'
#' @param breaks User-supplied breaks selector.
#' @returns One of "pretty", "scott", or "exact".
#' @keywords internal
.normalise_hist_breaks <- function(breaks) {
  if (
    !is.character(breaks) ||
      length(breaks) != 1L ||
      is.na(breaks) ||
      !nzchar(breaks)
  ) {
    return("pretty")
  }

  breaks <- tolower(breaks)

  if (!breaks %in% c("pretty", "scott", "exact")) {
    cli::cli_alert_warning(
      "Invalid value for {.var breaks}; using {.code pretty}."
    )
    breaks <- "pretty"
  }

  breaks
}

#' Compute safe histogram breaks for integer-count data
#'
#' Provides three strategies:
#' - "pretty": pretty() style breaks (hist default)
#' - "scott": Scott's rule (hist supports this directly)
#' - "exact": fixed bin width of 1 over the data range
#'
#' Includes a guard for constant/degenerate inputs where pretty/scott can fail.
#'
#' @param x Numeric vector.
#' @param method One of "pretty", "scott", "exact".
#' @returns Either a character scalar ("pretty"/"scott") understood by
#'   graphics::hist(), or a numeric vector of breakpoints.
#' @dev
.compute_hist_breaks_integer <- function(x, method) {
  xx <- x[is.finite(x)]
  if (length(xx) == 0L) {
    cli::cli_abort("{.arg x} has no finite values.")
  }

  rng <- range(xx)

  # Degenerate / constant: force a non-zero-width bin so hist() doesn't error
  if (length(xx) < 2L || rng[1L] == rng[2L]) {
    x0 <- rng[1L]
    # For integer counts: make a single width-1 bin centered on x0
    return(c(x0 - 0.5, x0 + 0.5))
  }

  switch(
    method,
    pretty = "pretty",
    scott = "scott",
    exact = {
      # Exact: fixed bin width of 1 for integer-count data.
      # Use half-integer boundaries so each integer value maps to its own bin.
      lo <- floor(rng[1L])
      hi <- ceiling(rng[2L])
      seq(lo - 0.5, hi + 0.5, by = 1)
    }
  )
}
