#' Add a Watermark Annotation Layer to a ggplot2 Object
#'
#' @param watermark String to be added as watermark
#' @param fontsize Font size
#' @param colour Font colour
#' @param alpha Alpha (transparency; lower number = more transparent)
#' @param fontface Font face ("bold" by default)
#' @param angle Angle of the watermark
#' @export
#' @author Matt Cowgill and Will Mackey
#' @examples
#'
#' library(ggplot2)
#' # First, start with a plot:
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
#'   geom_point() +
#'   theme_aagi()
#'
#' # Then add a watermark:
#'
#' p + watermark("DRAFT")
#'
#' @returns A [ggplot2] object with a watermark added to the plot that's called.
#'
watermark <- function(
  watermark,
  fontsize = 120,
  colour = "grey90",
  alpha = 0.1,
  fontface = "bold",
  angle = 22
) {
  # Validate watermark: must be scalar character, non-empty (after trim), not NA
  if (
    !rlang::is_scalar_character(watermark) ||
      is.na(watermark) ||
      !nzchar(trimws(watermark))
  ) {
    cli::cli_abort(
      "{.var watermark} must be a non-empty character string."
    )
  }

  if (!rlang::is_scalar_double(fontsize) || fontsize <= 0) {
    cli::cli_abort("{.var fontsize} must be a positive number.")
  }

  if (!rlang::is_scalar_double(alpha) || alpha < 0 || alpha > 1) {
    cli::cli_abort("{.var alpha} must be between 0 and 1.")
  }

  if (!rlang::is_scalar_double(angle)) {
    cli::cli_abort("{.var angle} must be a number.")
  }

  if (!rlang::is_scalar_character(colour)) {
    cli::cli_abort("{.var colour} must be a single character string.")
  }

  # Validate fontface against allowed values BEFORE using it
  valid_fontfaces <- c("plain", "bold", "italic", "bold.italic")
  if (!fontface %in% valid_fontfaces) {
    cli::cli_abort(
      "{.var fontface} {.val {fontface}} is not valid. 
      Valid options: {.or {valid_fontfaces}}."
    )
  }

  # Create watermark grob and return as annotation layer
  watermark_grob <- grid::textGrob(
    watermark,
    gp = grid::gpar(
      fontsize = fontsize,
      colour = colour,
      alpha = alpha,
      fontface = fontface
    ),
    rot = angle
  )

  ggplot2::annotation_custom(grob = watermark_grob)
}
