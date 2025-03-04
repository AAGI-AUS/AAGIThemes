# nocov start
.onLoad <-
  function(libname, pkgname) {
    if (any(agrepl("Proxima Nova", systemfonts::system_fonts()[, "name"]))) {
      proxima_path <- systemfonts::match_fonts("Proxima Nova")
      sysfonts::font_add("Proxima Nova", regular = proxima_path$path)

      if (toupper(Sys.info()["sysname"]) == "WINDOWS") {
        grDevices::windowsFonts(
          "Proxima Nova" = grDevices::windowsFont(family = "Proxima Nova")
        )
      }
    } else if (any(agrepl("Arial", systemfonts::system_fonts()[, "name"]))) {
      arial_path <- systemfonts::match_fonts("Arial")
      sysfonts::font_add("Arial", regular = arial_path$path)

      if (toupper(Sys.info()["sysname"]) == "WINDOWS") {
        grDevices::windowsFonts(
          "Arial" = grDevices::windowsFont(family = "Arial")
        )
      }
    } else {
      cli::cli_warn(
        c(
          "You need to install {cli::symbol$dquote_left}Proxima
        Nova{cli::symbol$dquote_right} or
        {cli::symbol$dquote_left}Arial{cli::symbol$dquote_right} TTF fonts to
        properly use {.pkg AAGIThemes} properly."
        )
      )
    }
  }
# nocov end
