test_that("plot_aagi creates a scatterplot", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(mtcars$wt, mtcars$mpg)
  })
})

test_that("plot_aagi with named vector", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(pressure)
  })
})

test_that("plot_aagi with airquality dataset", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(airquality$Ozone, main = "Air Quality", xlab = "Ozone")
  })
})

test_that("plot_aagi with default AAGI Black colour", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(mtcars$wt, mtcars$mpg)
  })
})

test_that("plot_aagi with custom AAGI colour", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(
      mtcars$wt,
      mtcars$mpg,
      col = "AAGI Teal"
    )
  })
})

test_that("plot_aagi with hex colour", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(
      mtcars$wt,
      mtcars$mpg,
      col = "#414042"
    )
  })
})

test_that("plot_aagi with named R colour", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(
      mtcars$wt,
      mtcars$mpg,
      col = "steelblue"
    )
  })
})

test_that("plot_aagi with NULL colour defaults to AAGI Black", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(mtcars$wt, mtcars$mpg, col = NULL)
  })
})

test_that("plot_aagi with type = 'l' for line plot", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(pressure, type = "l")
  })
})

test_that("plot_aagi with different plot types", {
  png(filename = tempfile())
  on.exit(dev.off())

  plot_types <- c("p", "l", "b", "o", "s", "h")

  for (type in plot_types) {
    expect_no_error({
      plot_aagi(pressure, type = type)
    })
  }
})

test_that("plot_aagi with formula interface", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(mpg ~ wt, data = mtcars)
  })
})

test_that("plot_aagi passes additional graphical parameters", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(
      mtcars$wt,
      mtcars$mpg,
      main = "Weight vs MPG",
      xlab = "Weight",
      ylab = "MPG",
      pch = 16,
      cex = 1.2
    )
  })
})

test_that("plot_aagi with large dataset", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(rnorm(10000), rnorm(10000))
  })
})

test_that("plot_aagi with single point", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(1, 1)
  })
})

test_that("plot_aagi with custom main title", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(mtcars$wt, mtcars$mpg, main = "Custom Title")
  })
})

test_that("plot_aagi with custom axis labels", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(
      mtcars$wt,
      mtcars$mpg,
      xlab = "Weight (1000 lbs)",
      ylab = "Fuel Efficiency (mpg)"
    )
  })
})

test_that("plot_aagi with sub title", {
  png(filename = tempfile())
  on.exit(dev.off())

  expect_no_error({
    plot_aagi(mtcars$wt, mtcars$mpg, sub = "Motor Trend Data")
  })
})
