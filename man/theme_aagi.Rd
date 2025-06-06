% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_aagi.R
\name{theme_aagi}
\alias{theme_aagi}
\title{A ggplot2 Theme Using a Unified AAGI Style and Typography for Plots}
\usage{
theme_aagi(
  base_size = 9,
  major_grid = FALSE,
  minor_grid = FALSE,
  border = FALSE,
  ...
)
}
\arguments{
\item{base_size}{\code{Numeric}.  The figure's base size, set to 12 by default.
For presentations using a larger \code{base_size} will make the fonts larger and
more suitable for presentation slides, \emph{e.g.}, \code{base_size = 24}.}

\item{major_grid}{\code{Boolean}.  Include major gridlines in the panel.  Defaults
to \code{FALSE} with major gridlines, including those between facets not
included.}

\item{minor_grid}{\code{Boolean}.  Include minor gridlines in the panel.  Defaults
to \code{FALSE} with minor gridlines not included.}

\item{border}{\code{Boolean}. Include a border around the figure on all four
sides, \emph{i.e.}, x-axis, y-axis, top and right sides all will have a black
border not just x-axis and y-axis.  Defaults to \code{FALSE} with only the
x-axis and y-axis being outlined in dark grey.}

\item{...}{Other arguments as passed along to \link[ggplot2:theme]{ggplot2::theme}.}
}
\description{
This theme follows a standard \acronym{AAGI} style including typography
guidelines that uses (hopefully) sensible defaults for \CRANpkg{ggplot2}
graphics.
}
\examples{

library("ggplot2")

# Plotting discrete values
p1 <- ggplot(mtcars) +
  geom_point(aes(
    x = wt,
    y = mpg,
    colour = factor(gear)
  )) +
  facet_wrap(~am)

p1 + theme_aagi()

# Plotting continuous values
df <- reshape2::melt(outer(1:4, 1:4), varnames = c("X1", "X2"))

p2 <- ggplot(df, aes(X1, X2)) +
  geom_tile(aes(fill = value)) +
  geom_point(aes(size = value))
p2 + theme_aagi()

# Using a larger base size for presentation slides
p1 + theme_aagi(base_size = 24)

# Plotting using minor gridlines
p1 + theme_aagi(minor_gridlines = TRUE)

# Plotting using major gridlines
p1 + theme_aagi(major_gridlines = TRUE)

p1 + theme_aagi(border = TRUE)

# Plotting with both gridlines and border
p1 + theme_aagi(
  minor_gridlines = TRUE,
  major_gridlines = TRUE,
  border = TRUE
)

}
\seealso{
theme_aagi_map
}
\author{
Adam Sparks, \email{adam.sparks@curtin.edu.au}
}
