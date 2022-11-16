#' Population for a specifc country over the years
#'
#' This functions plots the trend in population for a specific country (default: USA) over a period of time (default: 1940-2020)
#'
#' @param nation Name of country (default: United States)
#' @param min_year Start of time period (default: 1940 - also minimum year in dataset)
#' @param max_year End of time period (default: 2020 - also maximum year in dataset)
#'
#' @return A ggplot looking at population vs years for nation specified between time period specified
#' @export
#'
#' @examples
#' population_plot()
#' population_plot("El Salvador", 1980)
#' @import ggplot2
#' @import dplyr
population_plot <- function(nation = "United States", min_year = 1940, max_year = 2020) {
  owid_ghg %>%
    filter(country == nation) %>%
    filter(year >= min_year) %>%
    filter(year <= max_year) %>%
    ggplot(aes(x = year, y = population)) +
    geom_line(colour = "darkgreen") +
    scale_y_continuous(labels = scales::comma) +
    labs(
      x = "",
      y = "Population",
      title = paste("Population for ", nation, ":", min_year, "-", max_year)
    )
}
