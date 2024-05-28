
#' Colour AAGI Palette (Discrete)
#'
#' @param type One of \dQuote{seq} (sequential), \dQuote{div} (diverging) or
#'   \dQuote{qual} (qualitative).
#' @param palette If a string, will use that named palette.  If a number, will
#'   index into the list of palettes of appropriate `type`.
#' @param direction Sets the order of colours in the scale. If 1, the default,
#'   colours are as output by [aagi_pal()]. If `-1`, the order of colours is
#'   reversed.
#' @export
#' @examples
#' show_col(pal_aagi()(10))
#' show_col(pal_aagi("div")(5))
#' show_col(pal_aagi(palette = "Greens")(5))
#'
#' # Can use with gradient_n to create a continuous gradient
#' cols <- pal_aagi("div")(5)
#' show_col(pal_gradient_n(cols)(seq(0, 1, length.out = 30)))
pal_aagi <- function(type = "seq", palette = 1, direction = 1) {
  pal <- pal_name(palette, type)
  force(direction)
  function(n) {
    # If <3 colours are requested, aagi_pal() will return a 3-color palette and
    # give a warning. This warning isn't useful, so suppress it.
    # If the palette has k colours and >k colours are requested, aagi_pal() will
    # return a k-colour palette and give a warning. This warning is useful, so
    # don't suppress it.
    if (n < 3) {
      pal <- suppressWarnings(RColoraagi::aagi.pal(n, pal))
    } else {
      pal <- aagi_pal(n, pal)
    }
    # In both cases ensure we have n items
    pal <- pal[seq_len(n)]

    if (direction == -1) {
      pal <- rev(pal)
    }

    pal
  }
}

#' @export
#' @rdname pal_aagi
aagi_pal <- pal_aagi

pal_name <- function(palette, type) {
  if (is.character(palette)) {
    if (!palette %in% unlist(aagi)) {
      cli::cli_warn("Unknown palette: {.val {palette}}")
      palette <- "Greens"
    }
    return(palette)
  }

  type <- match.arg(type, c("div", "qual", "seq"))
  aagi[[type]][palette]
}

aagi <- list(
  div = c(
    "BrBG", "PiYG", "PRGn", "PuOr", "RdBu", "RdGy", "RdYlBu", "RdYlGn",
    "Spectral"
  ),
  qual = c(
    "Accent", "Dark2", "Paired", "Pastel1", "Pastel2", "Set1",
    "Set2", "Set3"
  ),
  seq = c(
    "Blues", "BuGn", "BuPu", "GnBu", "Greens", "Greys", "Oranges",
    "OrRd", "PuBu", "PuBuGn", "PuRd", "Purples", "RdPu", "Reds",
    "YlGn", "YlGnBu", "YlOrBr", "YlOrRd"
  )
)
