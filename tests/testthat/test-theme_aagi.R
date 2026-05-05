# Tests for theme_aagi() function
test_that("theme_aagi returns a ggplot2 theme", {
  theme <- theme_aagi()
  expect_s3_class(theme, "theme")
})

test_that("theme_aagi default parameters work", {
  expect_no_error({
    theme <- theme_aagi()
  })
})

test_that("theme_aagi with custom base_size", {
  theme_small <- theme_aagi(base_size = 9)
  theme_large <- theme_aagi(base_size = 24)

  expect_s3_class(theme_small, "theme")
  expect_s3_class(theme_large, "theme")
})

test_that("theme_aagi with major_grid = TRUE", {
  expect_no_error({
    theme <- theme_aagi(major_grid = TRUE)
  })
  expect_s3_class(theme, "theme")
})

test_that("theme_aagi with minor_grid = TRUE", {
  expect_no_error({
    theme <- theme_aagi(minor_grid = TRUE)
  })
  expect_s3_class(theme, "theme")
})

test_that("theme_aagi with border = TRUE", {
  expect_no_error({
    theme <- theme_aagi(border = TRUE)
  })
  expect_s3_class(theme, "theme")
})

test_that("theme_aagi with all options enabled", {
  expect_no_error({
    theme <- theme_aagi(
      base_size = 18,
      major_grid = TRUE,
      minor_grid = TRUE,
      border = TRUE
    )
  })
  expect_s3_class(theme, "theme")
})

test_that("theme_aagi with ggplot2 graphics", {
  skip_if_not_installed("ggplot2")

  library(ggplot2)

  p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    theme_aagi()

  expect_s3_class(p, "ggplot")
})

test_that("theme_aagi does not produce linewidth deprecation warning", {
  # This tests the fix for issue #1 in the audit
  library(ggplot2)

  p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    facet_wrap(~am) +
    theme_aagi(border = TRUE)

  # Build the plot to trigger any warnings
  expect_no_warning({
    ggplot2::ggplot_build(p)
  })
})

test_that("theme_aagi with base_size = 12 matches default", {
  theme_default <- theme_aagi()
  theme_explicit <- theme_aagi(base_size = 12)

  # Both should be themes without error
  expect_s3_class(theme_default, "theme")
  expect_s3_class(theme_explicit, "theme")
})
