#' Population for a specific country over the years
#'
#' This function plots the trend in population for a specific country (default: USA) over a period of time (default: 1940-2020)
#'
#' @param nation Name of country (default: United States)
#' @param min_year Start of time period (default: 1940 - also minimum year in dataset)
#' @param max_year End of time period (default: 2020 - also maximum year in dataset)
#'
#' @return A ggplot looking at population vs years for nation specified between time period specified.
#' @export
#'
#' @examples
#' population_plot()
#' population_plot("El Salvador", max_year = 2010)
#' @import ggplot2
#' @import dplyr
population_plot <- function(nation = "United States", min_year = 1940, max_year = 2020) {

  pop_data <- owid_ghg %>%
    filter(country == nation) %>%
    filter(year >= min_year) %>%
    filter(year <= max_year) %>%
    select(year, country, population)

  if(sum(is.na(pop_data)) == nrow(pop_data)) {
    warning(paste("No data avaliable for ", nation, ":", min_year, "-", max_year))
  }

  pop_p <- ggplot(pop_data, aes(x = year, y = population)) +
    geom_line(colour = "#39B778") +
    scale_y_continuous(labels = scales::comma) +
    labs(
      x = "",
      y = "Population",
      title = paste("Population for ", nation, ":", min_year, "-", max_year)
    )

  return(pop_p)
}

#' GDP(in current US$) for a specific country over the years
#'
#' This function plots the trend in GDP(in current US$) for a specific country (default: USA) over a period of time (default: 1940-2020)
#'
#' @param nation Name of country (default: United States)
#' @param min_year Start of time period (default: 1940 - also minimum year in dataset)
#' @param max_year End of time period (default: 2020 - also maximum year in dataset)
#'
#' @return A ggplot looking at GDP vs years for nation specified between time period specified.
#' @export
#'
#' @examples
#' gdp_plot()
#' gdp_plot("Bahamas", min_year = 1980)
#' @import ggplot2
#' @import dplyr
gdp_plot <- function(nation = "United States", min_year = 1940, max_year = 2020) {

  gdp_data <- owid_ghg %>%
    filter(country == nation) %>%
    filter(year >= min_year) %>%
    filter(year <= max_year) %>%
    select(year, country, gdp)

  if(sum(is.na(gdp_data)) == nrow(gdp_data)) {
    warning(paste("No data avaliable for ", nation, ":", min_year, "-", max_year))
  }

  gdp_p <- ggplot(gdp_data, aes(x = year, y = gdp)) +
    geom_line(colour = "#753F8E") +
    scale_y_continuous(labels = scales::dollar) +
    labs(
      x = "",
      y = "GDP",
      title = paste("GDP for ", nation, ":", min_year, "-", max_year)
    )

  return(gdp_p)
}

#' Total Greenhouse Gas Emissions(in million tonnes) for a specific country over the years
#'
#' This function plots the trend in total greenhouse gas(GHG) emissions(in million tonnes) for a specific country (default: USA) over a period of time (default: 1940-2020)
#'
#' @param nation Name of country (default: United States)
#' @param min_year Start of time period (default: 1940 - also minimum year in dataset)
#' @param max_year End of time period (default: 2020 - also maximum year in dataset)
#'
#' @return A ggplot looking at GHG vs years for nation specified between time period specified.
#' @export
#'
#' @examples
#' ghg_plot()
#' ghg_plot("Canada")
#' @import ggplot2
#' @import dplyr
ghg_plot <- function(nation = "United States", min_year = 1940, max_year = 2020) {

    ghg_data <- owid_ghg %>%
      filter(country == nation) %>%
      filter(year >= min_year) %>%
      filter(year <= max_year) %>%
      select(year, country, total_ghg)

    if(sum(is.na(ghg_data)) == nrow(ghg_data)) {
      warning(paste("No data avaliable for ", nation, ":", min_year, "-", max_year))
    }

    ghg_p <- ggplot(ghg_data, aes(x = year, y = total_ghg)) +
      geom_line(colour = "#F90703") +
      scale_y_continuous(labels = scales::comma) +
      labs(
        x = "",
        y = "Total Greenhouse Gas Emissions\n/ million tonnes",
        title = paste("Total Greenhouse Gas Emissions for ", nation, ":\n", min_year, "-", max_year)
      )

    return(ghg_p)
}

