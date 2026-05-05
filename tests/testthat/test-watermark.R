test_that("watermark returns a ggplot layer", {
  skip_if_not_installed("ggplot2")
  library(ggplot2)

  layer <- watermark("DRAFT")
  expect_s3_class(layer, "LayerInstance")
})

test_that("watermark with default parameters", {
  expect_no_error({
    layer <- watermark("DRAFT")
  })
})

test_that("watermark rejects empty string", {
  expect_error(
    {
      watermark("")
    },
    regexp = "non-empty"
  )
})

test_that("watermark rejects NA_character_", {
  expect_error(
    {
      watermark(NA_character_)
    },
    regexp = "non-empty"
  )
})

test_that("watermark rejects whitespace-only string", {
  expect_error(
    {
      watermark("   ")
    },
    regexp = "non-empty"
  )
})

test_that("watermark rejects non-character input", {
  expect_error(
    {
      watermark(123)
    },
    regexp = "character"
  )
})

test_that("watermark rejects vector with length > 1", {
  expect_error(
    {
      watermark(c("DRAFT", "TEST"))
    },
    regexp = "non-empty|character"
  )
})

test_that("watermark rejects NULL", {
  expect_error(
    {
      watermark(NULL)
    },
    regexp = "character"
  )
})

test_that("watermark with custom fontsize", {
  expect_no_error({
    watermark("DRAFT", fontsize = 80)
  })
})

test_that("watermark rejects negative fontsize", {
  expect_error(
    {
      watermark("DRAFT", fontsize = -50)
    },
    regexp = "positive"
  )
})

test_that("watermark rejects zero fontsize", {
  expect_error(
    {
      watermark("DRAFT", fontsize = 0)
    },
    regexp = "positive"
  )
})

test_that("watermark rejects non-numeric fontsize", {
  expect_error(
    {
      watermark("DRAFT", fontsize = "large")
    },
    regexp = "fontsize"
  )
})

test_that("watermark with custom colour", {
  expect_no_error({
    watermark("DRAFT", colour = "red")
  })
})

test_that("watermark rejects non-character colour", {
  expect_error(
    {
      watermark("DRAFT", colour = 123)
    },
    regexp = "colour"
  )
})

test_that("watermark rejects vector colour", {
  expect_error(
    {
      watermark("DRAFT", colour = c("red", "blue"))
    },
    regexp = "colour"
  )
})

test_that("watermark with custom alpha", {
  expect_no_error({
    watermark("DRAFT", alpha = 0.3)
  })
})

test_that("watermark rejects alpha < 0", {
  expect_error(
    {
      watermark("DRAFT", alpha = -0.1)
    },
    regexp = "between 0 and 1"
  )
})

test_that("watermark rejects alpha > 1", {
  expect_error(
    {
      watermark("DRAFT", alpha = 1.5)
    },
    regexp = "between 0 and 1"
  )
})

test_that("watermark accepts alpha = 0", {
  expect_no_error({
    watermark("DRAFT", alpha = 0)
  })
})

test_that("watermark accepts alpha = 1", {
  expect_no_error({
    watermark("DRAFT", alpha = 1)
  })
})

test_that("watermark rejects non-numeric alpha", {
  expect_error(
    {
      watermark("DRAFT", alpha = "opaque")
    },
    regexp = "alpha"
  )
})

test_that("watermark with valid fontface plain", {
  expect_no_error({
    watermark("DRAFT", fontface = "plain")
  })
})

test_that("watermark with valid fontface bold", {
  expect_no_error({
    watermark("DRAFT", fontface = "bold")
  })
})

test_that("watermark with valid fontface italic", {
  expect_no_error({
    watermark("DRAFT", fontface = "italic")
  })
})

test_that("watermark with valid fontface bold.italic", {
  expect_no_error({
    watermark("DRAFT", fontface = "bold.italic")
  })
})

test_that("watermark with non-standard fontface errors", {
  expect_error(
    {
      watermark("DRAFT", fontface = "strikethrough")
    },
    regexp = "not valid|Valid options"
  )
})

test_that("watermark rejects non-numeric angle", {
  expect_error(
    {
      watermark("DRAFT", angle = "diagonal")
    },
    regexp = "angle"
  )
})

test_that("watermark with custom angle", {
  expect_no_error({
    watermark("DRAFT", angle = 45)
  })
})

test_that("watermark in ggplot2 workflow", {
  library(ggplot2)

  p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    theme_aagi() +
    watermark("DRAFT")

  expect_s3_class(p, "ggplot")
})

test_that("watermark with all custom parameters", {
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
  expect_no_error({
    watermark("DRAFT™")
  })
})

test_that("watermark with unicode characters", {
  expect_no_error({
    watermark("概念")
  })
})

test_that("watermark with single character", {
  expect_no_error({
    watermark("A")
  })
})
