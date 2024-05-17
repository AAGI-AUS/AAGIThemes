#' Information About AAGI Palettes
#'
#' Provides information on \acronym{AAGI} palettes including whether they are
#'   diverging, \dQuote{div} or sequential, \dQuote{seq} and the max number of
#'   colour steps available.
#'
#' @examples
#' aagi_pal_info()
#'
#' @return a `data.frame` with two columns, \dQuote{category} and
#'  \dQuote{max_colours} with palette names as row names.
#'
#' @export
aagi_pal_info <- function() {
  aagi_div_list  <- c("aagi_BuOr",
                      "aagi_BuYl",
                      "aagi_GnYl",
                      "aagi_RdBu",
                      "aagi_RdTl",
                      "aagi_TlGn")
  names(aagi_div_list) <- aagi_div_list
  aagi_seq_list  <- c(
    "aagi_BrYl",
    "aagi_RdYl",
    "aagi_TlGnYl",
    "aagi_TlYl",
    "aagi_blues",
    "aagi_bright_greens",
    "aagi_greens",
    "aagi_greys",
    "aagi_reds",
    "aagi_teals",
    "aagi_oranges",
    "aagi_yellows"
  )
  names(aagi_seq_list) <- aagi_seq_list

  aagi_qual_list <- c("Okabe_and_Ito")
  names(aagi_qual_list) <- aagi_qual_list

  aagi_div_num <- rep(11, length(aagi_div_list))
  names(aagi_div_num)  <- aagi_div_list

  aagi_seq_num <- rep(9, length(aagi_seq_list))
  names(aagi_seq_num) <- aagi_seq_list

  aagi_qual_list <- rep(8, length(aagi_qual_list))
  names(aagi_qual_num) <- aagi_qual_list

  aagi_name_list <- c(aagi_div_list, aagi_seq_list, aagi_qual_list)
  max_colors <- c(aagi_div_num, aagi_seq_num, aagi_qual_num)
  catlist <- rep(c("div", "seq", "qual"), c(
    length(aagi_div_list),
    length(aagi_seq_list),
    length(aagi_qual_list)
  ))

  return(
    data.frame(
      category = catlist,
      max_colors = max_colors
    )
  )
}
