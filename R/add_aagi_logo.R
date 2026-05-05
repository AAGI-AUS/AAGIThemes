#' Insert AAGI's Logo Into Any Graphic File
#'
#' Insert the \acronym{AAGI} logo in any graphical image.  Particularly well-
#'   suited for use with files created with \pkg{AAGIThemes}.  The logo will be
#'   inserted in the upper-left of the image with a size of at least 4.6 cm as
#'   per \acronym{AAGI} brand guidelines.
#'
#' @param file_in Path to the graphical file to import and add the
#'   \acronym{AAGI} logo to apply the logo to.
#' @param file_out File name to create on disk as a .png format image.
#' @param logo_width Size for the logo in centimetres.  Defaults to 4.6 cm, the
#'   smallest allowed by the \acronym{AAGI} guidelines. Larger sizes may be
#'   beneficial for larger graphical images than normal reporting and sharing.
#' @param overwrite A Boolean value that indicates whether to overwrite an
#'   existing file or not. Defaults to `FALSE` and will not overwrite the
#'   existing file.
#'
#' @examples
#' library("ggplot2")
#'
#' p1 <- ggplot(mtcars) +
#'   geom_point(aes(
#'     x = wt,
#'     y = mpg,
#'     colour = factor(gear)
#'   )) +
#'   facet_wrap(~am) +
#'   theme_aagi()
#'
#' ggsave(p1, filename = "AAGI.png", path = tempdir())
#'
#' add_aagi_logo(
#'   file_in = file.path(tempdir(), "AAGI.png"),
#'   file_out = file.path(tempdir(), "AAGI_logo.png")
#' )
#'
#' x <- magick::image_read(file.path(tempdir(), "AAGI_logo.png"))
#' print(x)
#'
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}
#' @returns An invisible `NULL`, called for its side effect of adding the
#'   \acronym{AAGI} logo to the plot that's called.
#'
#' @export

add_aagi_logo <- function(
  file_in,
  file_out,
  logo_width = 4.6,
  overwrite = FALSE
) {
  # see: <https://themockup.blog/posts/2019-01-09-add-a-logo-to-your-plot/>
  # see also: <https://www.danielphadley.com/ggplot-logo/>

  # --- Validate input ---
  if (!rlang::is_scalar_double(logo_width) || logo_width < 4.6) {
    cli::cli_abort(
      "{.arg logo_width} must be a single numeric value >= 4.6 cm."
    )
  }
  if (fs::file_exists(file_out) && !overwrite) {
    cli::cli_abort(
      "{.var file_out} {file_out} already exists. Use {.code overwrite = TRUE}
      or choose a new name."
    )
  }

  plot_in <- magick::image_read(file_in)
  info <- magick::image_info(plot_in)

  plot_width <- info$width
  plot_height <- info$height

  dpi_density <- info$density
  dpi <- tryCatch(
    {
      as.numeric(strsplit(dpi_density, "x")[[1]][1])
    },
    error = function(e) NA_real_
  )

  if (is.na(dpi) || dpi <= 0) {
    dpi <- 72 # conservative fallback
    cli::cli_warn(
      "Image DPI not available; assuming 72 DPI for logo sizing."
    )
  }

  # --- Convert cm → pixels ---
  logo_width_px <- (logo_width / 2.54) * dpi

  # Guard against absurd cases where requested logo > plot width
  if (logo_width_px > plot_width) {
    cli::cli_warn(c(
      "Requested {.arg logo_width} exceeds plot width.",
      "i" = "Reducing logo width to fit within image."
    ))
    logo_width_px <- plot_width
  }

  # --- Prepare plot ---
  plot_in <- magick::image_border(plot_in, geometry = "0x300", color = "white")

  # --- Read logo ---
  if (requireNamespace("rsvg", quietly = TRUE)) {
    logo_raw <- magick::image_read_svg(
      system.file(
        "logo",
        "AAGI_logo_colour_CMYK.svg",
        package = "AAGIThemes",
        mustWork = TRUE
      )
    )
  } else {
    cli::cli_inform(
      "{.pkg rsvg} is not installed, using a less optimal method.
    You may wish to install it with {.code install.packages('rsvg')}."
    )
    logo_raw <- magick::image_read(
      system.file(
        "logo",
        "AAGI_logo_colour_CMYK.svg",
        package = "AAGIThemes",
        mustWork = TRUE
      )
    )
  }

  # --- Scale logo to exact pixel width ---
  logo <- magick::image_scale(logo_raw, as.character(round(logo_width_px)))

  # --- Position ---
  x_pos <- 0.01 * plot_width
  y_pos <- 0.01 * plot_height

  plot_out <- magick::image_composite(
    plot_in,
    logo,
    offset = paste0("+", round(x_pos), "+", round(y_pos))
  )

  # --- Crop extra space ---
  plot_out <- magick::image_crop(
    plot_out,
    geometry = paste0("0x", plot_height + 300L),
    gravity = "north"
  )

  magick::image_write(plot_out, file_out)

  # --- Informative output (useful for pipelines) ---
  actual_cm <- logo_width_px / dpi * 2.54
  cli::cli_inform(
    "Inserted logo width: {round(actual_cm, 2)} cm (DPI = {dpi})."
  )

  invisible(NULL)
}
