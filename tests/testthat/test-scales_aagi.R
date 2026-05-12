test_that("scale_colour_aagi() uses default reordered AAGI colours", {
  expected <- unname(AAGIPalettes::aagi_colours[c(
    "AAGI Teal",
    "AAGI Blue",
    "AAGI Bright Green"
  )])

  sc <- scale_colour_aagi()

  result <- sc$palette(3)

  expect_identical(result, expected)
})

test_that("scale_fill_aagi() uses default reordered AAGI colours", {
  expected <- unname(AAGIPalettes::aagi_colours[c(
    "AAGI Teal",
    "AAGI Blue",
    "AAGI Bright Green"
  )])

  sc <- scale_fill_aagi()

  result <- sc$palette(3)

  expect_identical(result, expected)
})

test_that("scale_colour_aagi() uses named AAGI palettes when supplied", {
  expected <- AAGIPalettes::aagi_palettes(
    name = "aagi_greens",
    n = 4
  )

  sc <- scale_colour_aagi(palette = "aagi_greens")

  result <- sc$palette(4)

  expect_identical(result, expected)
})

test_that("scale_fill_aagi() uses named AAGI palettes when supplied", {
  expected <- AAGIPalettes::aagi_palettes(
    name = "aagi_greens",
    n = 4
  )

  sc <- scale_fill_aagi(palette = "aagi_greens")

  result <- sc$palette(4)

  expect_identical(result, expected)
})

test_that("scale_colour_aagi() values overrides default colours", {
  vals <- AAGIPalettes::colour_as_hex(c("AAGI Orange", "AAGI Teal"))

  sc <- scale_colour_aagi(values = vals)

  result <- sc$palette(2)

  expect_identical(result, unname(vals))
})

test_that("scale_fill_aagi() values overrides default colours", {
  vals <- AAGIPalettes::colour_as_hex(c("AAGI Orange", "AAGI Teal"))

  sc <- scale_fill_aagi(values = vals)

  result <- sc$palette(2)

  expect_identical(result, unname(vals))
})

test_that("scale_colour_aagi() errors when values has too few colours", {
  sc <- scale_colour_aagi(values = AAGIPalettes::colour_as_hex("AAGI Teal"))

  expect_error(
    sc$palette(2),
    "Not enough values supplied in"
  )
})

test_that("scale_fill_aagi() errors when values has too few colours", {
  sc <- scale_fill_aagi(values = AAGIPalettes::colour_as_hex("AAGI Teal"))

  expect_error(
    sc$palette(2),
    "Not enough values supplied in"
  )
})

test_that("scale_colour_aagi() errors when default colours are insufficient", {
  sc <- scale_colour_aagi()

  expect_error(
    sc$palette(9),
    "Not enough values in"
  )
})

test_that("scale_fill_aagi() errors when default colours are insufficient", {
  sc <- scale_fill_aagi()

  expect_error(
    sc$palette(9),
    "Not enough values in"
  )
})

test_that("scale_colour_aagi() returns a continuous scale when discrete is FALSE", {
  sc <- scale_colour_aagi(discrete = FALSE)

  expect_s3_class(sc, "ScaleContinuous")
})

test_that("scale_fill_aagi() returns a continuous scale when discrete is FALSE", {
  sc <- scale_fill_aagi(discrete = FALSE)

  expect_s3_class(sc, "ScaleContinuous")
})

test_that("scale_colour_aagi() continuous path accepts colours argument", {
  sc <- scale_colour_aagi(
    discrete = FALSE,
    colours = c("AAGI Orange", "AAGI Yellow", "AAGI Teal")
  )

  expect_s3_class(sc, "ScaleContinuous")
})

test_that("scale_fill_aagi() continuous path accepts colours argument", {
  sc <- scale_fill_aagi(
    discrete = FALSE,
    colours = c("AAGI Orange", "AAGI Yellow", "AAGI Teal")
  )

  expect_s3_class(sc, "ScaleContinuous")
})

test_that(".aagi_default_colour_order() returns expected order", {
  expect_identical(
    .aagi_default_colour_order(),
    c(
      "AAGI Teal",
      "AAGI Blue",
      "AAGI Bright Green",
      "AAGI Orange",
      "AAGI Yellow",
      "AAGI Green",
      "AAGI Black",
      "AAGI Grey"
    )
  )
})
