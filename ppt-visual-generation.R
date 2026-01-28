library(tidyverse) # data wrangling+ggplot
library(palmerpenguins) # data
library(rvg) # for vector graphcis
library(officer) # for powerpoint

# Load data
data("penguins")

# Plot data
out.plot <- ggplot(penguins, aes(
  x = flipper_length_mm,
  y = body_mass_g,
  color = species
)) +
  geom_point(na.rm = TRUE) +
  geom_smooth(method = "lm", se = FALSE, na.rm = TRUE) +
  labs(
    title = "Penguin Flipper Length vs Body Mass",
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    color = "Species"
  ) +
  theme_minimal()
  
# Convert ggplot to vector graphic for PowerPoint
pl <- rvg::dml(code = print(out.plot), newpage=FALSE)
  
# Create a ppt and add plot
  doc <- officer::read_pptx()
  doc <- officer::add_slide(doc, layout="Title and Content", master="Office theme")
  doc <- officer::ph_with(doc, pl, location=ph_location(width=8, height=6))

# you can keep using add_slide and ph_with to add more slides/plots
  print(doc, target= "Powerpoint_plots.pptx")