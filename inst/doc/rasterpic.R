## -----------------------------------------------------------------------------
#| label: fig-setup
#| fig-cap: Image geotagged with the coordinates of Austria.
library(sf)
library(terra)
library(rasterpic)

# Load plotting packages.
library(tidyterra)
library(ggplot2)

# Set the spatial object and image.
x <- read_sf(system.file("gpkg/austria.gpkg", package = "rasterpic"))
img <- system.file("img/vertical.png", package = "rasterpic")

# Geotag the image.
default <- rasterpic_img(x, img)

autoplot(default) +
  geom_sf(data = x)


## -----------------------------------------------------------------------------
#| label: fig-expand
#| fig-cap: Example image expansion.
expand <- rasterpic_img(x, img, expand = 1)

autoplot(expand) +
  geom_sf(data = x)


## -----------------------------------------------------------------------------
#| label: fig-bottom
#| fig-cap: Example image alignment.
bottom <- rasterpic_img(x, img, valign = 0)

autoplot(bottom) +
  geom_sf(data = x)


## -----------------------------------------------------------------------------
#| label: fig-mask
#| fig-cap:
#|   - Example masked image.
#|   - Example inverse masked image.
mask <- rasterpic_img(x, img, crop = TRUE, mask = TRUE)

autoplot(mask)

maskinverse <- rasterpic_img(x, img, crop = TRUE, mask = TRUE, inverse = TRUE)

autoplot(maskinverse)

