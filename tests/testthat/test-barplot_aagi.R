test_that("barplot_aagi can be called with default parameters", {
  expect_no_error({
    # Wrap in png device to avoid graphics device issues
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(c(10, 20, 30))
  })
})

test_that("barplot_aagi with named vector", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(c(A = 10, B = 20, C = 30))
  })
})

test_that("barplot_aagi with islands dataset", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(islands)
  })
})

test_that("barplot_aagi with default AAGI Black colour", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(c(10, 20, 30))
  })
})

test_that("barplot_aagi with custom AAGI colour", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(c(10, 20, 30), col = "AAGI Teal")
  })
})

test_that("barplot_aagi with hex colour", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(c(10, 20, 30), col = "#414042")
  })
})

test_that("barplot_aagi with named R colour", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(c(10, 20, 30), col = "steelblue")
  })
})

test_that("barplot_aagi translates AAGI colour names", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(c(10, 20, 30), col = "AAGI Orange")
  })
})

test_that("barplot_aagi with matrix input", {
  mat <- matrix(c(10, 20, 30, 40), nrow = 2)

  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(mat)
  })
})

test_that("barplot_aagi passes additional par arguments", {
  expect_no_error({
    png(filename = tempfile())
    on.exit(dev.off())
    barplot_aagi(
      c(10, 20, 30),
      names.arg = c("A", "B", "C"),
      cex.names = 0.8
    )
  })
})
