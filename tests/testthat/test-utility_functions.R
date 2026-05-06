test_that(".set_aagi_font returns a character scalar", {
  font <- .set_aagi_font()
  expect_type(font, "character")
  expect_length(font, 1)
})

test_that(".set_aagi_font returns a plausible font family", {
  font <- .set_aagi_font()
  # It may be Proxima Nova/Arial if installed, otherwise fallback to "sans"
  expect_true(font %in% c("Proxima Nova", "Arial", "sans"))
})

test_that(".par_aagi returns a list", {
  params <- .par_aagi()
  expect_type(params, "list")
})

test_that(".par_aagi contains expected elements", {
  params <- .par_aagi()

  expect_true("family" %in% names(params))
  expect_true("las" %in% names(params))
  expect_true("mgp" %in% names(params))
  expect_true("cex" %in% names(params))
  expect_true("bty" %in% names(params))
})

test_that(".par_aagi$family is a character scalar", {
  params <- .par_aagi()
  expect_type(params$family, "character")
  expect_length(params$family, 1)
  expect_true(params$family %in% c("Proxima Nova", "Arial", "sans"))
})

test_that(".par_aagi$las is 1", {
  params <- .par_aagi()
  expect_identical(params$las, 1)
})

test_that(".par_aagi$mgp is correct", {
  params <- .par_aagi()
  expect_identical(params$mgp, c(2, 0.5, 0))
})

test_that(".par_aagi$cex is 0.9", {
  params <- .par_aagi()
  expect_identical(params$cex, 0.9)
})

test_that(".par_aagi$bty is 'L'", {
  params <- .par_aagi()
  expect_identical(params$bty, "L")
})

# ===== .convert_aagi_colour TESTS =====

test_that(".convert_aagi_colour converts known AAGI colours to hex", {
  aagi_colours <- c("AAGI Black", "AAGI Grey", "AAGI Teal", "AAGI Orange")
  result <- .convert_aagi_colour(aagi_colours)

  expect_type(result, "character")
  expect_length(result, length(aagi_colours))
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", result)))
})

test_that(".convert_aagi_colour passes through hex colours", {
  hex_colour <- "#414042"
  result <- .convert_aagi_colour(hex_colour)
  expect_identical(result, hex_colour)
})

test_that(".convert_aagi_colour passes through named R colours", {
  r_colours <- c("red", "blue", "steelblue", "black")
  for (colour in r_colours) {
    result <- .convert_aagi_colour(colour)
    expect_identical(result, colour)
  }
})

test_that(".convert_aagi_colour with NULL returns NULL", {
  result <- .convert_aagi_colour(NULL)
  expect_null(result)
})

test_that(".convert_aagi_colour with numeric returns numeric", {
  result <- .convert_aagi_colour(123)
  expect_identical(result, 123)
})

test_that(".convert_aagi_colour with logical returns logical", {
  result <- .convert_aagi_colour(TRUE)
  expect_identical(result, TRUE)
})

test_that(".convert_aagi_colour is case-sensitive", {
  result <- .convert_aagi_colour("aagi black")
  expect_identical(result, "aagi black")
})

test_that(".convert_aagi_colour only converts when prefix is at start", {
  result <- .convert_aagi_colour("Not AAGI Black")
  expect_identical(result, "Not AAGI Black")
})

test_that(".convert_aagi_colour with empty string returns empty string", {
  result <- .convert_aagi_colour("")
  expect_identical(result, "")
})

test_that(".convert_aagi_colour with empty vector returns empty vector", {
  result <- .convert_aagi_colour(character(0))
  expect_length(result, 0)
})

test_that(".convert_aagi_colour handles vector input", {
  colours <- c("AAGI Black", "#414042", "red")
  result <- .convert_aagi_colour(colours)

  expect_type(result, "character")
  expect_length(result, 3)
  expect_match(result[1], "^#[0-9A-Fa-f]{6}$")
  expect_identical(result[2], "#414042")
  expect_identical(result[3], "red")
})

test_that(".convert_aagi_colour is deterministic", {
  colour <- "AAGI Black"
  expect_identical(.convert_aagi_colour(colour), .convert_aagi_colour(colour))
})

test_that(".convert_aagi_colour aborts on invalid AAGI colour", {
  expect_error(
    .convert_aagi_colour("AAGI InvalidColour"),
    regexp = "Could not convert colour name|valid AAGI colour|hex",
    class = "rlang_error"
  )
})
