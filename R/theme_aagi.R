#' A ggplot2 Theme Using a Unified AAGI Style and Typography for Plots
#'
#' This theme follows a standard \acronym{AAGI} style including typography
#' guidelines that uses (hopefully) sensible defaults for \CRANpkg{ggplot2}
#' graphics.
#'
#' @param base_size `Numeric`. The figure's base size, set to 12 by default.
#'   For presentations using a larger `base_size` will make the fonts larger and
#'   more suitable for presentation slides, _e.g._, `base_size = 24`.
#' @param major_grid `Boolean`. Include major gridlines in the panel. Defaults
#'   to `FALSE`.
#' @param minor_grid `Boolean`. Include minor gridlines in the panel. Defaults
#'   to `FALSE`.
#' @param border `Boolean`. Include a border around the figure on all four
#'   sides. Defaults to `FALSE`.
#' @param showtext_auto `Boolean`. If `TRUE`, enable `showtext::showtext_auto()`
#'   that provides full \acronym{AAGI} font support. Defaults to `TRUE`.
#'
#'   **Important:** `showtext::showtext_auto()` changes global rendering
#'   behaviour for the entire R session/device. This can affect subsequent plots
#'   (including non-\pkg{AAGIThemes} plots) until it is disabled. However, since
#'   it is anticipated that this theme will only ever be used for official
#'   \acronym{AAGI} work, this seems unlikely to be an issue.
#'
#'   To undo, call [showtext_aagi_off()].
#' @param ... Other arguments as passed along to [ggplot2::theme()].
#'
#' @examples
#' library("ggplot2")
#'
#' p <- ggplot(mtcars) +
#'   geom_point(aes(wt, mpg)) +
#'   theme_aagi(showtext_auto = TRUE)
#'
#' p
#'
#' # Disable global showtext auto afterwards (recommended)
#' showtext_aagi_off()
#'
#' @importFrom ggplot2 `%+replace%`
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}
#' @export
theme_aagi <- function(
  base_size = 12,
  major_grid = FALSE,
  minor_grid = FALSE,
  border = FALSE,
  showtext_auto = TRUE,
  ...
) {
  aagi_font <- .set_aagi_font()
  aagi_black <- AAGIPalettes::colour_as_hex("AAGI Black")
  aagi_grey <- AAGIPalettes::colour_as_hex("AAGI Grey")
  aagi_teal <- AAGIPalettes::colour_as_hex("AAGI Teal")

  if (isTRUE(showtext_auto)) {
    showtext::showtext_auto()
  }

  base_line_size <- base_size / 12
  base_rect_size <- base_size / 12
  major_grid_size <- base_size / 48
  minor_grid_size <- base_size / 96

  ta <-
    ggplot2::theme_classic(
      base_size = base_size,
      base_family = aagi_font
    ) %+replace%
    ggplot2::theme(
      legend.key = ggplot2::element_blank(),
      legend.background = ggplot2::element_rect(
        color = aagi_black,
        fill = "#ffffff"
      ),
      strip.background = ggplot2::element_rect(
        fill = aagi_teal,
        colour = aagi_teal,
        linewidth = base_line_size
      ),
      strip.text = ggplot2::element_text(
        colour = "#ffffff",
        family = aagi_font,
        face = "bold",
        margin = ggplot2::margin(3, 3, 3, 3, "points")
      ),
      plot.margin = ggplot2::margin(25, 25, 10, 25),
      text = ggplot2::element_text(
        family = aagi_font,
        size = base_size
      ),
      axis.text = ggplot2::element_text(
        family = aagi_font,
        size = base_size
      ),
      legend.text = ggplot2::element_text(
        family = aagi_font,
        size = base_size
      ),
      plot.title = ggplot2::element_text(
        family = aagi_font,
        face = "bold",
        size = base_size * 1.25,
        hjust = 0,
        margin = ggplot2::margin(0, 0, 10, 0)
      ),
      plot.title.position = "plot",
      complete = TRUE,
      ...
    )

  if (isTRUE(minor_grid)) {
    ta <- ta +
      ggplot2::theme(
        panel.grid.minor = ggplot2::element_line(
          color = aagi_grey,
          linewidth = minor_grid_size
        )
      )
  }

  if (isTRUE(major_grid)) {
    ta <- ta +
      ggplot2::theme(
        panel.grid.major = ggplot2::element_line(
          color = "#bdbdbd",
          linewidth = major_grid_size
        )
      )
  }

  if (isTRUE(border)) {
    ta <- ta +
      ggplot2::theme(
        panel.border = ggplot2::element_rect(
          fill = NA,
          color = aagi_black,
          linewidth = base_rect_size
        )
      )
  }

  ta
}

#' Disable Global Showtext Auto Rendering (AAGIThemes)
#'
#' `theme_aagi(showtext_auto = TRUE)` enables `showtext::showtext_auto()`, which
#' affects subsequent plots globally. Call this function to turn it off.
#'
#' @returns Invisibly returns `NULL`.
#' @export
showtext_aagi_off <- function() {
  showtext::showtext_auto(FALSE)
  invisible(NULL)
}
