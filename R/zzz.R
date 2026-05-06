# nocov start

.font_path <- function(font_name) {
  font_info <- systemfonts::match_fonts(font_name)
  path <- font_info$path

  if (
    is.null(path) || length(path) != 1L || !nzchar(path) || !file.exists(path)
  ) {
    return(NA_character_)
  }
  return(path)
}

.font_available <- function(font_name) {
  !is.na(.font_path(font_name))
}

.register_font <- function(font_name) {
  path <- .font_path(font_name)
  if (is.na(path)) {
    return(FALSE)
  }

  sysfonts::font_add(font_name, regular = path)

  if (.Platform$OS.type == "windows") {
    tryCatch(
      {
        win_fonts <- get("windowsFonts", envir = asNamespace("grDevices"))
        win_font <- get("windowsFont", envir = asNamespace("grDevices"))

        font_spec <- win_font(family = font_name)
        if (!is.null(font_spec)) {
          font_list <- list(font_spec)
          names(font_list) <- font_name
          win_fonts(font_list)
        }
      },
      error = function(e) invisible(NULL)
    )
  }

  return(TRUE)
}

.onLoad <- function(libname, pkgname) {
  preferred <- c("Proxima Nova", "Arial")

  for (font in preferred) {
    if (.register_font(font)) {
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
