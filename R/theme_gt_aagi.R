#' Apply the AAGI Theme to a gt Object
#'
#' Apply the \acronym{AAGI} theme to a \CRANpkg{gt}.  An \acronym{AAGI}
#'   formatted table body is grey with a teal header and white header font.
#'   Header text is bold, text columns are left aligned, other columns are right
#'   aligned.
#'
#' # Font
#'
#' The font is resolved as follows. Inside a Quarto document, the font chosen
#'   by the \acronym{AAGI} Quarto template is used; the template should set the
#'   `AAGI_MAINFONT` environment variable (or the `aagi_mainfont` option of
#'   `knitr::opts_knit`) to the font it selected. Otherwise (e.g., standalone
#'   use) Proxima Nova is used if available, then Arial, then "sans". The
#'   resolved font is followed by "Arial" and [gt::default_fonts()].
#'
#' @param x a \CRANpkg{gt} object
#' @returns a formatted \CRANpkg{gt} object
#' @examples
#' library(gt)
#' library(dplyr)
#' gt <- head(airquality) |>
#'   mutate(`Month Name` = "May") |>
#'   gt()
#' gt <- theme_gt_aagi(gt)
#' gt
#' @author Adam H. Sparks, \email{adam.sparks@@curtin.edu.au}
#' @family tables
#' @export
theme_gt_aagi <- function(x) {
  # check if object is a `gt_tbl` before proceeding
  if (!inherits(x, "gt_tbl")) {
    cli::cli_abort("{.var x} is not a {.code gt_tbl} object.")
  }

  aagi_font <- .resolve_aagi_font()
  aagi_black <- AAGIPalettes::colour_as_hex("AAGI Black")
  aagi_grey <- AAGIPalettes::colour_as_hex("AAGI Grey")
  aagi_teal <- AAGIPalettes::colour_as_hex("AAGI Teal")

  x <-
    x |>
    gt::opt_table_font(
      font = list(
        aagi_font,
        "Arial",
        gt::default_fonts()
      )
    ) |>
    gt::tab_style(
      style = gt::cell_borders(
        sides = "all",
        color = "#ffffff",
        weight = gt::px(2)
      ),
      locations = list(gt::cells_body(), gt::cells_column_labels())
    ) |>
    gt::tab_options(
      column_labels.background.color = aagi_teal,
      table.background.color = aagi_grey,
      column_labels.font.weight = "bold",
      table.font.color = aagi_black
    ) |>
    gt::sub_missing(missing_text = "")
  return(x)
}
