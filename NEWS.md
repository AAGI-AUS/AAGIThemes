# AAGIThemes 1.0.1

## Bug fixes
* Fixed `plot_aagi()` formula interface compatibility: Refactored `plot_aagi()` to properly handle formula-based plotting (e.g., `plot_aagi(y ~ x, data = df)`) by using proper argument splicing instead of `do.call()`, which was breaking formula environments.

* Fixed colour default handling in `plot_aagi()`: Ensured AAGI colour names are properly converted to hex codes and AAGI Black is correctly applied as default when no colour is specified.

* Removed problematic `col` parameter from `par_aagi()`: The global `col` parameter in `par_aagi()` was causing "numerical color values must be >= 0" errors in base graphics functions.
* Colour handling is now per-function only, providing better control and avoiding graphics parameter conflicts.

* Added missing `on.exit()` cleanup in `barplot_aagi()`: Ensured `showtext::showtext_end()` is properly called via `on.exit()` for consistent resource cleanup across all plotting functions.

* Fixed Windows font registration error on CI: Improved `.onLoad()` font registration with comprehensive error handling for Windows environments where `grDevices::windowsFont()` may return invalid values.
* Font registration failures are now silently handled since fonts are already registered via {sysfonts}.

## Internal improvements

* Simplified `plot_aagi()` implementation: Now uses `rlang::call2()` with argument splicing for cleaner, more robust handling of all plot types including formula interfaces.

* Enhanced error resilience in `.register_font()`: Added `tryCatch()` wrapper around Windows-specific font registration to gracefully handle platform-specific font issues without crashing package load.

# AAGIThemes 1.0.0

**First stable release** of {AAGIThemes}, featuring comprehensive input validation, robust error handling, and production-ready graphics theming for AAGI brand guidelines.

## Breaking changes

None. This is the first stable release.

## New features

* **Enhanced `watermark()` function** with comprehensive validation and error messages:
  - Input validation for watermark text (non-empty character strings, rejects NA and whitespace-only)
  - Parameter validation for `fontsize` (positive numbers), `alpha` (0-1 range), `angle` (numeric), `colour` (single character string)
  - Fontface validation with clear error messages listing valid options (`plain`, `bold`, `italic`, `bold.italic`)
  - Improved error handling with `cli` package for user-friendly messages

* **Robust base graphics functions** with improved validation:
  - `plot_aagi()`, `hist_aagi()`, `boxplot_aagi()`, and `barplot_aagi()` now include input validation
  - Colour parameter validation using `rlang::is_scalar_character()`
  - Consistent error handling and messaging across all functions

* **Hardened `.convert_aagi_colour()` utility function**:
  - Vector input support via `vapply()` for batch colour conversions
  - Proper handling of NULL, empty, and non-character inputs
  - Error recovery with user-friendly warnings for invalid AAGI colours
  - Case-sensitive and prefix-aware colour matching

* **Improved `set_aagi_font()` font selection**:
  - Robust fallback from Proxima Nova to Arial when font unavailable
  - System font detection using `systemfonts` package

## Improvements

* **Code quality and robustness**:
  - All functions now use `rlang::is_scalar_*()` for idiomatic modern R type validation
  - Comprehensive input validation prevents invalid states downstream
  - Early returns optimize control flow in utility functions

* **Error messaging**:
  - All error messages use `cli::cli_abort()` and `cli::cli_warn()` for consistent, user-friendly formatting
  - Messages include variable names and valid options using `{.var}` and `{.or}` CLI formatting

* **Code consistency**:
  - Unified validation patterns across all plotting functions
  - Proper use of `on.exit()` for resource cleanup
  - Consistent parameter handling via `withr::local_par()`

## Documentation

* **Comprehensive roxygen2 documentation** for all exported functions
* **Updated examples** in function documentation
* **Cross-references** via `@seealso` for related functions

## Testing

* **Expanded test suite** with 100+ test cases covering:
  - Input validation and edge cases (empty strings, NA values, whitespace-only strings, vectors)
  - Parameter validation (ranges, types, allowed values)
  - Error conditions with proper error message verification
  - Integration tests with `ggplot2` workflows
  - Vector input handling for utility functions

* **All tests pass** on R 4.0+

## Dependencies

* New dependency: `rlang` (imported for modern type validation)
* Updated dependencies: `cli` (enhanced error messaging), `scales` (colour handling)

## Internal changes

* Internal utility functions marked with `@dev` tag: `set_aagi_font()`, `par_aagi()`, `.convert_aagi_colour()`
* Improved separation of concerns between utility and user-facing functions

## Bug fixes

* Fixed `barplot_aagi()` to remove redundant colour validation
* Fixed colour conversion error handling in all plotting functions

## Known issues

None.

## Acknowledgments

* Matt Cowgill and Will Mackey for watermark function design
* GRDC and Curtin University for support

