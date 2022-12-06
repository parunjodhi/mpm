
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mpm

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/mpm)](https://CRAN.R-project.org/package=mpm)
[![R-CMD-check](https://github.com/parunjodhi/mpm/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/parunjodhi/mpm/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Purpose

The goal of this package is to provide a centralized place to clearly
visualize the effects of climate change based on key demographics by
country. `mpm` is a package that contains data about various greenhouse
gas (GHG) emissions by country based on GDP and population.

## Target audience

This package would find excellent use by governmental agencies to
determine how their GHG emissions are affecting their communities.

## Installation

You can install the development version of mpm like so:

``` r
devtools::install_github("parunjodhi/mpm")
```

## Datasets Included

-   `owid_ghg`: A dataset looking at CO2 and Greenhouse Gas (GHG)
    Emissions filtered for countries in North America.

## Functions Included

-   `population_plot`
-   `gdp_plot`
-   `ghg_plot`
-   `all_demographics`

## Basic Usage

These are a few examples of how to use the package and its functions to
wrangle and visualize data related to demographics and emissions in
countries in North America.

Load `mpm` R package

``` r
library(mpm)
```

### Data Visualization functions

1.  Visualize the trend in population for Guatemala from 1980 to 2000

``` r
population_plot("Guatemala", 1980, 2000)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

2.  Visualize the trend in GDP for Canada from 1940 to 2020

``` r
gdp_plot("Canada")
#> Warning: Removed 2 rows containing missing values (`geom_line()`).
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

3.  Visualize the trend in total GHG emissions for the United States
    from 1940 to 2020

``` r
ghg_plot()
#> Warning: Removed 51 rows containing missing values (`geom_line()`).
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

4.  Visualize the trends in population, GDP and total GHG emissions for
    Jamaica from 2000 to 2020

``` r
all_demographics("Jamaica", min_year = 2000)
#> Warning: Removed 2 rows containing missing values (`geom_line()`).
#> Warning: Removed 1 row containing missing values (`geom_line()`).
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

## Plan for Phase III

In Phase III, we plan to expand this package to include a function that
has the ability to plot how GHG emissions affect health issues (asthma,
chronic diseases, air quality) in a given community based on the
variables we have currently included.
