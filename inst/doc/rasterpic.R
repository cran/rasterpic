## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE,
  out.width = "100%"
)

## ----setup--------------------------------------------------------------------
library(sf)
library(terra)
library(rasterpic)

# Plot
library(tidyterra)
library(ggplot2)

# Shape and image
x <- read_sf(system.file("gpkg/austria.gpkg", package = "rasterpic"))
img <- system.file("img/vertical.png", package = "rasterpic")

# Create!

default <- rasterpic_img(x, img)

autoplot(default) +
  geom_sf(data = x)

## -----------------------------------------------------------------------------
expand <- rasterpic_img(x, img, expand = 1)


autoplot(expand) +
  geom_sf(data = x)

## -----------------------------------------------------------------------------
bottom <- rasterpic_img(x, img, valign = 0)

autoplot(bottom) +
  geom_sf(data = x)

## -----------------------------------------------------------------------------
mask <- rasterpic_img(x, img, crop = TRUE, mask = TRUE)

autoplot(mask)

maskinverse <- rasterpic_img(x, img, crop = TRUE, mask = TRUE, inverse = TRUE)

autoplot(maskinverse)

