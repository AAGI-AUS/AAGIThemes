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
#' @returns A list object of graphical parameters
#' @dev

par_aagi <- function() {
  list(
    family = set_aagi_font(),
    las = 1,
    mgp = c(2, 0.5, 0),
    cex = 0.9,
    bty = "L",
    col = AAGIPalettes::colour_as_hex("AAGI Black")
  )
}

#' Check and convert AAGI colour
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
          "Could not convert {.var {x}} to a hex colour. Returning original
          value."
        )
        return(x)
      }
    )
  }

  # Return unchanged if not an AAGI colour
  x
}

#' @importFrom rlang %||%
NULL
