# Tests for theme_gt_aagi() function
test_that("theme_gt_aagi applies theme to gt object", {
  skip_if_not_installed("gt")

  library(gt)

  tbl <- gt::gt(head(mtcars))
  themed_tbl <- theme_gt_aagi(tbl)

  expect_s3_class(themed_tbl, "gt_tbl")
})

test_that("theme_gt_aagi with airquality dataset", {
  skip_if_not_installed("gt")
  skip_if_not_installed("dplyr")

  library(gt)
  library(dplyr)

  tbl <- head(airquality) |>
    mutate(`Month Name` = "May") |>
    gt()

  themed_tbl <- theme_gt_aagi(tbl)

  expect_s3_class(themed_tbl, "gt_tbl")
})

test_that("theme_gt_aagi replaces NA with blank", {
  skip_if_not_installed("gt")
  skip_if_not_installed("dplyr")

  library(gt)
  library(dplyr)

  df <- data.frame(
    x = c(1, 2, NA),
    y = c("a", NA, "c")
  )

  tbl <- gt::gt(df)
  themed_tbl <- theme_gt_aagi(tbl)

  expect_s3_class(themed_tbl, "gt_tbl")
})

test_that("theme_gt_aagi is idempotent", {
  skip_if_not_installed("gt")

  library(gt)

  tbl <- gt::gt(head(mtcars))

  themed_once <- theme_gt_aagi(tbl)
  themed_twice <- theme_gt_aagi(themed_once)

  expect_s3_class(themed_twice, "gt_tbl")
})
