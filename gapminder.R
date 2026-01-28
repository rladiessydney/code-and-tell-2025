# Load required libraries
library(plotly)
library(dplyr)
library(gapminder)  # provides the gapminder dataset

# Filter the dataset to keep only the year 2007 and remove the year column
data <- gapminder %>%
  filter(year == "2007") %>%
  dplyr::select(-year)

# Create a basic bubble plot using ggplot2
p <- data %>%
  arrange(desc(pop)) %>%         # sort by population (largest first)
  mutate(country = factor(country, country)) %>%
  ggplot(aes(
    x = gdpPercap,               # x-axis: GDP per capita
    y = lifeExp,                 # y-axis: life expectancy
    size = pop,                  # bubble size: population
    color = continent,           # bubble color: continent
    
    # Custom tooltip text shown on hover (HTML line breaks)
    text = paste(
      'GDP: ', gdpPercap, '</br>',
      '</br>Life Exp: ', lifeExp,
      '</br>Country: ', country,
      '</br>Population: ', pop,
      '</br>Continent: ', continent
    )
  )) +
  geom_point(alpha = 0.5) +      # scatter points with transparency
  scale_size(range = c(.1, 24), name = "Population (M)")  # adjust bubble sizes

# Convert ggplot into an interactive Plotly chart
# Show only the custom "text" in the tooltip
ggplotly(p, tooltip = c("text"))
