#' Extract AAGI Colours as Hex Codes
#'
#' @param ... Character names of \acronym{AAGI} colours
#' @export
aagi_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(theme.aagi::aagi_colours)

  theme.aagi::aagi_colours[cols]
}
