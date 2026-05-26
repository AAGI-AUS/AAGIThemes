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
#' @section Image Sizing: This function checks the image's DPI values and sets
#' the logo size accordingly. When saving, e.g., from \CRANpkg{ggplot}, specify
#' the DPI value along with your height and width and units for optimal
#' performance.
#' `ggsave(
#'    filename = "AAGI.png",
#'    plot = p1,
#'    path = tempdir(),
#'    width = 18,
#'    height = 18,
#'    units = "cm",
#'    dpi = 300
#' )
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
  .validate_logo_width(logo_width)
  .validate_file_out(file_out, overwrite)

  plot_in <- magick::image_read(file_in)
  info <- magick::image_info(plot_in)
  dpi <- .resolve_dpi(info$density)
  logo_px <- .calc_logo_px(logo_width, dpi, info$width)

  plot_in <- magick::image_border(plot_in, geometry = "0x300", color = "white")
  logo <- .read_logo(logo_px)
  plot_out <- .composite_and_crop(plot_in, logo, info, logo_px)

  magick::image_write(plot_out, file_out)
  cli::cli_inform(
    "Inserted logo width: {round(logo_px / dpi * 2.54, 2)} cm (DPI = {dpi})."
  )
  invisible(NULL)
}

# --- Validators ----------------------------------------------------------

.validate_logo_width <- function(logo_width) {
  if (
    !is.numeric(logo_width) ||
      length(logo_width) != 1L ||
      is.na(logo_width) ||
      logo_width < 4.6
  ) {
    cli::cli_abort(
      "{.arg logo_width} must be a single numeric value >= 4.6 cm."
    )
  }
}

.validate_file_out <- function(file_out, overwrite) {
  if (file.exists(file_out) && !overwrite) {
    cli::cli_abort(
      "{.var file_out} {file_out} already exists. Use {.code overwrite = TRUE}
      or choose a new name."
    )
  }
}

# --- DPI helpers ---------------------------------------------------------

.resolve_dpi <- function(dpi_density) {
  dpi <- .parse_magick_density_dpi(dpi_density)

  if (is.na(dpi) || dpi <= 0) {
    cli::cli_warn("Image DPI not available; assuming 300 DPI for logo sizing.")
    return(300)
  }

  if (
    nzchar(trimws(as.character(dpi_density))) &&
      !grepl("[xX]", as.character(dpi_density))
  ) {
    cli::cli_inform(
      "Image density reported as a single value; treating as DPI."
    )
  }

  dpi
}

# --- Logo helpers --------------------------------------------------------

.calc_logo_px <- function(logo_width, dpi, plot_width) {
  logo_px <- (logo_width / 2.54) * dpi

  if (logo_px > plot_width) {
    cli::cli_warn(c(
      "Requested {.arg logo_width} exceeds plot width.",
      i = "Reducing logo width to fit within image."
    ))
    logo_px <- plot_width
  }

  logo_px
}

.read_logo <- function(logo_px) {
  svg_path <- system.file(
    "logo",
    "AAGI_logo_colour_CMYK.svg",
    package = "AAGIThemes",
    mustWork = TRUE
  )

  logo_raw <- if (requireNamespace("rsvg", quietly = TRUE)) {
    magick::image_read_svg(svg_path)
  } else {
    cli::cli_inform(
      c(
        i = "{.pkg rsvg} is not installed, using a less optimal method.
      You may wish to install it with {.code install.packages('rsvg')}."
      )
    )
    magick::image_read(svg_path)
  }

  magick::image_scale(logo_raw, paste0(round(logo_px), "x"))
}

# --- Composite -----------------------------------------------------------

.composite_and_crop <- function(plot_in, logo, info, logo_px) {
  offset <- paste0(
    "+",
    round(0.01 * info$width),
    "+",
    round(0.01 * info$height)
  )

  plot_out <- magick::image_composite(plot_in, logo, offset = offset)

  magick::image_crop(
    plot_out,
    geometry = paste0("0x", info$height + 300L),
    gravity = "north"
  )
}

# --- Internal DPI parser -------------------------------------------------

#' @keywords internal
.parse_magick_density_dpi <- function(density) {
  d <- trimws(
    if (is.null(density) || length(density) == 0L) "" else as.character(density)
  )

  if (!nzchar(d)) {
    return(NA_real_)
  }

  dpi <- suppressWarnings(
    as.numeric(sub("^\\s*([0-9]+(?:\\.[0-9]+)?).*$", "\\1", d))
  )

  if (!is.finite(dpi) || dpi <= 0) NA_real_ else dpi
}
