
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rasterpic <img src="man/figures/logo.png" align="right" height="139"/>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/rasterpic)](https://CRAN.R-project.org/package=rasterpic)
[![CRAN
results](https://cranchecks.info/badges/worst/rasterpic)](https://cran.r-project.org/web/checks/check_results_rasterpic.html)
[![R-CMD-check](https://github.com/dieghernan/rasterpic/actions/workflows/check-full.yaml/badge.svg)](https://github.com/dieghernan/rasterpic/actions/workflows/check-full.yaml)
[![codecov](https://codecov.io/gh/dieghernan/rasterpic/branch/main/graph/badge.svg?token=jSZ4RIsj91)](https://app.codecov.io/gh/dieghernan/rasterpic)
[![r-universe](https://dieghernan.r-universe.dev/badges/rasterpic)](https://dieghernan.r-universe.dev/)
[![DOI](https://img.shields.io/badge/DOI-10.5281/zenodo.5910095-blue)](https://doi.org/10.5281/zenodo.5910095)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![status](https://tinyverse.netlify.com/badge/rasterpic)](https://CRAN.R-project.org/package=rasterpic)

<!-- badges: end -->

**rasterpic** is a tiny package with one single goal: to transform an
image into a spatial raster.

## Installation

Install `rasterpic` from
[**CRAN**](https://CRAN.R-project.org/package=rasterpic):

``` r
install.packages("rasterpic")
```

You can install the developing version of **rasterpic** with:

``` r
devtools::install_github("dieghernan/rasterpic")
```

Alternatively, you can install **rasterpic** using the
[r-universe](https://dieghernan.r-universe.dev/ui#builds):

``` r
# Enable this universe
options(repos = c(
  dieghernan = "https://dieghernan.r-universe.dev",
  CRAN = "https://cloud.r-project.org"
))
install.packages("rasterpic")
```

## Example

This package allows you to create cool maps by using a wide variety of
objects:

-   Spatial object of the **sf** package: `sf`, `sfc`, `sfg`or `bbox`.

-   Spatial objects of the **terra** package: `SpatRaster`,
    `SpatVector`, `SpatExtent`.

-   A vector of coordinates with the form `c(xmin, ymin, xmax, yman)`

An example using a `sf` object:

``` r
library(rasterpic)
library(sf)
library(terra)

# The flag of the United Kingdom
img <- system.file("img/UK_flag.png",
  package = "rasterpic"
)
uk <- st_read(system.file("gpkg/UK.gpkg",
  package = "rasterpic"
),
quiet = TRUE
)

# Rasterize!
uk_flag <- rasterpic_img(uk, img)

uk_flag
#> class       : SpatRaster 
#> dimensions  : 400, 800, 3  (nrow, ncol, nlyr)
#> resolution  : 5398.319, 5398.319  (x, y)
#> extent      : -2542183, 1776472, 6430573, 8589900  (xmin, xmax, ymin, ymax)
#> coord. ref. : WGS 84 / Pseudo-Mercator (EPSG:3857) 
#> source      : memory 
#> names       : lyr.1, lyr.2, lyr.3 
#> min values  :     0,    13,    34 
#> max values  :   255,   255,   255

# Plot it!

plotRGB(uk_flag)
plot(st_geometry(uk),
  add = TRUE,
  col = adjustcolor("blue",
    alpha.f = 0.5
  )
)
```

<img src="man/figures/README-example-basic-1.png" width="50%" style="display: block; margin: auto;" />

We can also play with other parameters, as well as modifying the
alignment of the image with respect to the object:

``` r
# Align, crop and mask
uk_flag2 <- rasterpic_img(uk, img, halign = 0.2, crop = TRUE, mask = TRUE)

plot(st_geometry(uk), axes = TRUE)
plotRGB(uk_flag2, add = TRUE)
plot(st_geometry(uk), col = NA, border = "black", add = TRUE)
```

<img src="man/figures/README-align-crop-mask-1.png" width="50%" style="display: block; margin: auto;" />

You can plot the rasters with **ggplot2** + **tidyterra**:

``` r
library(ggplot2)
library(tidyterra)

ggplot(uk) +
  geom_spatraster_rgb(data = uk_flag2) +
  geom_sf(fill = NA)
```

<img src="man/figures/README-example-ggplot-1.png" width="50%" style="display: block; margin: auto;" />

## Image formats admitted

**rasterpic** can parse the following image formats:

-   `png` files.
-   `jpg/jpeg` files.
-   `tif/tiff` files.

## Citation

To cite ‘rasterpic’ in publications use:

Hernangomez D (2022). rasterpic: Create a Spatial Raster from Plain
Images. <https://doi.org/10.5281/zenodo.5910095>,
<https://dieghernan.github.io/rasterpic/>

A BibTeX entry for LaTeX users is:

    @Manual{R-rasterpic,
      title = {rasterpic: Create a Spatial Raster from Plain Images},
      author = {Diego Hernangómez},
      year = {2022},
      version = {0.2.1},
      doi = {10.5281/zenodo.5910095},
      url = {https://dieghernan.github.io/rasterpic/},
      abstract = {Create a spatial raster, as the ones provided by terra, from regular pictures.},
    }

## Contribute

Check the GitHub page for [source
code](https://github.com/dieghernan/rasterpic/).
