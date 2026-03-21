## -----------------------------------------------------------------------------
#| label: fig-setup
#| fig-cap: Raster map geolocated with the coordinates of Austria
library(sf)
library(terra)
library(rasterpic)

# Plot
library(tidyterra)
library(ggplot2)

# Shape and image
x <- read_sf(system.file("gpkg/austria.gpkg", package = "rasterpic"))
img <- system.file("img/vertical.png", package = "rasterpic")

# Create the raster!

default <- rasterpic_img(x, img)

autoplot(default) +
  geom_sf(data = x)


## -----------------------------------------------------------------------------
#| label: fig-expand
#| fig-cap: Example of expansion of image
expand <- rasterpic_img(x, img, expand = 1)

autoplot(expand) +
  geom_sf(data = x)


## -----------------------------------------------------------------------------
#| label: fig-bottom
#| fig-cap: Example of alignment of image
bottom <- rasterpic_img(x, img, valign = 0)

autoplot(bottom) +
  geom_sf(data = x)


## -----------------------------------------------------------------------------
#| label: fig-mask
#| fig-cap:
#|   - Example of masked image
#|   - Example of inverse masked image
mask <- rasterpic_img(x, img, crop = TRUE, mask = TRUE)

autoplot(mask)

maskinverse <- rasterpic_img(x, img, crop = TRUE, mask = TRUE, inverse = TRUE)

autoplot(maskinverse)

