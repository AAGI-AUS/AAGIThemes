# nocov start
.onLoad <-
  function(libname, pkgname) {
    if ("Proxima Nova" %in% systemfonts::system_fonts()[, "name"]) {
      proxima_path <- systemfonts::match_font("Proxima Nova")
      sysfonts::font_add("Proxima Nova",
        regular = proxima_path$path
      )

      if (toupper(Sys.info()["sysname"]) == "WINDOWS") {
        grDevices::windowsFonts(
          "Proxima Nova" =
            grDevices::windowsFont(family = "Proxima Nova")
        )
      }
      return(aagi_font <- "Proxima Nova")

    } else if ("Arial" %in% systemfonts::system_fonts()[, "name"]) {
      proxima_path <- systemfonts::match_font("Arial")
      sysfonts::font_add("Arial",
        regular = arial$path
      )

      if (toupper(Sys.info()["sysname"]) == "WINDOWS") {
        grDevices::windowsFonts(
          "Arial" =
            grDevices::windowsFont(family = "Arial")
        )
      }
      return(aagi_font <- "Arial")

    } else {
      stop("You need to install Proxima Nova or Arial TTF fonts to use {theme.aagi}.")
    }
  }

# nocov end
