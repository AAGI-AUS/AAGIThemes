# tests/testthat/test-watermark.R
test_that("watermark returns a ggplot layer", {
  skip_if_not_installed("ggplot2")
  layer <- watermark("DRAFT")
  expect_s3_class(layer, "LayerInstance")
})

test_that("watermark with default parameters", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT"))
})

test_that("watermark rejects empty string", {
  skip_if_not_installed("ggplot2")
  expect_error(watermark(""), regexp = "non-empty string")
})

test_that("watermark rejects NA_character_", {
  skip_if_not_installed("ggplot2")
  expect_error(watermark(NA_character_), regexp = "length-1 character string")
})

test_that("watermark rejects whitespace-only string", {
  skip_if_not_installed("ggplot2")
  expect_error(watermark("   "), regexp = "non-empty string")
})

test_that("watermark rejects non-character input", {
  skip_if_not_installed("ggplot2")
  expect_error(watermark(123), regexp = "length-1 character string")
})

test_that("watermark rejects vector with length > 1", {
  skip_if_not_installed("ggplot2")
  expect_error(
    watermark(c("DRAFT", "TEST")),
    regexp = "length-1 character string"
  )
})

test_that("watermark rejects NULL", {
  skip_if_not_installed("ggplot2")
  expect_error(watermark(NULL), regexp = "length-1 character string")
})

test_that("watermark with custom fontsize", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", fontsize = 80))
})

test_that("watermark rejects negative fontsize", {
  skip_if_not_installed("ggplot2")
  expect_error(
    watermark("DRAFT", fontsize = -50),
    regexp = "fontsize.*>\\s*0|must be > 0"
  )
})

test_that("watermark rejects zero fontsize", {
  skip_if_not_installed("ggplot2")
  expect_error(
    watermark("DRAFT", fontsize = 0),
    regexp = "fontsize.*>\\s*0|must be > 0"
  )
})

test_that("watermark rejects non-numeric fontsize", {
  skip_if_not_installed("ggplot2")
  expect_error(
    watermark("DRAFT", fontsize = "large"),
    regexp = "fontsize|numeric"
  )
})

test_that("watermark with custom colour", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", colour = "red"))
})

test_that("watermark rejects non-character colour", {
  skip_if_not_installed("ggplot2")
  expect_error(watermark("DRAFT", colour = 123), regexp = "colour|character")
})

test_that("watermark rejects vector colour", {
  skip_if_not_installed("ggplot2")
  expect_error(
    watermark("DRAFT", colour = c("red", "blue")),
    regexp = "colour|length-1 character string"
  )
})

test_that("watermark with custom alpha", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", alpha = 0.3))
})

test_that("watermark rejects alpha < 0", {
  skip_if_not_installed("ggplot2")
  expect_error(
    watermark("DRAFT", alpha = -0.1),
    regexp = "alpha.*>=\\s*0|must be >= 0"
  )
})

test_that("watermark rejects alpha > 1", {
  skip_if_not_installed("ggplot2")
  expect_error(
    watermark("DRAFT", alpha = 1.5),
    regexp = "alpha.*<=\\s*1|must be <= 1"
  )
})

test_that("watermark accepts alpha = 0", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", alpha = 0))
})

test_that("watermark accepts alpha = 1", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", alpha = 1))
})

test_that("watermark rejects non-numeric alpha", {
  skip_if_not_installed("ggplot2")
  expect_error(watermark("DRAFT", alpha = "opaque"), regexp = "alpha|numeric")
})

test_that("watermark with valid fontface plain", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", fontface = "plain"))
})

test_that("watermark with valid fontface bold", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", fontface = "bold"))
})

test_that("watermark with valid fontface italic", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", fontface = "italic"))
})

test_that("watermark with valid fontface bold.italic", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", fontface = "bold.italic"))
})

test_that("watermark with non-standard fontface errors", {
  skip_if_not_installed("ggplot2")
  expect_error(
    watermark("DRAFT", fontface = "strikethrough"),
    regexp = "not valid|Valid options"
  )
})

test_that("watermark rejects non-numeric angle", {
  skip_if_not_installed("ggplot2")
  expect_error(watermark("DRAFT", angle = "diagonal"), regexp = "angle|numeric")
})

test_that("watermark with custom angle", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT", angle = 45))
})

test_that("watermark in ggplot2 workflow", {
  skip_if_not_installed("ggplot2")
  library(ggplot2)

  p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    theme_aagi() +
    watermark("DRAFT")

  expect_s3_class(p, "ggplot")
})

test_that("watermark with all custom parameters", {
  skip_if_not_installed("ggplot2")
  library(ggplot2)

  p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    theme_aagi() +
    watermark(
      "CONFIDENTIAL",
      fontsize = 100,
      alpha = 0.2,
      colour = "blue",
      fontface = "bold.italic",
      angle = 30
    )

  expect_s3_class(p, "ggplot")
})

test_that("watermark with special characters", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("DRAFT™"))
})

test_that("watermark with unicode characters", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("概念"))
})

test_that("watermark with single character", {
  skip_if_not_installed("ggplot2")
  expect_no_error(watermark("A"))
})
