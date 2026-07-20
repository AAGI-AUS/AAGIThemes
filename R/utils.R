#' Font matching + caching utilities
#'
#' These helpers standardise font selection across macOS, Windows and Linux by
#' using `systemfonts::match_fonts()` as the single source of truth (i.e., a
#' font is considered "available" if it resolves to an on-disk font file).
#'
#' @keywords internal
.aagi_font_cache <- new.env(parent = emptyenv())

#' @keywords internal
.is_font_path <- function(path) {
  is.character(path) &&
    length(path) == 1L &&
    nzchar(path) &&
    file.exists(path)
}

#' Resolve a font family name to a font file path (cached)
#'
#' @param font_name A font family name, e.g. "Proxima Nova".
#' @returns A length-1 character path, or NA_character_ if not resolvable.
#' @keywords internal
.match_font_path <- function(font_name) {
  key <- if (is.null(font_name) || length(font_name) != 1L) {
    ""
  } else {
    trimws(as.character(font_name))
  }

  if (!nzchar(key)) {
    return(NA_character_)
  }

  cached <- get0(key, envir = .aagi_font_cache, inherits = FALSE)
  if (!is.null(cached)) {
    return(cached)
  }

  path <- systemfonts::match_fonts(key)$path
  if (!.is_font_path(path)) {
    path <- NA_character_
  }

  assign(key, path, envir = .aagi_font_cache)
  path
}

#' @keywords internal
.font_available <- function(font_name) {
  !is.na(.match_font_path(font_name))
}

#' Choose the first available font from a preferred list
#'
#' @param preferred Character vector of font family names.
#' @returns Font family name, or NA_character_ if none are available.
#' @keywords internal
.choose_aagi_font <- function(preferred = c("Proxima Nova", "Arial")) {
  for (f in preferred) {
    if (.font_available(f)) {
      return(f)
    }
  }
  NA_character_
}

#' Register a font with sysfonts (and Windows device, if applicable)
#'
#' @param font_name Font family name to register.
#' @returns TRUE if registered, FALSE otherwise.
#' @keywords internal
.register_font <- function(font_name) {
  path <- .match_font_path(font_name)
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

  TRUE
}

.aagi_cache <- new.env(parent = emptyenv())

.aagi_cache$font <- NULL

.get_aagi_font <- function() {
  if (is.null(.aagi_cache$font)) {
    .aagi_cache$font <- .set_aagi_font()
  }

  .aagi_cache$font
}

#' Clear cached font resolutions (useful for tests)
#'
#' @keywords internal
.clear_font_cache <- function() {
  rm(
    list = ls(envir = .aagi_font_cache, all.names = TRUE),
    envir = .aagi_font_cache
  )
  invisible(NULL)
}

#' Set AAGI Font for Figures and Tables With Fallback
#'
#' Sets the AAGI font to Proxima Nova first; if it's not available, falls back
#' to Arial as per the \acronym{AAGI} comms guide. If neither is available,
#' returns "sans".
#'
#' @returns A character string with a font family name.
#' @dev
.set_aagi_font <- function() {
  font <- .choose_aagi_font(c("Proxima Nova", "Arial"))
  if (is.na(font)) "sans" else font
}

#' Set Graphical Parameters That Satisfy AAGI's Style Requirements
#'
#' Sets the AAGI font and style for \R base graphics; these match the
#' `theme_aagi()` theme settings for \CRANpkg{ggplot2}.
#'
#' @returns A list object of graphical parameters.
#' @keywords internal
.par_aagi <- function() {
  list(
    family = .set_aagi_font(),
    las = 1,
    mgp = c(2, 0.5, 0),
    cex = 0.9,
    bty = "L"
  )
}

#' Check and convert AAGI colour
#'
#' Checks a string value to see if it's a valid \acronym{AAGI} colour and
#' converts it to the corresponding hexadecimal colour code. This is done by
#' checking for an "AAGI " prefix in the string, as all valid colours from
#' \pkg{AAGIPalettes} will have this.
#'
#' @param x A character string to be checked/converted. Can be length-1 or a
#'   vector.
#'
#' @returns A character string/vector of hex colour codes, or the input
#'   unchanged if it's not an AAGI colour name.
#' @dev

.convert_aagi_colour <- function(x) {
  if (is.null(x) || length(x) == 0L || !is.character(x)) {
    return(x)
  }

  if (length(x) > 1L) {
    return(vapply(x, .convert_aagi_colour, character(1), USE.NAMES = FALSE))
  }

  if (!startsWith(x, "AAGI ")) {
    return(x)
  }

  tryCatch(
    AAGIPalettes::colour_as_hex(x),
    error = function(e) {
      cli::cli_abort(c(
        "Could not convert colour name {.val {x}} to a hex value.",
        "i" = "Is this a valid AAGI colour name from {.pkg AAGIPalettes}?",
        "i" = "Underlying error: {conditionMessage(e)}"
      ))
    }
  )
}

#' Normalize and convert colour-related args found in dots
#'
#' - If an arg is missing/empty/NA, use a default.
#' - If an arg is a character string starting with "AAGI ", convert via
#'   `.convert_aagi_colour()`.
#' - Otherwise leave as-is (supports numeric palette indices, "red", "#RRGGBB",
#'   etc.).
#'
#' @param dots A list, typically created with `list(...)`.
#' @param defaults Named list of defaults, e.g. `list(col = "AAGI Black")`.
#'   Only names present here will be normalised.
#'
#' @returns `dots`, with normalised/converted values for any matching names.
#' @dev

.normalise_one_dot_colour <- function(value, default) {
  if (is.null(value) || length(value) == 0L) {
    if (is.character(default)) {
      default <- .convert_aagi_colour(default)
    }
    return(default)
  }

  if (length(value) == 1L && is.atomic(value) && is.na(value)) {
    if (is.character(default)) {
      default <- .convert_aagi_colour(default)
    }
    return(default)
  }

  if (is.character(value)) {
    return(.convert_aagi_colour(value))
  }

  value
}

#' @keywords internal
.normalise_dots_colours <- function(dots, defaults = list(col = "AAGI Black")) {
  stopifnot(is.list(dots), is.list(defaults))

  nms <- names(defaults)
  if (is.null(nms) || anyNA(nms) || !all(nzchar(nms))) {
    cli::cli_abort("{.var defaults} must be a {.bold named} {.code list}.")
  }

  for (nm in nms) {
    dots[[nm]] <- .normalise_one_dot_colour(dots[[nm]], defaults[[nm]])
  }

  dots
}

#' @keywords internal
.convert_if_aagi_colour <- function(x) {
  if (is.character(x)) .convert_aagi_colour(x) else x
}
