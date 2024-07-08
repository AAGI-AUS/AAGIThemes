#' Extract AAGI Colours as Hex Codes From Names
#'
#' @param ... Character names of \acronym{AAGI} colours
#' @export
colour_as_hex <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(theme.aagi::aagi_colours)

  theme.aagi::aagi_colours[cols]
}
