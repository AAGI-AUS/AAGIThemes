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
