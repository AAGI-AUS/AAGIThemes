#' Set AAGI Font for Figures and Tables With Fallback
#'
#' Sets the AAGI font to Proxima Nova first, if it's not available, falls back
#'   to Arial as per the \acronym{AAGI} comms guide.
#'
#' @returns A character string with a font family name
#' @dev

set_aagi_font <- function() {
  if (any(agrepl("Proxima Nova", systemfonts::system_fonts()[, "family"]))) {
    aagi_font <- "Proxima Nova"
  } else {
    aagi_font <- "Arial"
  }
  aagi_font
}

#' Set Graphical Parameters That Satisfy AAGI's Style Requirements
#'
#' Sets the AAGI font and style for \R base graphics, these match the
#'  `theme_aagi()` theme settings for \CRANpkg{ggplot2}.
#'
#' @returns A list object of graphical parameters
#' @dev

.par_aagi <- function() {
  list(
    family = set_aagi_font(),
    las = 1,
    mgp = c(2, 0.5, 0),
    cex = 0.9,
    bty = "L"
  )
}

#' Check and convert AAGI colour
#'
#' Checks a string value to see if it's a valid \acronym{AAGI} colour and
#'  converts it to the corresponding hexademcimal colour code. This is done
#'  by checking for an "AAGI" prefix in the string as all valid colours from
#'  \pkg{AAGIPalettes} will have this.
#'
#' @param x A character string name value to be checked if it's an AAGI colour
#'  and converted to the corresponding hex value. Can be a single value or a
#'  vector.
#'
#' @returns A character string or vector of hexadecimal colour codes, or the
#'  input unchanged if it's not an AAGI colour name.
#' @dev
.convert_aagi_colour <- function(x) {
  # Handle NULL or empty input
  if (is.null(x) || length(x) == 0) {
    return(x)
  }

  # Handle non-character input
  if (!is.character(x)) {
    return(x)
  }

  # Handle vector input by applying function recursively
  if (length(x) > 1) {
    return(vapply(x, .convert_aagi_colour, character(1), USE.NAMES = FALSE))
  }

  # Single character string - check if AAGI colour
  if (startsWith(x, "AAGI ")) {
    tryCatch(
      {
        return(AAGIPalettes::colour_as_hex(x))
      },
      error = function(e) {
        cli::cli_warn(
          "Could not convert {.var {x}} to a hex colour. ",
          "Returning original value."
        )
        return(x)
      }
    )
  }

  # Return unchanged if not an AAGI colour
  x
}

#' Normalize and convert colour-related args found in dots
#'
#' - If an arg is missing/empty/NA, use a default.
#' - If an arg is a character string starting with "AAGI ", convert via
#'   `.convert_aagi_colour()`.
#' - Otherwise leave as-is (supports numeric palette indices, "red", "#RRGGBB",
#'   etc.).
#'
#' @param dots A list, typically created with `list(...)`.
#' @param defaults Named list of defaults, e.g. `list(col = "AAGI Black")`.
#'   Only names present here will be normalised.
#'
#' @returns `dots`, with normalised/converted values for any matching names.
#' @dev

.normalise_dots_colours <- function(dots, defaults = list(col = "AAGI Black")) {
  stopifnot(is.list(dots), is.list(defaults))
  if (
    is.null(names(defaults)) ||
      anyNA(names(defaults)) ||
      any(!nzchar(defaults))
  ) {
    cli::cli_abort("{.var defaults} must be a {.bold named} {.code list}.")
  }

  for (nm in names(defaults)) {
    value <- dots[[nm]]

    # Missing / empty -> default
    if (is.null(value) || length(value) == 0L) {
      value <- defaults[[nm]]
    }

    # Scalar NA of any atomic type -> default (covers NA_integer_, NA_real_, NA, etc.)
    if (length(value) == 1L && is.atomic(value) && is.na(value)) {
      value <- defaults[[nm]]
    }

    # Convert only AAGI-named colours; leave everything else alone (incl numeric)
    if (is.character(value) && length(value) >= 1L) {
      value <- .convert_aagi_colour(value)
    }

    dots[[nm]] <- value
  }

  dots
}

#' @importFrom rlang %||%
NULL
