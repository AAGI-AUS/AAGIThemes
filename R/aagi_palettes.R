
#' List AAGI Palette Colour Combinations
#'
#' Returns a list of curated palettes of \acronym{AAGI} colours, which includes:
#'  \describe{
#'    \item{primary}{The three primary \acronym{AAGI} colours}
#'    \item{secondary}{The three secondary support colours in the \acronym{AAGI}
#'        colour palette.}
#'    \item{full}{The full set of all six colours in the \acronym{AAGI}
#'        palette}
#'    \item{colourful}{All colours in the palette minus \dQuote{AAGI Black}}
#'    \item{bright}{Four \dQuote{bright} colours including,
#'      \dQuote{AAGI Bright Green}, \dQuote{AAGI Blue} and \dQuote{AAGI Yellow}}
#'    \item{bluegreeen}{Three blue, green or bluegreen \acronym{AAGI} colours
#'      including \dQuote{AAGI Bright Green}, \dQuote{AAGI Turquoise},
#'      \dQuote{AAGI Blue}, \dQuote{AAGI Green} and \dQuote{AAGI Bluegreen}}
#'  }
#'
#' @examples
#' # View all five palettes' names and hexadecimal colour codes
#'   aagi_palettes()
#'   aagi_palettes()$colourful
#'   aagi_palettes()$bluegreen
#'
#' @return A `list` object of \acronym{AAGI} colours grouped by palette
#'   combinations
#' @export
aagi_palettes <- function() {
  return(list("primary" = aagi_colours[1:3],
              "secondary" = aagi_colours[4:6],
              "colourful" = aagi_colours[2:6],
              "full" = aagi_colours,
              "bright" = aagi_colours[c(2, 4, 6)],
              "bluegreen" = aagi_colours[3:5]))
}
