#' Add a Watermark Annotation Layer to a ggplot2 Object
#'
#' @param watermark String to be added as watermark
#' @param fontsize Font size
#' @param colour Font colour
#' @param alpha Alpha (transparency; lower number = more transparent)
#' @param fontface Font face ("bold" by default)
#' @param angle Angle of the watermark
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
#' @author Adam H. Sparks, \email{adam.sparks@@curtin.edu.au} based on
#' Matt Cowgill's and Will Mackey's work.
#' @export

watermark <- function(
  watermark,
  fontsize = 120,
  colour = "grey90",
  alpha = 0.1,
  fontface = "bold",
  angle = 22
) {
  .assert_scalar_string(watermark, "watermark", trim = TRUE, nonempty = TRUE)
  .assert_scalar_number(fontsize, "fontsize", min = 0, inclusive = FALSE)
  .assert_scalar_number(alpha, "alpha", min = 0, max = 1, inclusive = TRUE)
  .assert_scalar_number(angle, "angle") # any numeric value ok
  .assert_scalar_string(colour, "colour", trim = FALSE, nonempty = TRUE)

  valid_fontfaces <- c("plain", "bold", "italic", "bold.italic")
  .assert_one_of(fontface, "fontface", valid_fontfaces)

  watermark_grob <- grid::textGrob(
    label = watermark,
    gp = grid::gpar(
      fontsize = fontsize,
      col = colour, # grid uses 'col' (though 'colour' often works too)
      alpha = alpha,
      fontface = fontface
    ),
    rot = angle
  )

  return(ggplot2::annotation_custom(grob = watermark_grob))
}

#' @keywords internal
.assert_scalar_number <- function(x, name, min = -Inf, max = Inf) {
  if (!is.numeric(x) || length(x) != 1L || is.na(x)) {
    cli::cli_abort("{.var {name}} must be a single number.")
  }

  if (x < min || x > max) {
    cli::cli_abort("{.var {name}} must be between {min} and {max}.")
  }

  return(invisible(x))
}

#' @keywords internal
.assert_scalar_number_gt <- function(x, name, min_exclusive = 0) {
  if (!is.numeric(x) || length(x) != 1L || is.na(x)) {
    cli::cli_abort("{.var {name}} must be a single number.")
  }

  if (x <= min_exclusive) {
    cli::cli_abort("{.var {name}} must be > {min_exclusive}.")
  }

  return(invisible(x))
}

#' @keywords internal
.assert_scalar_number_gte <- function(x, name, min_inclusive = 0) {
  if (!is.numeric(x) || length(x) != 1L || is.na(x)) {
    cli::cli_abort("{.var {name}} must be a single number.")
  }

  if (x < min_inclusive) {
    cli::cli_abort("{.var {name}} must be >= {min_inclusive}.")
  }

  return(invisible(x))
}

#' @keywords internal
.assert_scalar_string <- function(x, name, trim = TRUE, nonempty = TRUE) {
  if (!is.character(x) || length(x) != 1L || is.na(x)) {
    cli::cli_abort("{.var {name}} must be a single character string.")
  }

  y <- if (trim) trimws(x) else x
  if (nonempty && !nzchar(y)) {
    cli::cli_abort("{.var {name}} must be a non-empty character string.")
  }

  return(invisible(x))
}

#' @keywords internal
.assert_one_of <- function(x, name, choices) {
  if (!x %in% choices) {
    cli::cli_abort(
      "{.var {name}} {.val {x}} is not valid. Valid options: {.or {choices}}."
    )
  }
  return(invisible(x))
}

#' @keywords internal
.assert_scalar_number_gt <- function(x, name, min_exclusive = 0) {
  if (!is.numeric(x) || length(x) != 1L || is.na(x)) {
    cli::cli_abort("{.var {name}} must be a single number.")
  }
  if (x <= min_exclusive) {
    cli::cli_abort("{.var {name}} must be > {min_exclusive}.")
  }
  return(invisible(x))
}

#' @keywords internal
.assert_scalar_string <- function(x, name) {
  if (!is.character(x) || length(x) != 1L || is.na(x) || !nzchar(trimws(x))) {
    cli::cli_abort("{.var {name}} must be a non-empty character string.")
  }
  return(invisible(x))
}

#' @keywords internal
.assert_one_of <- function(x, name, choices) {
  if (!x %in% choices) {
    cli::cli_abort(
      "{.var {name}} {.val {x}} is not valid. Valid options: {.or {choices}}."
    )
  }
  return(invisible(x))
}
