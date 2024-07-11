# nocov start
.onLoad <-
  function(libname, pkgname) {
    if (any(agrepl("Proxima Nova", systemfonts::system_fonts()[, "name"]))) {
      proxima_path <- systemfonts::match_fonts("Proxima Nova")
      sysfonts::font_add("Proxima Nova",
        regular = proxima_path$path
      )

      if (toupper(Sys.info()["sysname"]) == "WINDOWS") {
        grDevices::windowsFonts(
          "Proxima Nova" =
            grDevices::windowsFont(family = "Proxima Nova")
        )
      }
    } else if (any(agrepl("Arial", systemfonts::system_fonts()[, "name"]))) {
      proxima_path <- systemfonts::match_fonts("Arial")
      sysfonts::font_add("Arial",
        regular = arial$path
      )

      if (toupper(Sys.info()["sysname"]) == "WINDOWS") {
        grDevices::windowsFonts(
          "Arial" =
            grDevices::windowsFont(family = "Arial")
        )
      }
    } else {
      stop("You need to install Proxima Nova or Arial TTF fonts to use {theme.aagi}.")
    }
  }

# nocov end
