#' Scale constructors for AAGI colour palettes to be used in {ggplot2} objects
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
#' @param colours Character vector of official \acronym{AAGI} colour names to
#'   interpolate for continuous scales. If `NULL`, defaults used by
#'   [AAGIPalettes::interpolate_aagi_colours()] are applied.
#' @param values Optional character vector of colour values to use for discrete
#'   scales. This can be a vector of hex colours or values returned by
#'   [AAGIPalettes::colour_as_hex()]. If supplied, `values` takes precedence over
#'   `palette` and the default ordering of [AAGIPalettes::aagi_colours].
#' @param ... Additional arguments passed to the underlying \CRANpkg{ggplot2}
#'   scale functions.
#'
#' @describeIn scale_colour_aagi For colour scales
#' @export
scale_colour_aagi <- function(
  palette = NULL,
  discrete = TRUE,
  colours = NULL,
  values = NULL,
  ...
) {
  if (isTRUE(discrete)) {
    pal <- function(n) {
      if (!is.null(values)) {
        vals <- unname(values)

        if (n > length(vals)) {
          cli::cli_abort(
            c(
              "x" = "Not enough values supplied in {.arg values} for {.val {n}} levels."
            )
          )
        }

        return(vals[seq_len(n)])
      }

      if (is.null(palette)) {
        vals <- unname(AAGIPalettes::aagi_colours[.aagi_default_colour_order()])

        if (n > length(vals)) {
          cli::cli_abort(
            c(
              "x" = "Not enough values in {.field AAGIPalettes::aagi_colours} for {.val {n}} levels.",
              "i" = "Supply {.arg values}, a named {.arg palette}, or use {.code discrete = FALSE}."
            )
          )
        }

        vals[seq_len(n)]
      } else {
        AAGIPalettes::aagi_palettes(
          name = palette,
          n = n
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
      AAGIPalettes::interpolate_aagi_colours()
    } else {
      AAGIPalettes::interpolate_aagi_colours(colours = colours)
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
  colours = NULL,
  values = NULL,
  ...
) {
  if (isTRUE(discrete)) {
    pal <- function(n) {
      if (!is.null(values)) {
        vals <- unname(values)

        if (n > length(vals)) {
          cli::cli_abort(
            c(
              "x" = "Not enough values supplied in {.arg values} for {.val {n}} levels."
            )
          )
        }

        return(vals[seq_len(n)])
      }

      if (is.null(palette)) {
        vals <- unname(AAGIPalettes::aagi_colours[.aagi_default_colour_order()])

        if (n > length(vals)) {
          cli::cli_abort(
            c(
              "x" = "Not enough values in {.field AAGIPalettes::aagi_colours} for {.val {n}} levels.",
              "i" = "Supply {.arg values}, a named {.arg palette}, or use {.code discrete = FALSE}."
            )
          )
        }

        vals[seq_len(n)]
      } else {
        AAGIPalettes::aagi_palettes(
          name = palette,
          n = n
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
      AAGIPalettes::interpolate_aagi_colours()
    } else {
      AAGIPalettes::interpolate_aagi_colours(colours = colours)
    }

    ggplot2::scale_fill_gradientn(
      colours = pal(256L),
      ...
    )
  }
}

.aagi_default_colour_order <- function() {
  c(
    "AAGI Teal",
    "AAGI Blue",
    "AAGI Bright Green",
    "AAGI Orange",
    "AAGI Yellow",
    "AAGI Green",
    "AAGI Black",
    "AAGI Grey"
  )
}
