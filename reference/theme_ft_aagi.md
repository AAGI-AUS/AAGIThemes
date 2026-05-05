# Apply AAGI Theme to a flextable Object

Apply theme AAGI to a
[flextable](https://CRAN.R-project.org/package=flextable). An AAGI
formatted table body is grey with a teal header and white header font.
Header text is bold, text columns are left aligned, other columns are
right aligned.

## Usage

``` r
theme_ft_aagi(x)
```

## Arguments

- x:

  a [flextable](https://CRAN.R-project.org/package=flextable) object

## Value

a formatted [flextable](https://CRAN.R-project.org/package=flextable)
object

## Behaviour

Theme functions are not like
[ggplot2](https://CRAN.R-project.org/package=ggplot2) themes. They are
applied to the existing table **immediately**. If you add a row in the
footer, the new row is not formatted with the theme. The theme function
applies the theme only to existing elements when the function is called.

That is why theme functions should be applied after all elements of the
table have been added (mainly additional header or footer rows).

If you want to automatically apply a theme function to each
[flextable](https://CRAN.R-project.org/package=flextable) object, you
can use the `theme_fun` argument of
[flextable::set_flextable_defaults](https://davidgohel.github.io/flextable/reference/set_flextable_defaults.html);
be aware that this theme function is applied as the last instruction
when calling
[`flextable::flextable()`](https://davidgohel.github.io/flextable/reference/flextable.html)
– so if you add headers or footers to the array, they will not be
formatted with the theme.

You can also use the `post_process_html` argument of
[flextable::set_flextable_defaults](https://davidgohel.github.io/flextable/reference/set_flextable_defaults.html)
(or `post_process_pdf`, `post_process_docx`, `post_process_pptx`) to
specify a theme to be applied systematically before the
[flextable::flextable](https://davidgohel.github.io/flextable/reference/flextable.html)
is printed; in this case, don't forget to take care that the theme
doesn't override any formatting done before the print statement.

## See also

Other tables:
[`theme_gt_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/theme_gt_aagi.md)

## Author

Adam H. Sparks, <adam.sparks@curtin.edu.au>

## Examples

``` r
library(flextable)
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
ft <- flextable(head(airquality) |> mutate(`Month Name` = "May"))
ft <- theme_ft_aagi(ft)
ft


.cl-cfb4254e{}.cl-cfaa3d72{font-family:'DejaVu Sans';font-size:11pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(255, 255, 255, 1.00);background-color:transparent;}.cl-cfaa3dae{font-family:'DejaVu Sans';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(65, 64, 66, 1.00);background-color:transparent;}.cl-cfad94a4{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-cfad94ae{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-cfadcc12{width:0.75in;background-color:rgba(0, 128, 139, 1.00);vertical-align: middle;border-bottom: 0.75pt solid rgba(255, 255, 255, 1.00);border-top: 0.75pt solid rgba(255, 255, 255, 1.00);border-left: 0.75pt solid rgba(255, 255, 255, 1.00);border-right: 0.75pt solid rgba(255, 255, 255, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cfadcc1c{width:0.75in;background-color:rgba(0, 128, 139, 1.00);vertical-align: middle;border-bottom: 0.75pt solid rgba(255, 255, 255, 1.00);border-top: 0.75pt solid rgba(255, 255, 255, 1.00);border-left: 0.75pt solid rgba(255, 255, 255, 1.00);border-right: 0.75pt solid rgba(255, 255, 255, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cfadcc26{width:0.75in;background-color:rgba(242, 242, 242, 1.00);vertical-align: middle;border-bottom: 0.75pt solid rgba(255, 255, 255, 1.00);border-top: 0.75pt solid rgba(255, 255, 255, 1.00);border-left: 0.75pt solid rgba(255, 255, 255, 1.00);border-right: 0.75pt solid rgba(255, 255, 255, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-cfadcc27{width:0.75in;background-color:rgba(242, 242, 242, 1.00);vertical-align: middle;border-bottom: 0.75pt solid rgba(255, 255, 255, 1.00);border-top: 0.75pt solid rgba(255, 255, 255, 1.00);border-left: 0.75pt solid rgba(255, 255, 255, 1.00);border-right: 0.75pt solid rgba(255, 255, 255, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}


Ozone
```
