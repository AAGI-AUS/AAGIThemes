test_that("hist_aagi creates a histogram", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    h <- hist_aagi(mtcars$mpg)
  })
})

test_that("hist_aagi with breaks = 'exact'", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    h <- hist_aagi(c(1:10), breaks = "exact")
  })
})

test_that("hist_aagi does not produce warnings", {
  expect_no_warning({
    png(filename = tempfile())
    on.exit(dev.off())
    h <- hist_aagi(mtcars$mpg)
  })
})
