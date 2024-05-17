display_aagi_pal <- function(n, name, direction) {
  if (n < 3) {
    rlang::warn(
      "The minimal value for {.arg{n}} is 3.
      Displaying requested palette with 3 different levels\n"
    )
    return(scales::show_col(aagi_pal(
      n = 3,
      name = name,
      direction = direction
    )))
  }
  if (n > maxcolors[which(name == namelist)]) {
    rlang::warn(
      "n too large, allowed maximum for palette",
      name,
      "is",
      maxcolors[which(name == namelist)],
      "\nDisplaying the palette you asked for with that many colors\n"
    )
    return(display.brewer.pal(maxcolors[which(name == namelist)], name))
  }
}
