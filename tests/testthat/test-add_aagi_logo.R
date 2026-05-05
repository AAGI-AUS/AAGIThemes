test_that("add_aagi_logo function has correct signature", {
  params <- names(formals(add_aagi_logo))
  expect_true("file_in" %in% params)
  expect_true("file_out" %in% params)
  expect_true("logo_width" %in% params)
  expect_true("overwrite" %in% params)
})

test_that("add_aagi_logo default logo_width is 4.6", {
  sig <- formals(add_aagi_logo)
  expect_equal(sig$logo_width, 4.6)
})

test_that("add_aagi_logo default overwrite is FALSE", {
  sig <- formals(add_aagi_logo)
  expect_equal(sig$overwrite, FALSE)
})

test_that("add_aagi_logo rejects logo_width < 4.6", {
  skip_if_not_installed("magick")

  tmp_in <- file.path(tempdir(), "test_in_small.png")
  tmp_out <- file.path(tempdir(), "test_out_small.png")

  # Create a minimal test image
  magick::image_write(
    magick::image_blank(200, 200, color = "white"),
    tmp_in
  )

  expect_error(
    {
      add_aagi_logo(
        file_in = tmp_in,
        file_out = tmp_out,
        logo_width = 3.0
      )
    },
    regexp = "4.6"
  )

  unlink(tmp_in)
})

test_that("add_aagi_logo rejects logo_width as non-numeric", {
  skip_if_not_installed("magick")

  tmp_in <- file.path(tempdir(), "test_in_non_numeric.png")
  tmp_out <- file.path(tempdir(), "test_out_non_numeric.png")

  magick::image_write(
    magick::image_blank(200, 200, color = "white"),
    tmp_in
  )

  expect_error(
    {
      add_aagi_logo(
        file_in = tmp_in,
        file_out = tmp_out,
        logo_width = "5cm"
      )
    },
    regexp = "numeric value|scalar"
  )

  unlink(tmp_in)
})

test_that("add_aagi_logo accepts valid logo_width = 4.6 (or fails on logo file)", {
  skip_if_not_installed("magick")

  tmp_in <- file.path(tempdir(), "test_in_valid46.png")
  tmp_out <- file.path(tempdir(), "test_out_valid46.png")

  magick::image_write(
    magick::image_blank(200, 200, color = "white"),
    tmp_in
  )

  # Should pass validation. If it errors, should be about logo file, not logo_width
  result <- tryCatch(
    {
      add_aagi_logo(
        file_in = tmp_in,
        file_out = tmp_out,
        logo_width = 4.6
      )
      "success"
    },
    error = function(e) {
      # Check error is NOT about logo_width validation
      if (grepl("logo_width", e$message, ignore.case = TRUE)) {
        stop("logo_width validation failed when it should have passed")
      }
      # Any other error is OK (e.g., logo file not found)
      "error_other"
    }
  )

  # Either success or error from logo file processing
  expect_true(result %in% c("success", "error_other"))

  unlink(tmp_in)
  unlink(tmp_out)
})

test_that("add_aagi_logo accepts valid logo_width > 4.6 (or fails on logo file)", {
  skip_if_not_installed("magick")

  tmp_in <- file.path(tempdir(), "test_in_valid55.png")
  tmp_out <- file.path(tempdir(), "test_out_valid55.png")

  magick::image_write(
    magick::image_blank(200, 200, color = "white"),
    tmp_in
  )

  # Should pass validation. If it errors, should be about logo file, not logo_width
  result <- tryCatch(
    {
      add_aagi_logo(
        file_in = tmp_in,
        file_out = tmp_out,
        logo_width = 5.5
      )
      "success"
    },
    error = function(e) {
      if (grepl("logo_width", e$message, ignore.case = TRUE)) {
        stop("logo_width validation failed when it should have passed")
      }
      "error_other"
    }
  )

  expect_true(result %in% c("success", "error_other"))

  unlink(tmp_in)
  unlink(tmp_out)
})

test_that("add_aagi_logo prevents overwriting without permission", {
  skip_if_not_installed("magick")

  tmp_in <- file.path(tempdir(), "test_in_overwrite.png")
  tmp_out <- file.path(tempdir(), "test_out_overwrite.png")

  magick::image_write(
    magick::image_blank(200, 200, color = "white"),
    tmp_in
  )

  # Create the output file first
  magick::image_write(
    magick::image_blank(100, 100, color = "white"),
    tmp_out
  )

  # Now try to call add_aagi_logo without overwrite - should error on file exists check
  expect_error(
    {
      add_aagi_logo(
        file_in = tmp_in,
        file_out = tmp_out,
        overwrite = FALSE
      )
    },
    regexp = "already exists"
  )

  unlink(tmp_in)
  unlink(tmp_out)
})

test_that("add_aagi_logo allows overwriting with permission (or fails on logo file)", {
  skip_if_not_installed("magick")

  tmp_in <- file.path(tempdir(), "test_in_ow_perm.png")
  tmp_out <- file.path(tempdir(), "test_out_ow_perm.png")

  magick::image_write(
    magick::image_blank(200, 200, color = "white"),
    tmp_in
  )

  # Create the output file first
  magick::image_write(
    magick::image_blank(100, 100, color = "white"),
    tmp_out
  )

  # Should pass the overwrite check and proceed to logo file processing
  result <- tryCatch(
    {
      add_aagi_logo(
        file_in = tmp_in,
        file_out = tmp_out,
        overwrite = TRUE
      )
      "success"
    },
    error = function(e) {
      # Should NOT error on overwrite check
      if (grepl("already exists", e$message)) {
        stop("Overwrite check failed when overwrite = TRUE")
      }
      # Any other error is OK (e.g., logo file not found)
      "error_other"
    }
  )

  expect_true(result %in% c("success", "error_other"))

  unlink(tmp_in)
  unlink(tmp_out)
})

test_that("add_aagi_logo errors on missing file_in", {
  tmp_out <- file.path(tempdir(), "test_out_missing.png")

  expect_error(
    {
      add_aagi_logo(
        file_in = "/nonexistent/path.png",
        file_out = tmp_out
      )
    },
    regexp = "cannot open|file|Cannot"
  )
})
