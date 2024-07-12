
#' Apply AAGI Theme to a flextable Object
#'
#' Apply theme AAGI to a \CRANpkg{flextable}.  An \acronym{AAGI} formatted table
#'   body is grey with a teal header and white header font.  Header text is
#'   bold, text columns are left aligned, other columns are right aligned.
#'
#' # Behaviour
#'
#' Theme functions are not like \CRANpkg{ggplot2} themes. They are applied to
#'   the existing table **immediately**. If you add a row in the footer, the new
#'   row is not formatted with the theme. The theme function applies the theme
#'   only to existing elements when the function is called.
#'
#' That is why theme functions should be applied after all elements of the table
#'   have been added (mainly additional header or footer rows).
#'
#' If you want to automatically apply a theme function to each
#'   \CRANpkg{flextable} object, you can use the `theme_fun` argument of
#'   [flextable::set_flextable_defaults]; be aware that this theme function is
#'   applied as the last instruction when calling [flextable::flextable] - so if
#'   you add headers or footers to the array, they will not be formatted with
#'   the theme.
#'
#' You can also use the `post_process_html` argument of
#'   [flextable::set_flextable_defaults] (or `post_process_pdf`,
#'   `post_process_docx`, `post_process_pptx`) to specify a theme to be applied
#'   systematically before the [flextable::flextable] is printed; in this case,
#'   don't forget to take care that the theme doesn't override any formatting
#'   done before the print statement.
#'
#' @param x a \CRANpkg{flextable} object
#' @return a formatted \CRANpkg{flextable} object
#' @examples
#' library(flextable)
#' library(dplyr)
#' ft <- flextable(head(airquality) |> mutate(`Month Name` = "May"))
#' ft <- theme_ft_aagi(ft)
#' ft
#' @export
theme_ft_aagi <- function(x) {
  if (!inherits(x, "flextable")) {
    cli::cli_abort(
      "Function {.fn theme_ft_aagi} only supports {.pkg flextable} objects."
    )
  }

  x <- flextable::font(x, part = "all", fontname = set_aagi_font())

  # header
  x <- flextable::bold(x = x, bold = TRUE, part = "header")
  x <- flextable::color(x = x, color = "#ffffff", part = "header")
  x <- flextable::bg(x = x, bg = "#00808C", part = "header")

  # body
  x <- flextable::color(x = x, color = "#414042", part = "body")
  x <- flextable::bg(x = x, bg = "#F2F2F2", part = "body")

  x <- flextable::border(
    x = x, border = officer::fp_border(
      width = 0.75,
      color = "#ffffff"
    ),
    part = "all"
  )

  x <- flextable::align_text_col(x, align = "left", header = TRUE)
  x <- flextable::align_nottext_col(x, align = "right", header = FALSE)

  return(x)
}
