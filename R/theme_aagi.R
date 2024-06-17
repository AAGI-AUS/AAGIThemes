
#' A ggplot2 Theme Using a Unified AAGI Style and Typography for Plots
#'
#' This theme follows a standard \acronym{AAGI} style including typography
#'   guidelines that uses (hopefully) sensible defaults for \CRANpkg{ggplot2}
#'   graphics.
#'
#' @param base_size `Numeric`.  The figure's base size, set to 12 by default.
#'   For presentations using a larger `base_size` will make the fonts larger and
#'   more suitable for presentation slides, _e.g._, `base_size = 24`.
#' @param major_grid `Boolean`.  Include major gridlines in the panel.  Defaults
#'    to `FALSE` with major gridlines, including those between facets not
#'    included.
#' @param minor_grid `Boolean`.  Include minor gridlines in the panel.  Defaults
#'    to `FALSE` with minor gridlines not included.
#' @param border `Boolean`. Include a border around the figure on all four
#'   sides, *i.e.*, x-axis, y-axis, top and right sides all will have a black
#'   border not just x-axis and y-axis.  Defaults to `FALSE` with only the
#'   x-axis and y-axis being outlined in dark grey.
#' @param ... Other arguments as passed along to `ggplot2::theme()`.
#'
#' @examples
#'
#' library("ggplot2")
#'
#' # Plotting discrete values
#' p1 <- ggplot(mtcars) +
#'   geom_point(aes(
#'     x = wt,
#'     y = mpg,
#'     colour = factor(gear)
#'    )) +
#'   facet_wrap(~ am)
#'
#' p1 + theme_aagi()
#'
#' # Plotting continuous values
#' df <- reshape2::melt(outer(1:4, 1:4), varnames = c("X1", "X2"))
#'
#' p2 <- ggplot(df, aes(X1, X2)) + geom_tile(aes(fill = value)) +
#'   geom_point(aes(size = value))
#' p2 + theme_aagi()
#'
#' # Using a larger base size for presentation slides
#' p1 + theme_aagi(base_size = 24)
#'
#' # Plotting using minor gridlines
#' p1 + theme_aagi(minor_gridlines = TRUE)
#'
#' # Plotting using major gridlines
#' p1 + theme_aagi(major_gridlines = TRUE)
#'
#' p1 + theme_aagi(border = TRUE)
#'
#' # Plotting with both gridlines and border
#' p1 + theme_aagi(minor_gridlines = TRUE,
#'                        major_gridlines = TRUE,
#'                        border = TRUE)
#'
#' @seealso theme_aagi_map
#' @rdname theme_aagi
#' @importFrom ggplot2 `%+replace%`
#' @author Adam Sparks, \email{adam.sparks@@curtin.edu.au}
#' @export

theme_aagi <-
  function(base_size = 12,
           major_grid = FALSE,
           minor_grid = FALSE,
           border = FALSE,
           ...) {

    showtext::showtext_auto()

    base_line_size <- base_size / 12
    base_rect_size <- base_size / 12
    major_grid_size <- base_size / 48
    minor_grid_size <- base_size / 96

    theme_aagi <-
      ggplot2::theme_classic(base_size = base_size,
                             base_family = "Proxima Nova") %+replace%
        ggplot2::theme(
          # match legend key to panel.background
          legend.key = ggplot2::element_blank(),
          #AAGI colour facet strips
          strip.background = ggplot2::element_rect(
           fill = theme.aagi::aagi_colours[[3]],
           colour = theme.aagi::aagi_colours[[3]],
           linewidth = base_line_size
          ),
          strip.text = ggplot2::element_text(
            colour = "#ffffff",
            family = "Proxima Nova",
            face = "bold",
            margin = ggplot2::margin(3, 3, 3, 3, "points")
          ),
          plot.margin = ggplot2::margin(25, 25, 10, 25),
          text = ggplot2::element_text(family = "Proxima Nova",
                                       size = base_size),
          axis.text = ggplot2::element_text(family = "Proxima Nova",
                                            size = base_size),
          legend.text = ggplot2::element_text(family = "Proxima Nova",
                                              size = base_size),
          plot.title = ggplot2::element_text(
            family = "Proxima Nova",
            face = "bold",
            size = base_size * 1.25,
            hjust = 0,
            margin = ggplot2::margin(0, 0, 10, 0)
          ),
          plot.title.position = "plot",
          complete = TRUE
        )

    if (isTRUE(minor_grid)) {
      theme_aagi <- theme_aagi +
        ggplot2::theme(panel.grid.minor =
                         ggplot2::element_line(color = "#e4e4e4",
                                      linewidth = minor_grid_size))
    }

    if (isTRUE(major_grid)) {
      theme_aagi <- theme_aagi +
        ggplot2::theme(panel.grid.major =
                         ggplot2::element_line(color = "#bdbdbd",
                                      linewidth = major_grid_size))
    }

    if (isTRUE(border)) {
      theme_aagi <- theme_aagi +
        ggplot2::theme(panel.border =
                         ggplot2::element_rect(
                           fill = NA,
                           color = "#353535",
                           size = base_rect_size
                         ))
    }

    return(theme_aagi)

  }
