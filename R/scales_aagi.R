#' Scale constructors for AAGI colour palettes
#'
#' Helpers for applying \acronym{AAGI} colour palettes to \CRANpkg{ggplot2}
#' colour and fill aesthetics.
#'
#' By default, discrete scales use the official colours in
#' [AAGIPalettes::aagi_colours]. If `palette` is supplied, discrete scales use a
#' named palette from [AAGIPalettes::aagi_palettes()].
#'
#' Continuous scales use interpolated colours via
#' [AAGIPalettes::interpolate_aagi_colours()].
#'
#' @param palette Character name of a palette supported by
#'   [AAGIPalettes::aagi_palettes()]. If `NULL` and `discrete = TRUE`, use the
#'   official colours in [AAGIPalettes::aagi_colours].
#' @param discrete Logical; should the scale be discrete? Defaults to `TRUE`.
#' @param reverse Logical; should the palette order be reversed? Defaults to
#'   `FALSE`.
#' @param colours Character vector of official \acronym{AAGI} colour names to
#'   interpolate for continuous scales. If `NULL`, defaults used by
#'   [AAGIPalettes::interpolate_aagi_colours()] are applied.
#' @param ... Additional arguments passed to the underlying \CRANpkg{ggplot2}
#'   scale functions.
#'
#' @details
#' For discrete scales:
#' - if `palette = NULL`, colours are taken from [AAGIPalettes::aagi_colours];
#' - otherwise colours are taken from [AAGIPalettes::aagi_palettes()].
#'
#' For continuous scales, `palette` is ignored and interpolated colours are
#' used. If you want to control the continuous gradient directly, supply
#' `colours`.
#'
#' @examples
#' p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(displ, hwy, colour = class)) +
#'   ggplot2::geom_point()
#'
#' # Default discrete official colours
#' p + scale_colour_aagi()
#'
#' # Named palette
#' p + scale_colour_aagi(palette = "aagi_blues")
#'
#' @describeIn scale_colour_aagi For colour scales
#' @export
scale_colour_aagi <- function(
  palette = NULL,
  discrete = TRUE,
  reverse = FALSE,
  colours = NULL,
  ...
) {
  direction <- if (isTRUE(reverse)) -1 else 1

  if (isTRUE(discrete)) {
    pal <- function(n) {
      if (is.null(palette)) {
        vals <- unname(AAGIPalettes::aagi_colours[.aagi_colour_order()])

        if (direction == -1) {
          vals <- rev(vals)
        }

        if (n > length(vals)) {
          cli::cli_abort(
            c(
              "x" = "Not enough values in {.field AAGIPalettes::aagi_colours} for {.val {n}} levels.",
              "i" = "Supply a named {.arg palette} or use {.code discrete = FALSE}."
            )
          )
        }

        vals[seq_len(n)]
      } else {
        AAGIPalettes::aagi_palettes(
          name = palette,
          n = n,
          direction = direction
        )
      }
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
  palette = NULL,
  discrete = TRUE,
  reverse = FALSE,
  colours = NULL,
  ...
) {
  direction <- if (isTRUE(reverse)) -1 else 1

  if (isTRUE(discrete)) {
    pal <- function(n) {
      if (is.null(palette)) {
        vals <- unname(AAGIPalettes::aagi_colours[.aagi_colour_order()])

        if (direction == -1) {
          vals <- rev(vals)
        }

        if (n > length(vals)) {
          cli::cli_abort(
            c(
              "x" = "Not enough values in {.field AAGIPalettes::aagi_colours} for {.val {n}} levels.",
              "i" = "Supply a named {.arg palette} or use {.code discrete = FALSE}."
            )
          )
        }

        vals[seq_len(n)]
      } else {
        AAGIPalettes::aagi_palettes(
          name = palette,
          n = n,
          direction = direction
        )
      }
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

#' Set a different default order of AAGI colours for better data vis
#'
#' Sets the colour order so that there is more contrast between the first three
#' colours since graphs frequently only have 1-3 values displayed.
#'
#' @dev
.aagi_colour_order <- function() {
  c(
    "AAGI Bright Green",
    "AAGI Orange",
    "AAGI Blue",
    "AAGI Green",
    "AAGI Yellow",
    "AAGI Black",
    "AAGI Teal",
    "AAGI Grey"
  )
}
