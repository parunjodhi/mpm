globalVariables(c("owid_ghg", "country", "year", "gdp", "owid_ghg", "total_ghg", "population", "lm", "predict", "owid_data", "air_pol_data", "all_data", "air_data", "year.y", "year.x"))


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
#' @import scales
population_plot <- function(nation = "United States", min_year = 1940, max_year = 2020) {

  pop_data <- owid_ghg %>%
    filter(country == nation) %>%
    filter(year >= min_year) %>%
    filter(year <= max_year) %>%
    select(year, country, population)

  if(sum(is.na(pop_data)) == nrow(pop_data)) {
    warning(paste("No population data avaliable for ", nation, ":", min_year, "-", max_year))
  }

  pop_p <- ggplot(pop_data, aes(x = year, y = population)) +
    geom_line(colour = "#39B778") +
    scale_y_continuous(labels = comma) +
    labs(
      x = "",
      y = "Population",
      title = paste("Population for ", nation, ":\n", min_year, "-", max_year)
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
#' @import scales
gdp_plot <- function(nation = "United States", min_year = 1940, max_year = 2020) {

  gdp_data <- owid_ghg %>%
    filter(country == nation) %>%
    filter(year >= min_year) %>%
    filter(year <= max_year) %>%
    select(year, country, gdp)

  if(sum(is.na(gdp_data)) == nrow(gdp_data)) {
    warning(paste("No GDP data avaliable for ", nation, ":", min_year, "-", max_year))
  }

  gdp_p <- ggplot(gdp_data, aes(x = year, y = gdp)) +
    geom_line(colour = "#753F8E") +
    scale_y_continuous(labels = dollar) +
    labs(
      x = "",
      y = "GDP",
      title = paste("GDP for ", nation, ":\n", min_year, "-", max_year)
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
#' @import scales
ghg_plot <- function(nation = "United States", min_year = 1940, max_year = 2020) {

    ghg_data <- owid_ghg %>%
      filter(country == nation) %>%
      filter(year >= min_year) %>%
      filter(year <= max_year) %>%
      select(year, country, total_ghg)

    if(sum(is.na(ghg_data)) == nrow(ghg_data)) {
      warning(paste("No GHG emissions data avaliable for ", nation, ":", min_year, "-", max_year))
    }

    ghg_p <- ggplot(ghg_data, aes(x = year, y = total_ghg)) +
      geom_line(colour = "#F90703") +
      scale_y_continuous(labels = comma) +
      labs(
        x = "",
        y = "Total Greenhouse Gas \nEmissions/ million tonnes",
        title = paste("Total Greenhouse Gas Emissions for\n", nation, ":", min_year, "-", max_year)
      )

    return(ghg_p)
}


#' Population, GDP, Total Greehouse Gas Emissions(GHG) over the years for a specific country
#'
#' This function plots 3 plots respectively showing (1) Population vs years (2) GDP(in current US$) vs years (3) Total GHG(million tonnes) vs years for a spcific country
#'
#' @param nation Name of country (default: United States)
#' @param min_year Start of time period (default: 1940 - also minimum year in dataset)
#' @param max_year End of time period (default: 2020 - also maximum year in dataset)
#'
#' @return 3 ggplots showing the relationships described above
#' @export
#'
#' @examples
#' all_demographics()
#' all_demographics("Mexico", min_year = 2000)
#' @import ggplot2
#' @import dplyr
#' @import ggpubr
#' @import scales
all_demographics <- function(nation = "United States", min_year = 1940, max_year = 2020) {


  pop_graph <- population_plot(nation, min_year, max_year)

  gdp_graph <- gdp_plot(nation, min_year, max_year)

  ghg_graph <- ghg_plot(nation, min_year, max_year)


  ggarrange(pop_graph, gdp_graph, ghg_graph, ncol = 2, nrow = 2)

}

#' Predict the population for a specific country for a specific year
#'
#' @param pred_yr Year for predicted value
#' @param nation Name of country (default: United States)
#'
#' @return A printed message stating the predicted value for the year and nation specified
#' @export
#'
#' @examples
#' population_predict(2030)
#' population_predict(2025, "Jamaica")
#' @import dplyr
population_predict <- function(pred_yr, nation = "United States") {

  new_data <- owid_ghg %>%
    filter(country == nation) %>%
    select(year, country, population)

  if(sum(is.na(new_data)) == nrow(new_data)) {
    stop(paste("No population data avaliable for ", nation))
  }

  model <- lm(population ~ year, data = new_data)
  pred_value <- predict(model, data.frame(year = pred_yr))

  warning(paste("This prediction is based off of a linear regression model, even if the data might not follow a linear pattern over the years. This is for estimation purposes only."))

  paste0("The population predicted for ", nation, " for the year ", pred_yr, " is ", pred_value, " people.")
}

#' Predict the GDP in current US$ for a specific country for a specific year
#'
#' @param pred_yr Year for predicted value
#' @param nation Name of country (default: United States)
#'
#' @return A printed message stating the predicted value for the year and nation specified
#' @export
#'
#' @examples
#' gdp_predict(2025)
#' gdp_predict(2041, "Barbados")
#' @import dplyr
gdp_predict <- function(pred_yr, nation = "United States") {

  new_data <- owid_ghg %>%
    filter(country == nation)%>%
    select(year, country, gdp)

  if(sum(is.na(new_data)) == nrow(new_data)) {
    stop(paste("No GDP data avaliable for ", nation))
  }

  model <- lm(gdp ~ year, data = new_data)
  pred_value <- predict(model, data.frame(year = pred_yr))

  warning(paste("This prediction is based off of a linear regression model, even if the data might not follow a linear pattern over the years. This is for estimation purposes only."))

  paste0("The GDP predicted for ", nation, " for the year ", pred_yr, " is US$", pred_value, ".")
}

#' Predict the Total Greenhouse Gas Emissions in million tonnes for a specific country for a specific year
#'
#' @param pred_yr Year for predicted value
#' @param nation Name of country (default: United States)
#'
#' @return A printed message stating the predicted value for the year and nation specified
#' @export
#'
#' @examples
#' ghg_predict(2033)
#' ghg_predict(2024, "Belize")
#' @import dplyr
ghg_predict <- function(pred_yr, nation = "United States") {

  new_data <- owid_ghg %>%
    filter(country == nation)%>%
    select(year, country, total_ghg)

  if(sum(is.na(new_data)) == nrow(new_data)) {
    stop(paste("No GDP data avaliable for ", nation))
  }

  model <- lm(total_ghg ~ year, data = new_data)
  pred_value <- predict(model, data.frame(year = pred_yr))

  warning(paste("This prediction is based off of a linear regression model, even if the data might not follow a linear pattern over the years. This is for estimation purposes only."))

  paste0("The Total GreenHouse Gas Emissions predicted for ", nation, " for the year ", pred_yr, " is ", pred_value, " million tonnes.")
}

#' Gather data from all data sets in package for a specific country
#'
#' @param nation Name of country
#'
#' @return data frame consisting of all data from all data sets in package for a specific country
#' @export
#'
#' @examples
#' all_data_country("El Salvador")
#' all_data_country("Canada")
#' @import dplyr
all_data_country <- function(nation) {
  owid_data <- owid_ghg %>%
    filter(country == nation)

  air_pol_data <- air_data %>%
    filter(country == nation)

  all_data <- owid_data %>%
    full_join(air_pol_data, by = "country") %>%
    select(-year.y) %>%
    mutate(year = year.x) %>%
    select(-year.x) %>%
    select(year, everything())

  return(all_data)
}
