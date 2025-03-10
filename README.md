
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
library(flextable)

flextable(head(airquality) |>
  mutate(`Month Name` = "May")) |>
  theme_ft_aagi()
```

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
