

#' Insert AAGI's Logo Into Any Graphic File
#'
#' Insert the \acronym{AAGI} logo in any graphical image.  Particularly well-
#'   suited for use with files created with \pkg{theme.aagi}.  The logo will be
#'   inserted in the upper-left of the image with a size of at least 4.6 cm as
#'   per \acronym{AAGI} brand guidelines.
#'
#' @param file_in Path to the graphical file to import and add the
#'   \acronym{AAGI} logo to apply the logo to.
#' @param file_out File name to create on disk as a .png format image.
#' @param logo_scale Scaling for the logo.  Defaults to 2.5, larger sizes may be
#'   beneficial for larger graphical images than normal reporting and sharing.
#'   Care should be taken that the logo follows the \acronym{AAGI} branding
#'   guidelines and the size remains at least 4.6 cm.
#'
#' @examples
#' library("ggplot2")
#'
#' p1 <- ggplot(mtcars) +
#'   geom_point(aes(
#'     x = wt,
#'     y = mpg,
#'     colour = factor(gear)
#'    )) +
#'   facet_wrap(~ am) +
#'   theme_aagi()
#'
#' ggsave(p1, filename = "AAGI.png", path = tempdir())
#'
#' add_aagi_logo(file_in = file.path(tempdir(), "AAGI.png"),
#'                file_out = file.path(tempdir(), "AAGI_logo.png"))
#'
#' x <- magick::image_read(file.path(tempdir(), "AAGI_logo.png"))
#' print(x)
#'
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}
#'
#' @export

add_aagi_logo <- function(file_in, file_out, logo_scale = 2.5) {
  # see: <https://themockup.blog/posts/2019-01-09-add-a-logo-to-your-plot/>
  # see also: <https://www.danielphadley.com/ggplot-logo/>

  plot_in <- magick::image_read(file_in)

  # get dimensions of plot for scaling
  plot_height <- magick::image_info(plot_in)$height
  plot_width <- magick::image_info(plot_in)$width

  plot_in <- magick::image_border(plot_in, geometry = "0x300", color = "white")

  if (requireNamespace("rsvg")) {
    logo_raw <-
      magick::image_read_svg(
        system.file(
          "logo",
          "AAGI_logo_colour_CMYK.svg",
          package = "theme.aagi",
          mustWork = TRUE
        )
      )
  } else {
    logo_raw <-
      magick::image_read(
        system.file(
          "logo",
          "AAGI_logo_colour_CMYK.svg",
          package = "theme.aagi",
          mustWork = TRUE
        )
      )
  }

  logo <- magick::image_scale(logo_raw, as.character(plot_width / logo_scale))

  # Get width of logo
  logo_width <- magick::image_info(logo)$width
  logo_height <- magick::image_info(logo)$height

  x_pos = 0.01 * plot_width
  y_pos = 0.01 * plot_height

  # Compose the actual overlay
  plot_out <-
    magick::image_composite(plot_in,
                            logo,
                            offset = paste0("+", x_pos, "+", y_pos))

  # trim plot down, removes bottom border added earlier to make room for logo
  plot_out <- magick::image_crop(plot_out,
                                 geometry = paste0("0x", plot_height + 300),
                                 gravity = "north")

  magick::image_write(plot_out, file_out)
}
