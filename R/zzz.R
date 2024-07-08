# nocov start
.onLoad <-
  function(libname, pkgname) {
    proxima_path <- systemfonts::match_font("Proxima Nova")
    sysfonts::font_add("Proxima Nova",
                       regular = proxima_path$path,
                       bold = proxima_path$path)

    if (toupper(Sys.info()["sysname"]) == "WINDOWS") {
      grDevices::windowsFonts("Proxima Nova" =
                                grDevices::windowsFont(family = "Proxima Nova"))
    }
  }
#nocov end
