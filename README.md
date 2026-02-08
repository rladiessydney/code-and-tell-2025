# Code-and-tell-2025
This is the Repo for the code and tell event.

## Introduction to Gapminder
gapminder.R creates an interactive bubble chart using the Gapminder dataset for the year 2007 with Life expectancy vs. GDP per capita, Population as the bubble size, color as Continent.
Then ggplotly() converts the ggplot into a Plotly interactive chart, where hovering over each bubble shows a tooltip with:
GDP per capita
Life expectancy
Country
Population
Continent

## R → PowerPoint (Vector ggplot) using `officer` + `rvg`
ppt-visual-generation.R demonstrates how to create a ggplot visualization using the `palmerpenguins` dataset, convert it into a true vector graphic, and insert it into a PowerPoint file where it remains fully editable.

## Requirements
Install the required packages:
```r
install.packages(c("tidyverse", "palmerpenguins", "officer", "rvg"))
```

## Usage
The script loads the `penguins` dataset and creates a scatter plot of flipper length versus body mass, colored by species, with a linear regression trendline. It then embeds this plot as a vector graphic in PowerPoint.

Run the script:
```r
source("penguin_plot_to_ppt.R")
```
This generates `Powerpoint_plots.pptx` in your working directory.

## Why use `rvg::dml()`?
Standard PowerPoint export methods often embed plots as raster images (PNG), which become blurry when scaled. The `rvg::dml()` function exports plots as DrawingML vector graphics, enabling crisp scaling at any size, editing of individual plot elements directly in PowerPoint, and consistent formatting across presentations.

## About Gander
The **`gander` R package** is used to create **simple, readable summaries of a dataset**—especially useful for quick exploratory data analysis (EDA). It helps you “gander” at your data by showing **column types, missing values, unique counts, and basic statistics** in a clean format. It’s handy when you want a fast overview before doing deeper analysis. Overall, it makes data-checking quicker and more structured.
For further information on gander, check out: https://simonpcouch.github.io/gander/

Example:
`install.packages("gander")
library(gander)
df <- data.frame(
  name = c("A", "B", "C", NA),
  age  = c(21, 25, NA, 30),
  city = c("Sydney", "Melbourne", "Sydney", "Brisbane")
)
gander(df) # gives a quick overview of the dataset`

## About Posit Copilot for R
GitHub Copilot integrates with RStudio and Posit IDE to provide AI-powered code suggestions as you type. It completes R code, suggests `tidyverse` pipelines and `ggplot2` functions, helps write roxygen documentation, and generates test skeletons. 

Copilot appears as ghost text suggestions in the IDE that you accept with `Tab`. It's not an R package but an IDE feature. It's particularly useful for streamlining `tidyverse` workflows, repetitive ggplot formatting, `officer` boilerplate code, and function scaffolding.

## Writing Effective Prompts for R
Guide Copilot with clear comments:
'Create a ggplot scatter plot of flipper_length_mm vs body_mass_g with lm line'
'Convert ggplot to vector graphic for PowerPoint using rvg + officer'
Copilot performs best when you write clear variable names, keep functions small, use standard R style conventions, and follow consistent tidyverse patterns.

## Safety Tips for Academic Work
Copilot can generate incorrect code confidently. Always run the code to verify it works, check that function names are correct, and verify dataset column names match your data.
