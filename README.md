
---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![R-CMD-check](https://github.com/AAGI-Org-AU-Public/AAGIThemes/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/AAGI-Org-AU-Public/AAGIThemes/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

# {AAGIThemes} AAGI Branding for R Graphical and Tabular Outputs <img align="right" src="man/figures/logo.png">

This repository contains the code for the R package {AAGIThemes}, which once installed in your R session (local or RStudio Server), provides helper functions for creating and exporting graphics created in R with a unified style that follows the AAGI brand guidelines.

The goal of {AAGIThemes} is to provide easy to use theming of R graphics for AAGI team members.
Following AAGI's brand guidelines, AAGI colours are used where applicable and the font defaults to Proxima Nova.
The resulting graphs, plots and charts feature a x and y axis that meet at 0 with no gridlines, but these can optionally be set to appear.
The resulting maps from `theme_aagi_map()` feature a white canvas with the legend on the right.

## Installation instructions

You can install {AAGIThemes} like so:

```r
# install.packages("pak")
pak::pak("AAGI-Org-AU-Public/AAGIThemes")
```

## Quick start

Following are some quick examples of {AAGIThemes} functionality.
However, you may wish to browse the vignette for a more detailed look at what the package offers using:

```r
vignette("Cookbook", package = "AAGIThemes")
```

### Create Tabular Outputs

{AAGIThemes} provides [{flextable}](https://davidgohel.github.io/flextable/) and [{gt}](https://gt.rstudio.com) themes suited for the AAGI style that works in HTML and Word document outputs.

#### Creating Themed {flextable} Outputs

You can use it like so with {flextable}.


``` r
library(AAGIThemes)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(flextable)
ft <- flextable(head(airquality) |>
  mutate(`Month Name` = "May"))
ft <- theme_ft_aagi(ft)
ft
```

<div class="tabwid"><style>.cl-064f998c{}.cl-064c0ef2{font-family:'Proxima Nova';font-size:11pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(255, 255, 255, 1.00);background-color:transparent;}.cl-064c0efc{font-family:'Proxima Nova';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(65, 64, 66, 1.00);background-color:transparent;}.cl-064d637e{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-064d637f{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-064e020c{width:0.75in;background-color:rgba(0, 128, 139, 1.00);vertical-align: middle;border-bottom: 0.75pt solid rgba(255, 255, 255, 1.00);border-top: 0.75pt solid rgba(255, 255, 255, 1.00);border-left: 0.75pt solid rgba(255, 255, 255, 1.00);border-right: 0.75pt solid rgba(255, 255, 255, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-064e020d{width:0.75in;background-color:rgba(0, 128, 139, 1.00);vertical-align: middle;border-bottom: 0.75pt solid rgba(255, 255, 255, 1.00);border-top: 0.75pt solid rgba(255, 255, 255, 1.00);border-left: 0.75pt solid rgba(255, 255, 255, 1.00);border-right: 0.75pt solid rgba(255, 255, 255, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-064e020e{width:0.75in;background-color:rgba(242, 242, 242, 1.00);vertical-align: middle;border-bottom: 0.75pt solid rgba(255, 255, 255, 1.00);border-top: 0.75pt solid rgba(255, 255, 255, 1.00);border-left: 0.75pt solid rgba(255, 255, 255, 1.00);border-right: 0.75pt solid rgba(255, 255, 255, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-064e020f{width:0.75in;background-color:rgba(242, 242, 242, 1.00);vertical-align: middle;border-bottom: 0.75pt solid rgba(255, 255, 255, 1.00);border-top: 0.75pt solid rgba(255, 255, 255, 1.00);border-left: 0.75pt solid rgba(255, 255, 255, 1.00);border-right: 0.75pt solid rgba(255, 255, 255, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.tabwid {
  font-size: initial;
  padding-bottom: 1em;
}

.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
  border-color: transparent;
  caption-side: top;
}
.tabwid-caption-bottom table{
  caption-side: bottom;
}
.tabwid_left table{
  margin-left:0;
}
.tabwid_right table{
  margin-right:0;
}
.tabwid td, .tabwid th {
    padding: 0;
}
.tabwid a {
  text-decoration: none;
}
.tabwid thead {
    background-color: transparent;
}
.tabwid tfoot {
    background-color: transparent;
}
.tabwid table tr {
background-color: transparent;
}
.katex-display {
    margin: 0 0 !important;
}</style><table data-quarto-disable-processing='true' class='cl-064f998c'><thead><tr style="overflow-wrap:break-word;"><th class="cl-064e020c"><p class="cl-064d637e"><span class="cl-064c0ef2">Ozone</span></p></th><th class="cl-064e020c"><p class="cl-064d637e"><span class="cl-064c0ef2">Solar.R</span></p></th><th class="cl-064e020c"><p class="cl-064d637e"><span class="cl-064c0ef2">Wind</span></p></th><th class="cl-064e020c"><p class="cl-064d637e"><span class="cl-064c0ef2">Temp</span></p></th><th class="cl-064e020c"><p class="cl-064d637e"><span class="cl-064c0ef2">Month</span></p></th><th class="cl-064e020c"><p class="cl-064d637e"><span class="cl-064c0ef2">Day</span></p></th><th class="cl-064e020d"><p class="cl-064d637f"><span class="cl-064c0ef2">Month Name</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">41</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">190</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">7.4</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">67</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">5</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">1</span></p></td><td class="cl-064e020f"><p class="cl-064d637f"><span class="cl-064c0efc">May</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">36</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">118</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">8.0</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">72</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">5</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">2</span></p></td><td class="cl-064e020f"><p class="cl-064d637f"><span class="cl-064c0efc">May</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">12</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">149</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">12.6</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">74</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">5</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">3</span></p></td><td class="cl-064e020f"><p class="cl-064d637f"><span class="cl-064c0efc">May</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">18</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">313</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">11.5</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">62</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">5</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">4</span></p></td><td class="cl-064e020f"><p class="cl-064d637f"><span class="cl-064c0efc">May</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc"></span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc"></span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">14.3</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">56</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">5</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">5</span></p></td><td class="cl-064e020f"><p class="cl-064d637f"><span class="cl-064c0efc">May</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">28</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc"></span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">14.9</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">66</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">5</span></p></td><td class="cl-064e020e"><p class="cl-064d637e"><span class="cl-064c0efc">6</span></p></td><td class="cl-064e020f"><p class="cl-064d637f"><span class="cl-064c0efc">May</span></p></td></tr></tbody></table></div>

### Plots and graphs

{AAGIThemes} provides several functions to assist users in creating plots, charts and graphs with a more unified AAGI style.

For creating standalone graphs using R's base library there are:

  * `barplot_aagi()`,

  * `boxplot_aagi()`,

  * `hist_aagi()`, and

  * `plot_aagi()`.

#### Using the basic plot functions

Example of how the base graphics functionality with AAGI style pre-applied is used:


``` r
library(AAGIThemes)
boxplot_aagi(decrease ~ treatment,
  data = OrchardSprays,
  xlab = "treatment",
  ylab = "decrease"
)
```

<div class="figure">
<img src="man/figures/README-boxplot_aagi-1.png" alt="plot of chunk boxplot_aagi" width="100%" />
<p class="caption">plot of chunk boxplot_aagi</p>
</div>

See the respective function's help files and the {AAGIThemes} cookbook for more examples and documentation.

#### Using With {ggplot2}

The function `theme_aagi()` is provided to apply a unified style for creating AAGI themed plots, charts and graphs using {ggplot2}.
The function is very basic and provides only one parameter, `base_size`, which is used to set the font size (in points) used in the resulting figure.
No adjustments are made by the type of graph being produced, so you may wish to add grid lines or change the colour palette that is used to alter point or line colours in your graph.

Example of how `theme_aagi()` is used in a standard {ggplot2} workflow:


``` r
library(AAGIThemes)
library(ggplot2)

ggplot(data = OrchardSprays, aes(x = treatment, y = decrease)) +
  geom_boxplot() +
  scale_y_continuous(breaks = seq(0, 120, by = 20)) +
  theme_aagi()
```

<div class="figure">
<img src="man/figures/README-theme_aagi_ggboxplot-1.png" alt="plot of chunk theme_aagi_ggboxplot" width="100%" />
<p class="caption">plot of chunk theme_aagi_ggboxplot</p>
</div>


## Logo Rights

The logo of this project and the AAGI strategic partners do not come under MIT License.
The Analytics for the Australian Grains Industry (AAGI) project retains full rights to the AGGI logo and the Grains Research and Development Corporation (GRDC) and strategic partners, Curtin University, the University of Queensland and Adelaide University, retain full rights to their own logos, respectively.
