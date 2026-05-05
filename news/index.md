# Changelog

## AAGIThemes 1.0.0

**First stable release** of AAGIThemes, featuring comprehensive input
validation, robust error handling, and production-ready graphics theming
for AAGI brand guidelines.

### Breaking changes

None. This is the first stable release.

### New features

- **Enhanced
  [`watermark()`](https://AAGI-AUS.github.io/AAGIThemes/reference/watermark.md)
  function** with comprehensive validation and error messages:
  - Input validation for watermark text (non-empty character strings,
    rejects NA and whitespace-only)
  - Parameter validation for `fontsize` (positive numbers), `alpha` (0-1
    range), `angle` (numeric), `colour` (single character string)
  - Fontface validation with clear error messages listing valid options
    (`plain`, `bold`, `italic`, `bold.italic`)
  - Improved error handling with `cli` package for user-friendly
    messages
- **Robust base graphics functions** with improved validation:
  - [`plot_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/plot_aagi.md),
    [`hist_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/hist_aagi.md),
    [`boxplot_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/boxplot_aagi.md),
    and
    [`barplot_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/barplot_aagi.md)
    now include input validation
  - Colour parameter validation using
    [`rlang::is_scalar_character()`](https://rlang.r-lib.org/reference/scalar-type-predicates.html)
  - Consistent error handling and messaging across all functions
- **Hardened
  [`.convert_aagi_colour()`](https://AAGI-AUS.github.io/AAGIThemes/reference/dot-convert_aagi_colour.md)
  utility function**:
  - Vector input support via
    [`vapply()`](https://rdrr.io/r/base/lapply.html) for batch colour
    conversions
  - Proper handling of NULL, empty, and non-character inputs
  - Error recovery with user-friendly warnings for invalid AAGI colours
  - Case-sensitive and prefix-aware colour matching
- **Improved
  [`set_aagi_font()`](https://AAGI-AUS.github.io/AAGIThemes/reference/set_aagi_font.md)
  font selection**:
  - Robust fallback from Proxima Nova to Arial when font unavailable
  - System font detection using `systemfonts` package

### Improvements

- **Code quality and robustness**:
  - All functions now use `rlang::is_scalar_*()` for idiomatic modern R
    type validation
  - Comprehensive input validation prevents invalid states downstream
  - Early returns optimize control flow in utility functions
- **Error messaging**:
  - All error messages use
    [`cli::cli_abort()`](https://cli.r-lib.org/reference/cli_abort.html)
    and
    [`cli::cli_warn()`](https://cli.r-lib.org/reference/cli_abort.html)
    for consistent, user-friendly formatting
  - Messages include variable names and valid options using `{.var}` and
    `{.or}` CLI formatting
- **Code consistency**:
  - Unified validation patterns across all plotting functions
  - Proper use of [`on.exit()`](https://rdrr.io/r/base/on.exit.html) for
    resource cleanup
  - Consistent parameter handling via
    [`withr::local_par()`](https://withr.r-lib.org/reference/with_par.html)

### Documentation

- **Comprehensive roxygen2 documentation** for all exported functions
- **Updated examples** in function documentation
- **Cross-references** via `@seealso` for related functions

### Testing

- **Expanded test suite** with 100+ test cases covering:
  - Input validation and edge cases (empty strings, NA values,
    whitespace-only strings, vectors)
  - Parameter validation (ranges, types, allowed values)
  - Error conditions with proper error message verification
  - Integration tests with `ggplot2` workflows
  - Vector input handling for utility functions
- **All tests pass** on R 4.0+

### Dependencies

- New dependency: `rlang` (imported for modern type validation)
- Updated dependencies: `cli` (enhanced error messaging), `scales`
  (colour handling)

### Internal changes

- Internal utility functions marked with `@dev` tag:
  [`set_aagi_font()`](https://AAGI-AUS.github.io/AAGIThemes/reference/set_aagi_font.md),
  [`par_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/par_aagi.md),
  [`.convert_aagi_colour()`](https://AAGI-AUS.github.io/AAGIThemes/reference/dot-convert_aagi_colour.md)
- Improved separation of concerns between utility and user-facing
  functions

### Bug fixes

- Fixed
  [`barplot_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/barplot_aagi.md)
  to remove redundant colour validation
- Fixed colour conversion error handling in all plotting functions

### Known issues

None.

### Acknowledgments

- Matt Cowgill and Will Mackey for watermark function design
- GRDC and Curtin University for support
