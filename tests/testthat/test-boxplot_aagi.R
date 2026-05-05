test_that("boxplot_aagi creates a boxplot", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    boxplot_aagi(mtcars$mpg)
  })
})

test_that("boxplot_aagi with formula interface", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    boxplot_aagi(mpg ~ cyl, data = mtcars)
  })
})

test_that("boxplot_aagi with custom AAGI colour", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    boxplot_aagi(mtcars$mpg, col = "AAGI Orange")
  })
})

test_that("boxplot_aagi with hex colour", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    boxplot_aagi(mtcars$mpg, col = "#ec8525")
  })
})
