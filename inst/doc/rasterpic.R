## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = "50%",
  message = FALSE,
  warning = FALSE,
  fig.align = "center"
)

## ----setup--------------------------------------------------------------------
library(sf)
library(terra)
library(rasterpic)

x <- st_read(system.file("gpkg/austria.gpkg",
  package = "rasterpic"
),
quiet = TRUE
)
img <- system.file("img/vertical.png",
  package = "rasterpic"
)

# Create!

default <- rasterpic_img(x, img)

plotRGB(default)
plot(st_geometry(x), add = TRUE, col = "grey90")

## -----------------------------------------------------------------------------
expand <- rasterpic_img(x, img, expand = 1)

plotRGB(expand)
plot(st_geometry(x), add = TRUE, col = "grey90")

## -----------------------------------------------------------------------------
bottom <- rasterpic_img(x, img, valign = 0)

plotRGB(bottom)
plot(st_geometry(x), add = TRUE, col = "grey90")

## -----------------------------------------------------------------------------
mask <- rasterpic_img(x, img, crop = TRUE, mask = TRUE)

plotRGB(mask)

maskinverse <- rasterpic_img(x, img,
  crop = TRUE,
  mask = TRUE,
  inverse = TRUE
)

plotRGB(maskinverse)

