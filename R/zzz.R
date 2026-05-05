# nocov start

.font_available <- function(font_name) {
  fonts <- systemfonts::system_fonts()
  font_family <- if ("family" %in% names(fonts)) "family" else "name"
  any(trimws(fonts[[font_family]]) == font_name)
}

.register_font <- function(font_name) {
  font_info <- systemfonts::match_fonts(font_name)
  if (is.null(font_info$path) || !nzchar(font_info$path)) {
    return(FALSE)
  }

  sysfonts::font_add(font_name, regular = font_info$path)

  if (.Platform$OS.type == "windows") {
    win_fonts <- tryCatch(
      get("windowsFonts", envir = asNamespace("grDevices")),
      error = function(e) NULL
    )
    win_font <- tryCatch(
      get("windowsFont", envir = asNamespace("grDevices")),
      error = function(e) NULL
    )
    if (!is.null(win_fonts) && !is.null(win_font)) {
      font_list <- list(win_font(family = font_name))
      names(font_list) <- font_name
      win_fonts(font_list)
    }
  }
  TRUE
}

.onLoad <- function(libname, pkgname) {
  preferred <- c("Proxima Nova", "Arial")

  for (font in preferred) {
    if (.font_available(font) && .register_font(font)) {
      return(invisible(NULL))
    }
  }

  cli::cli_warn(c(
    "!" = "No supported font found for {.pkg AAGIThemes}.",
    "i" = "Install {.strong Proxima Nova} or {.strong Arial} TTF fonts.",
    "i" = "On Ubuntu/Debian: {.code sudo apt install ttf-mscorefonts-installer}"
  ))
}

# nocov end
