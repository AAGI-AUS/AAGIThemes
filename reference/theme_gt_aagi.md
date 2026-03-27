# Apply the AAGI Theme to a gt Object

Apply the AAGI theme to a [gt](https://CRAN.R-project.org/package=gt).
An AAGI formatted table body is grey with a teal header and white header
font. Header text is bold, text columns are left aligned, other columns
are right aligned.

## Usage

``` r
theme_gt_aagi(x)
```

## Arguments

- x:

  a [gt](https://CRAN.R-project.org/package=gt) object

## Value

a formatted [gt](https://CRAN.R-project.org/package=gt) object

## See also

Other tables:
[`theme_ft_aagi()`](https://AAGI-AUS.github.io/AAGIThemes/reference/theme_ft_aagi.md)

## Examples

``` r
library(gt)
library(dplyr)
gt <- head(airquality) |>
  mutate(`Month Name` = "May") |>
  gt()
gt <- theme_gt_aagi(gt)
gt


  

Ozone
```

Solar.R

Wind

Temp

Month

Day

Month Name

41

190

7.4

67

5

1

May

36

118

8.0

72

5

2

May

12

149

12.6

74

5

3

May

18

313

11.5

62

5

4

May

NA

NA

14.3

56

5

5

May

28

NA

14.9

66

5

6

May
