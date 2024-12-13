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
watermark <- function(watermark,
                      fontsize = 120,
                      colour = "grey90",
                      alpha = 0.1,
                      fontface = "bold",
                      angle = 22) {
  watermark_grob <-
    grid::textGrob(
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
