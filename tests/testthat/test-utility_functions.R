test_that("set_aagi_font returns a valid font", {
  font <- set_aagi_font()
  expect_true(font %in% c("Proxima Nova", "Arial"))
})

test_that("set_aagi_font returns a character string", {
  font <- set_aagi_font()
  expect_type(font, "character")
  expect_length(font, 1)
})

test_that("par_aagi returns a list", {
  params <- par_aagi()
  expect_type(params, "list")
})

test_that("par_aagi contains expected elements", {
  params <- par_aagi()

  expect_true("family" %in% names(params))
  expect_true("las" %in% names(params))
  expect_true("mgp" %in% names(params))
  expect_true("cex" %in% names(params))
  expect_true("bty" %in% names(params))
})

test_that("par_aagi$family is a valid font", {
  params <- par_aagi()
  expect_type(params$family, "character")
  expect_true(params$family %in% c("Proxima Nova", "Arial"))
})

test_that("par_aagi$las is 1", {
  params <- par_aagi()
  expect_identical(params$las, 1)
})

test_that("par_aagi$mgp is correct", {
  params <- par_aagi()
  expect_identical(params$mgp, c(2, 0.5, 0))
})

test_that("par_aagi$cex is 0.9", {
  params <- par_aagi()
  expect_identical(params$cex, 0.9)
})

test_that("par_aagi$bty is 'L'", {
  params <- par_aagi()
  expect_identical(params$bty, "L")
})

# ===== .convert_aagi_colour TESTS =====

test_that(".convert_aagi_colour converts AAGI Black", {
  result <- .convert_aagi_colour("AAGI Black")
  expect_type(result, "character")
  expect_true(startsWith(result, "#"))
})

test_that(".convert_aagi_colour converts AAGI Grey", {
  result <- .convert_aagi_colour("AAGI Grey")
  expect_type(result, "character")
  expect_true(startsWith(result, "#"))
})

test_that(".convert_aagi_colour converts AAGI Teal", {
  result <- .convert_aagi_colour("AAGI Teal")
  expect_type(result, "character")
  expect_true(startsWith(result, "#"))
})

test_that(".convert_aagi_colour converts AAGI Orange", {
  result <- .convert_aagi_colour("AAGI Orange")
  expect_type(result, "character")
  expect_true(startsWith(result, "#"))
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
  expect_true(result)
})

test_that(".convert_aagi_colour is case-sensitive", {
  # "aagi black" should NOT be converted (lowercase)
  result <- .convert_aagi_colour("aagi black")
  expect_identical(result, "aagi black")
})

test_that(".convert_aagi_colour with AAGI prefix but not at start", {
  # Only converts if "AAGI " is at the START
  result <- .convert_aagi_colour("Not AAGI Black")
  expect_identical(result, "Not AAGI Black")
})

test_that(".convert_aagi_colour with empty string", {
  result <- .convert_aagi_colour("")
  expect_identical(result, "")
})

test_that(".convert_aagi_colour with empty vector", {
  result <- .convert_aagi_colour(character(0))
  expect_length(result, 0)
})

test_that(".convert_aagi_colour handles vector input", {
  colours <- c("AAGI Black", "#414042", "red")
  result <- .convert_aagi_colour(colours)

  expect_type(result, "character")
  expect_length(result, 3)
  expect_true(startsWith(result[1], "#")) # AAGI Black converted to hex
  expect_identical(result[2], "#414042") # hex passed through
  expect_identical(result[3], "red") # R colour passed through
})

test_that(".convert_aagi_colour vector with all AAGI colours", {
  colours <- c("AAGI Black", "AAGI Grey", "AAGI Teal", "AAGI Orange")
  result <- .convert_aagi_colour(colours)

  expect_length(result, 4)
  expect_true(all(startsWith(result, "#")))
})

test_that(".convert_aagi_colour vector with mixed types", {
  colours <- c("AAGI Black", "red", "#FFFFFF")
  result <- .convert_aagi_colour(colours)

  expect_length(result, 3)
  expect_true(startsWith(result[1], "#"))
  expect_identical(result[2], "red")
  expect_identical(result[3], "#FFFFFF")
})

test_that(".convert_aagi_colour is deterministic", {
  colour <- "AAGI Black"
  result1 <- .convert_aagi_colour(colour)
  result2 <- .convert_aagi_colour(colour)
  expect_identical(result1, result2)
})

test_that(".convert_aagi_colour warns on invalid AAGI colour", {
  expect_warning(
    {
      result <- .convert_aagi_colour("AAGI InvalidColour")
    },
    regexp = "Could not convert|hex colour"
  )
})

test_that(".convert_aagi_colour returns value on invalid AAGI colour", {
  suppressWarnings({
    result <- .convert_aagi_colour("AAGI InvalidColour")
  })
  # Should return the original value when conversion fails
  expect_identical(result, "AAGI InvalidColour")
})

test_that(".convert_aagi_colour hex format verification", {
  aagi_colours <- c("AAGI Black", "AAGI Grey", "AAGI Teal", "AAGI Orange")

  for (colour in aagi_colours) {
    result <- .convert_aagi_colour(colour)
    # Check hex format: #RRGGBB
    expect_match(result, "^#[0-9A-Fa-f]{6}$")
  }
})

test_that(".convert_aagi_colour preserves attributes", {
  # Create a vector with names
  colours <- c(primary = "AAGI Black", secondary = "red")
  result <- .convert_aagi_colour(colours)

  expect_type(result, "character")
  expect_length(result, 2)
})
