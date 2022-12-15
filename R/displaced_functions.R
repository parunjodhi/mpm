#' Distribution of the range of people displaced, in a specific country, by natural disasters and climate change
#'
#' This function visualizes the distribution of internally displaced people in a specific country (default: USA)
#'
#' @param nation Name of country (default: United States)
#'
#' @return A histogram demonstrating the amount of people displaced based on the country selected
#' @export
#'
#' @examples
#' displacement_histogram()
#' displacement_histogram("Haiti")
#' @import ggplot2
#' @import tidyr
#' @import dplyr
displacement_histogram() <-

  function(nation = "United States") {

  histo_data <-
    displaced_by_disaster %>%
    filter(country == nation) %>%
    select(country, displaced_count)

  displaced_histogram <-
    ggplot(histo_data, aes(x = displaced_count)) +
    geom_histogram(colour = "#C04000") +
    scale_x_continuous(labels = displaced_count) +
    labs(
      x = "Internally Displaced People",
      y = "count",
      title = paste("Distribution of Displaced Individuals in ", nation, "from 2008-2021"))

  return(displaced_histogram)}

#' Faceted bar plot visualizing internally displacements individuals and years for three countries in North America
#'
#' This function visualizing the relationship between displacements and years for three countries in North Americ (default: USA)
#'
#' @param nation Name of country (default: United States)
#'
#' @return A histogram demonstrating the amount of people displaced based on the country selected
#' @export
#'
#' @examples
#' displacement_histogram()
#' displacement_histogram("Haiti")
#' @import ggplot2
#' @import tidyr
#' @import dplyr
displacement_histogram <-

  function(nation = "United States") {

    histo_data <-
      displaced_by_disaster %>%
      filter(country == nation) %>%
      select(country, displaced_count)

    displaced_histogram <-
      ggplot(histo_data, aes(x = displaced_count)) +
      geom_histogram(colour = "#C04000") +
      scale_x_continuous(labels = displaced_count) +
      labs(
        x = "Internally Displaced People",
        y = "count",
        title = paste("Distribution of Displaced Individuals in ", nation, "from 2008-2021"))

    return(displaced_histogram)}
