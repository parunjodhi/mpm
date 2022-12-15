#' Distribution of the range of people displaced by natural disasters and climate change
#'
#' This function visualizes the distribution of internally displaced people based on a specific country (default: USA)
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
    scale_y_continuous(labels = comma) +
    labs(
      x = "Internally Displaced People",
      y = "count",
      title = paste("Distribution of Displaced Individuals in ", nation, "from 2008-2021"))

  return(displaced_histogram)}