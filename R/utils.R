#' Set AAGI Font for Figures and Tables With Fallback
#' 
#' Sets the AAGI font to Proxima Nova first, if it's not available, falls back
#'   to Arial as per the \acronym{AAGI} comms guide.
#' 
#' @return A character string with a font family name
#' @noRd
#' @keywords Internal
#' 
set_aagi_font <- function() {
  if (any(agrepl("Proxima Nova", systemfonts::system_fonts()[, "name"]))) {
    aagi_font <- "Proxima Nova"
  } else {
    aagi_font <- "Arial"
  }
  return(aagi_font)
}


#' Set Graphical Parameters That Satisfy AAGI's Style Requirements
#' 
#' @return A list object of graphical parameters
#' @noRd
#' @keywords Internal
#' 

par_aagi <- function() {
  aagi_font <- set_aagi_font()
  list(
    family = aagi_font,
    las = 1,
    mgp = c(2, 0.5, 0),
    cex = 0.9,
    bty = "L"
  )
}
