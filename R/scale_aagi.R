#' AAGI Colour Scales for ggplot2
#'
#' The \acronym{AAGI} scales provide colour maps that are designed to align with
#' the \acronym{AAGI} comms style, be aesthetically pleasing and also
#' to be perceived by viewers with common forms of colour blindness.
#'
#' @param name The name of the scale. Used as the axis or legend title.
#'   If `waiver()``, the default, the name of the scale is taken from the first
#'   mapping used for that aesthetic. If NULL, the legend title will be omitted.
#' @param ... Other arguments passed on to [discrete_scale()],
#' [continuous_scale()], or [binned_scale()] to control name, limits, breaks,
#'   labels and so forth.
#' @param aesthetics Character string or vector of character strings listing the
#'   name(s) of the aesthetic(s) that this scale works with. This can be useful,
#'   for example, to apply colour settings to the `colour` and `fill` aesthetics
#'   at the same time, via `aesthetics = c("colour", "fill")`.
#' @family colour scales
#' @export
#' @examples
#' # aagi is the default colour/fill scale for ordered factors
#' set.seed(596)
#' dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
#' ggplot(dsamp, aes(carat, price)) +
#'   geom_point(aes(colour = clarity))
#'
#' # Use aagi_d with discrete data
#' txsamp <- subset(txhousing, city %in%
#'   c("Houston", "Fort Worth", "San Antonio", "Dallas", "Austin"))
#' (d <- ggplot(data = txsamp, aes(x = sales, y = median)) +
#'   geom_point(aes(colour = city)))
#' d + scale_colour_aagi_d()
#'
#' # Change scale label
#' d + scale_colour_aagi_d("City\nCenter")
#'
#' # Select palette to use, see ?scales::pal_aagi for more details
#' d + scale_colour_aagi_d(option = "plasma")
#' d + scale_colour_aagi_d(option = "inferno")
#'
#' # scale_fill_aagi_d works just the same as
#' # scale_colour_aagi_d but for fill colours
#' p <- ggplot(txsamp, aes(x = median, fill = city)) +
#'   geom_histogram(position = "dodge", binwidth = 15000)
#' p + scale_fill_aagi_d()
#' # the order of colour can be reversed
#' p + scale_fill_aagi_d(direction = -1)
#'
#' # Use aagi_c with continuous data
#' (v <- ggplot(faithfuld) +
#'   geom_tile(aes(waiting, eruptions, fill = density)))
#' v + scale_fill_aagi_c()
#' v + scale_fill_aagi_c(option = "plasma")
#'
#' # Use aagi_b to bin continuous data before mapping
#' v + scale_fill_aagi_b()
#'
scale_colour_aagi_d <- function(name = waiver(),
                                ...,
                                alpha = 1,
                                begin = 0,
                                end = 1,
                                direction = 1,
                                option = "D",
                                aesthetics = "colour") {
  discrete_scale(
    aesthetics,
    name = name,
    palette = pal_aagi(alpha, begin, end, direction, option),
    ...
  )
}

#' @export
#' @rdname scale_aagi
scale_fill_aagi_d <- function(name = waiver(), ..., alpha = 1, begin = 0,
                              end = 1, direction = 1, option = "D",
                              aesthetics = "fill") {
  discrete_scale(
    aesthetics,
    name = name,
    palette = pal_aagi(alpha, begin, end, direction, option),
    ...
  )
}

#' @export
#' @rdname scale_aagi
scale_colour_aagi_c <- function(name = waiver(), ..., alpha = 1, begin = 0,
                                end = 1, direction = 1, option = "D",
                                values = NULL, space = "Lab",
                                na.value = "grey50", guide = "colourbar",
                                aesthetics = "colour") {
  continuous_scale(
    aesthetics,
    name = name,
    palette = pal_gradient_n(
      pal_aagi(alpha, begin, end, direction, option)(6),
      values,
      space
    ),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_aagi
scale_fill_aagi_c <- function(name = waiver(), ..., alpha = 1, begin = 0,
                              end = 1, direction = 1, option = "D",
                              values = NULL, space = "Lab",
                              na.value = "grey50", guide = "colourbar",
                              aesthetics = "fill") {
  continuous_scale(
    aesthetics,
    name = name,
    palette = pal_gradient_n(
      pal_aagi(alpha, begin, end, direction, option)(6),
      values,
      space
    ),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_aagi
scale_colour_aagi_b <- function(name = waiver(), ..., alpha = 1, begin = 0,
                                end = 1, direction = 1, option = "D",
                                values = NULL, space = "Lab",
                                na.value = "grey50", guide = "coloursteps",
                                aesthetics = "colour") {
  pal <- pal_binned(
    pal_aagi(alpha, begin, end, direction, option)
  )

  binned_scale(
    aesthetics,
    name = name,
    palette = pal,
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_aagi
scale_fill_aagi_b <- function(name = waiver(), ..., alpha = 1, begin = 0,
                              end = 1, direction = 1, option = "D",
                              values = NULL, space = "Lab",
                              na.value = "grey50", guide = "coloursteps",
                              aesthetics = "fill") {
  pal <- pal_binned(
    pal_aagi(alpha, begin, end, direction, option)
  )

  binned_scale(
    aesthetics,
    name = name,
    palette = pal,
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @importFrom ggplot2 waiver
#' @export
ggplot2::waiver
