#' Apply the AAGI Theme to a gt Object
#'
#' Apply the \acronym{AAGI} theme to a \CRANpkg{gt}.  An \acronym{AAGI}
#'   formatted table body is grey with a teal header and white header font.
#'   Header text is bold, text columns are left aligned, other columns are right
#'   aligned.
#'
#' @param x a \CRANpkg{gt} object
#' @return a formatted \CRANpkg{gt} object
#' @examples
#' library(gt)
#' library(dplyr)
#' gt <- head(airquality) |>
#'   mutate(`Month Name` = "May") |>
#'   gt()
#' gt <- theme_gt_aagi(gt)
#' gt
#' @family tables
#' @export
theme_gt_aagi <- function(x) {
  # check if Proxima Nova is installed, if not, falls back to Arial
  aagi_font <- set_aagi_font()

  aagi_black <- AAGIPalettes::colour_as_hex("AAGI Black")
  aagi_grey <- AAGIPalettes::colour_as_hex("AAGI Grey")
  aagi_teal <- AAGIPalettes::colour_as_hex("AAGI Teal")

  x |>
    gt::opt_table_font(
      font = list(
        aagi_font, default_fonts()
      )
    ) |>
    gt::tab_style(
      style = gt::cell_borders(sides = "all",
                              color = "#ffffff",
                              weight = px(2)),
      locations = cells_body()
    ) |>
    gt::tab_options(
      column_labels.background.color = aagi_teal,
      table.background.color = aagi_grey,
      column_labels.font.weight = "bold",
      table.font.color = aagi_black
    )
}
