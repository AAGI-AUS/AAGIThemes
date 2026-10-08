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
#'   applied as the last instruction when calling [flextable::flextable()] -- so
#'   if you add headers or footers to the array, they will not be formatted with
#'   the theme.
#'
#' You can also use the `post_process_html` argument of
#'   [flextable::set_flextable_defaults] (or `post_process_pdf`,
#'   `post_process_docx`, `post_process_pptx`) to specify a theme to be applied
#'   systematically before the [flextable::flextable] is printed; in this
#'   case, don't forget to take care that the theme doesn't override any
#'   formatting done before the print statement.
#'
#' # Font
#'
#' The font is resolved as follows. Inside a Quarto document, the font chosen
#'   by the \acronym{AAGI} Quarto template is used; the template should set the
#'   `AAGI_MAINFONT` environment variable (or the `aagi_mainfont` option of
#'   `knitr::opts_knit`) to the font it selected. Otherwise (e.g., standalone
#'   use) Proxima Nova is used if available, then Arial, then "sans". This
#'   ensures the generated PDF output never references an unavailable font.
#'
#' @param x a \CRANpkg{flextable} object
#' @returns a formatted \CRANpkg{flextable} object
#' @examples
#' library(flextable)
#' library(dplyr)
#' ft <- flextable(head(airquality) |> mutate(`Month Name` = "May"))
#' ft <- theme_ft_aagi(ft)
#' ft
#' @author Adam H. Sparks, \email{adam.sparks@@curtin.edu.au}
#' @family tables
#' @export
theme_ft_aagi <- function(x) {
  if (!inherits(x, "flextable")) {
    cli::cli_abort(
      "Function {.fn theme_ft_aagi} only supports {.pkg flextable} objects."
    )
  }

  aagi_font <- .resolve_aagi_font()
  flextable::set_flextable_defaults(font.family = aagi_font)

  aagi_black <- AAGIPalettes::colour_as_hex("AAGI Black")
  aagi_grey <- AAGIPalettes::colour_as_hex("AAGI Grey")
  aagi_teal <- AAGIPalettes::colour_as_hex("AAGI Teal")

  x <- flextable::font(x = x, fontname = aagi_font, part = "all")

  # header
  x <- flextable::bold(x = x, bold = TRUE, part = "header")
  x <- flextable::color(x = x, color = "#ffffff", part = "header")
  x <- flextable::bg(
    x = x,
    bg = aagi_teal,
    part = "header"
  )

  # body
  x <- flextable::color(
    x = x,
    color = aagi_black,
    part = "body"
  )
  x <- flextable::bg(
    x = x,
    bg = aagi_grey,
    part = "body"
  )

  x <- flextable::border(
    x = x,
    border = officer::fp_border(
      width = 0.75,
      color = "#ffffff"
    ),
    part = "all"
  )

  x <- flextable::align_text_col(x, align = "left", header = TRUE)
  x <- flextable::align_nottext_col(x, align = "right", header = FALSE)

  return(x)
}
