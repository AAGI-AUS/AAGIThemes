# Changelog

## AAGIThemes 2.1.1

### New features

- Implement session-level font-caching

## AAGIThemes 2.1.1

### Bug fixes

- Deletes unused directories that caused R Build error
- Fix roxygen2 code so that there are no error messages about missing {}

## AAGIThemes 2.1.0

### New features

- [`scale_fill_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/scale_colour_aagi.md)
  and
  [`scale_colour_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/scale_colour_aagi.md)
  are provided for use in {ggplot2} to easily use AAGI colours and
  palettes in graphs.

- `use_aagi_style()` is provided as a full wrapper that allows you to
  create a {ggplot2} object that uses both
  [`theme_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/theme_aagi.md)
  with either of the `scale_aggi_()` functions that autoselect based on
  data type.

## AAGIThemes 2.0.0

### New features

- [`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md)
  now accepts an explicit `y` argument, supporting both `plot_aagi(x)`
  and `plot_aagi(x, y)` calling conventions.

- [`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md)
  default histogram breaks changed from Sturges’ rule to **Scott’s
  rule**, which is more robust for skewed and heavy-tailed data. The
  `breaks` argument now accepts `"scott"` (default), `"sturges"`, `"fd"`
  (Freedman-Diaconis), or `"exact"` (fixed bin width of 1 for integer
  counts).

- [`theme_gt_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/theme_gt_aagi.md)
  now validates that `x` is a `gt_tbl` object before processing,
  providing a clear, user-friendly error message rather than a cryptic
  internal [gt](https://gt.rstudio.com) error.

### Bug fixes

- Fixed a typo where the internal function
  [`.set_aagi_font()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-set_aagi_font.md)
  was mistakenly prefixed as `..set_aagi_font()` in one call path.

- Fixed
  [`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md)
  break computation to gracefully handle degenerate inputs (constant
  vectors or single-value data) without errors.

- Fixed panel graphics issues in
  [`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md)
  where custom axis settings were not applied correctly when
  `par(mfrow)` / `par(mfcol)` was active.

- Fixed
  [`cli::cli_warn()`](https://cli.r-lib.org/reference/cli_abort.html)
  call in
  [`barplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/barplot_aagi.md)
  to wrap the message vector in [`c()`](https://rdrr.io/r/base/c.html),
  resolving a malformed warning.

- Fixed recycling warning in
  [`barplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/barplot_aagi.md)
  to correctly count bars for matrix inputs (now uses
  [`ncol()`](https://rdrr.io/r/base/nrow.html) for matrices instead of
  [`length()`](https://rdrr.io/r/base/length.html)).

- Fixed
  [`theme_gt_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/theme_gt_aagi.md)
  to use the native pipe (`|>`) consistently throughout the
  [gt](https://gt.rstudio.com) pipeline.

- Fixed documentation for
  [`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md):
  the x-axis label defaults to an empty string, not the variable name
  from data.

### Improvements

- The `col` argument has been moved from explicit function parameters
  into `...` across all four base graphics wrappers
  ([`barplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/barplot_aagi.md),
  [`boxplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/boxplot_aagi.md),
  [`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md),
  [`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md)),
  providing a consistent interface and simplifying internal colour
  handling.

- [`watermark()`](https://aagi-aus.github.io/AAGIThemes/reference/watermark.md)
  input validation overhauled: uses dedicated internal assertion helpers
  (`.assert_scalar_string()`, `.assert_scalar_number()`,
  `.assert_one_of()`) with clearer
  [cli](https://cli.r-lib.org)-formatted error messages.

- Font resolution in internal utilities now uses a per-session cache
  (`.aagi_font_cache`) to avoid repeated
  [`systemfonts::match_fonts()`](https://systemfonts.r-lib.org/reference/match_fonts.html)
  calls, improving load performance.

- DPI warning in
  [`add_aagi_logo()`](https://aagi-aus.github.io/AAGIThemes/reference/add_aagi_logo.md)
  softened to an informational message rather than a warning.

- Reduced cyclomatic complexity in
  [`watermark()`](https://aagi-aus.github.io/AAGIThemes/reference/watermark.md)
  and
  [`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md)
  helper functions.

### Internal changes

- Removed dependency on [rlang](https://rlang.r-lib.org) for
  type-checking; all validation now uses idiomatic base R
  ([`is.character()`](https://rdrr.io/r/base/character.html),
  [`length()`](https://rdrr.io/r/base/length.html),
  [`is.na()`](https://rdrr.io/r/base/NA.html), etc.).

- Internal font helpers
  ([`.set_aagi_font()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-set_aagi_font.md),
  [`.par_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-par_aagi.md),
  [`.register_font()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-register_font.md),
  `.font_available()`) are now documented with
  `@dev`/`@keywords internal` and consolidated in `utils.R`.

- [`.set_aagi_font()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-set_aagi_font.md)
  renamed from `set_aagi_font()` (prefixed with `.` to signal its
  internal-only status).

- Removed internal PDF copy of AAGI style guidelines, these are
  available from GitHub,
  <https://github.com/AAGI-AUS/AAGI-Style-Guide-and-Logos>.

### Documentation

- `@returns` tags standardised across all four base graphics functions
  ([`barplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/barplot_aagi.md),
  [`boxplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/boxplot_aagi.md),
  [`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md),
  [`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md)):
  each now leads with the return value first, then notes the
  side-effect.

- Added `@family Baseplots` and `@seealso` cross-references linking all
  four base graphics functions to each other.

- Added missing `@author` tag to
  [`watermark()`](https://aagi-aus.github.io/AAGIThemes/reference/watermark.md).

- Clarified `breaks` options in
  [`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md)
  documentation.

### Testing

- Tests updated to match renamed internal functions and revised function
  signatures.

## AAGIThemes 1.0.1

### Bug fixes

- Fixed
  [`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md)
  formula interface compatibility: Refactored
  [`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md)
  to properly handle formula-based plotting (e.g.,
  `plot_aagi(y ~ x, data = df)`) by using proper argument splicing
  instead of [`do.call()`](https://rdrr.io/r/base/do.call.html), which
  was breaking formula environments.

- Fixed colour default handling in
  [`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md):
  Ensured AAGI colour names are properly converted to hex codes and AAGI
  Black is correctly applied as default when no colour is specified.

- Removed problematic `col` parameter from `par_aagi()`: The global
  `col` parameter in `par_aagi()` was causing “numerical color values
  must be \>= 0” errors in base graphics functions.

- Colour handling is now per-function only, providing better control and
  avoiding graphics parameter conflicts.

- Added missing [`on.exit()`](https://rdrr.io/r/base/on.exit.html)
  cleanup in
  [`barplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/barplot_aagi.md):
  Ensured
  [`showtext::showtext_end()`](https://rdrr.io/pkg/showtext/man/showtext_end.html)
  is properly called via
  [`on.exit()`](https://rdrr.io/r/base/on.exit.html) for consistent
  resource cleanup across all plotting functions.

- Fixed Windows font registration error on CI: Improved `.onLoad()` font
  registration with comprehensive error handling for Windows
  environments where
  [`grDevices::windowsFont()`](https://rdrr.io/r/grDevices/windowsFonts.html)
  may return invalid values.

- Font registration failures are now silently handled since fonts are
  already registered via {sysfonts}.

### Internal improvements

- Simplified
  [`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md)
  implementation: Now uses
  [`rlang::call2()`](https://rlang.r-lib.org/reference/call2.html) with
  argument splicing for cleaner, more robust handling of all plot types
  including formula interfaces.

- Enhanced error resilience in
  [`.register_font()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-register_font.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html) wrapper
  around Windows-specific font registration to gracefully handle
  platform-specific font issues without crashing package load.

## AAGIThemes 1.0.0

**First stable release** of {AAGIThemes}, featuring comprehensive input
validation, robust error handling, and production-ready graphics theming
for AAGI brand guidelines.

### Breaking changes

None. This is the first stable release.

### New features

- **Enhanced
  [`watermark()`](https://aagi-aus.github.io/AAGIThemes/reference/watermark.md)
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
  - [`plot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/plot_aagi.md),
    [`hist_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/hist_aagi.md),
    [`boxplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/boxplot_aagi.md),
    and
    [`barplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/barplot_aagi.md)
    now include input validation
  - Colour parameter validation using
    [`rlang::is_scalar_character()`](https://rlang.r-lib.org/reference/scalar-type-predicates.html)
  - Consistent error handling and messaging across all functions
- **Hardened
  [`.convert_aagi_colour()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-convert_aagi_colour.md)
  utility function**:
  - Vector input support via
    [`vapply()`](https://rdrr.io/r/base/lapply.html) for batch colour
    conversions
  - Proper handling of NULL, empty, and non-character inputs
  - Error recovery with user-friendly warnings for invalid AAGI colours
  - Case-sensitive and prefix-aware colour matching
- **Improved `set_aagi_font()` font selection**:
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

- Internal utility functions marked with `@dev` tag: `set_aagi_font()`,
  `par_aagi()`,
  [`.convert_aagi_colour()`](https://aagi-aus.github.io/AAGIThemes/reference/dot-convert_aagi_colour.md)
- Improved separation of concerns between utility and user-facing
  functions

### Bug fixes

- Fixed
  [`barplot_aagi()`](https://aagi-aus.github.io/AAGIThemes/reference/barplot_aagi.md)
  to remove redundant colour validation
- Fixed colour conversion error handling in all plotting functions

### Known issues

None.

### Acknowledgments

- Matt Cowgill and Will Mackey for watermark function design
- GRDC and Curtin University for support
