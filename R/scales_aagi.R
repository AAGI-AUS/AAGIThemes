#' Scale constructors for AAGI colour palettes
#'
#' Helpers for applying \acronym{AAGI} colour palettes to \CRANpkg{ggplot2}
#' colour and fill aesthetics.
#'
#' For discrete scales, colours are taken from
#' [AAGIPalettes::aagi_palettes()].
#'
#' For continuous scales, colours are interpolated using
#' [AAGIPalettes::interpolate_aagi_colours()].
#'
#' @param palette Character name of palette to use. This should be one of the
#'   palette names supported by [AAGIPalettes::aagi_palettes()], such as
#'   `"aagi_RdTl"`, `"aagi_TlGnYl"` or `"aagi_blues"`.
#' @param discrete Logical; should the scale be discrete? Defaults to `TRUE`.
#' @param reverse Logical; should the palette order be reversed? Defaults to
#'   `FALSE`.
#' @param colours Character vector of official AAGI colour names to interpolate
#'   for continuous scales. If `NULL`, defaults used by
#'   [AAGIPalettes::interpolate_aagi_colours()] are applied.
#' @param ... Additional arguments passed to the underlying `ggplot2` scale
#'   functions.
#'
#' @details
#' For discrete scales, the number of colours requested is determined by the
#' number of levels in the mapped variable.
#'
#' For continuous scales, `palette` is ignored and interpolated colours are used.
#' If you want to control the continuous gradient directly, supply `colours`.
#'
#' @describeIn scale_colour_aagi For colour scales
#' @export
scale_colour_aagi <- function(
  palette = "aagi_RdTl",
  discrete = TRUE,
  reverse = FALSE,
  colours = NULL,
  ...
) {
  direction <- if (isTRUE(reverse)) -1 else 1

  if (isTRUE(discrete)) {
    pal <- function(n) {
      AAGIPalettes::aagi_palettes(
        name = palette,
        n = n,
        direction = direction
      )
    }

    ggplot2::discrete_scale(
      aesthetics = "colour",
      palette = pal,
      ...
    )
  } else {
    pal <- if (is.null(colours)) {
      AAGIPalettes::interpolate_aagi_colours(direction = direction)
    } else {
      AAGIPalettes::interpolate_aagi_colours(
        colours = colours,
        direction = direction
      )
    }

    ggplot2::scale_colour_gradientn(
      colours = pal(256L),
      ...
    )
  }
}

#' @describeIn scale_colour_aagi For fill scales
#' @export
scale_fill_aagi <- function(
  palette = "aagi_RdTl",
  discrete = TRUE,
  reverse = FALSE,
  colours = NULL,
  ...
) {
  direction <- if (isTRUE(reverse)) -1 else 1

  if (isTRUE(discrete)) {
    pal <- function(n) {
      AAGIPalettes::aagi_palettes(
        name = palette,
        n = n,
        direction = direction
      )
    }

    ggplot2::discrete_scale(
      aesthetics = "fill",
      palette = pal,
      ...
    )
  } else {
    pal <- if (is.null(colours)) {
      AAGIPalettes::interpolate_aagi_colours(direction = direction)
    } else {
      AAGIPalettes::interpolate_aagi_colours(
        colours = colours,
        direction = direction
      )
    }

    ggplot2::scale_fill_gradientn(
      colours = pal(256L),
      ...
    )
  }
}

### Deprecated helpers ###

#' Convenient functions to set AAGI colour palettes
#'
#' These functions are retained for compatibility. New code should prefer
#' [scale_colour_aagi()] and [scale_fill_aagi()].
#'
#' @param n Numeric. The number of levels in your colour scale.
#' @param reverse Logical; if `TRUE`, reverse the palette order.
#' @param discrete Logical; if `TRUE`, generate a discrete scale, otherwise a
#'   continuous scale.
#' @param palette Character name of palette passed to
#'   [AAGIPalettes::aagi_palettes()] for discrete scales.
#' @param colours Character vector of official AAGI colour names used for
#'   interpolation when `discrete = FALSE`.
#' @param ... Arguments passed to ggplot2 scales.
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'   geom_point() +
#'   aagi_colour_manual() +
#'   theme_aagi()
#'
#' @name aagi_scale
#' @aliases NULL
NULL

#' @rdname aagi_scale
#' @export
# nocov start
aagi_colour_manual <- function(
  n = 5,
  reverse = FALSE,
  discrete = TRUE,
  palette = "aagi_RdTl",
  colours = NULL,
  ...
) {
  lifecycle::deprecate_warn(
    when = "2.0.0",
    what = "aagi_colour_manual()",
    with = "scale_colour_aagi()"
  )

  direction <- if (isTRUE(reverse)) -1 else 1

  if (isTRUE(discrete)) {
    vals <- AAGIPalettes::aagi_palettes(
      name = palette,
      n = n,
      direction = direction
    )

    return(ggplot2::scale_colour_manual(values = vals, ...))
  }

  pal <- if (is.null(colours)) {
    AAGIPalettes::interpolate_aagi_colours(direction = direction)
  } else {
    AAGIPalettes::interpolate_aagi_colours(
      colours = colours,
      direction = direction
    )
  }

  ggplot2::scale_colour_gradientn(colours = pal(256L), ...)
}

#' @rdname aagi_scale
#' @export
aagi_fill_manual <- function(
  n = 5,
  reverse = FALSE,
  discrete = TRUE,
  palette = "aagi_RdTl",
  colours = NULL,
  ...
) {
  lifecycle::deprecate_warn(
    when = "2.0.0",
    what = "aagi_fill_manual()",
    with = "scale_fill_aagi()"
  )

  direction <- if (isTRUE(reverse)) -1 else 1

  if (isTRUE(discrete)) {
    vals <- AAGIPalettes::aagi_palettes(
      name = palette,
      n = n,
      direction = direction
    )

    return(ggplot2::scale_fill_manual(values = vals, ...))
  }

  pal <- if (is.null(colours)) {
    AAGIPalettes::interpolate_aagi_colours(direction = direction)
  } else {
    AAGIPalettes::interpolate_aagi_colours(
      colours = colours,
      direction = direction
    )
  }

  ggplot2::scale_fill_gradientn(colours = pal(256L), ...)
}
# nocov end
