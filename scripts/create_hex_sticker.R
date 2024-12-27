#!/bin/env Rscript
# Code from https://nelson-gon.github.io/12/06/2020/hex-sticker-creation-r/

library(magick)
library(dplyr)
library(hexSticker)

filename <- "man/figures/3093393.png"
if (!file.exists(filename)) {
  filename <- paste0("../", filename)
}
if (!file.exists(filename)) {
  stop("Cannot find filename ", filename)
}


img <- image_read(filename)
img %>%
  image_convert("png") %>%
  image_resize("1080 x 200")%>%
  image_fill(color="#062047", point="+45") %>%
  image_annotate("d?ta", size=38, location = "+47+58", color="black") -> res

res


# wrap in plot to preview ie plot(sticker(...))
final_res<-sticker(
  res,
  package = "heyahmama",
  p_size = 19,
  p_y = 1.5,
  s_x=1, s_y=0.8, s_width=1.1,
  s_height = 14,
  filename = "logo.png",
  h_fill="#eebbee",
  h_color = "#ee00ee"
)

plot(final_res)
