test_that("colours are interpolated", {
  x <- interpolate_aagi_palette("colourful")
  expect_length(x(10), 10)
})
