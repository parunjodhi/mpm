globalVariables(c("displaced_count", "year", "country"))

#' Distribution of the Internally Displaced Individuals Over Thirteen Years (2008-2021)
#'
#' This function visualizes the distribution of people internally displaced by natural disasters and climate change in a specific country (default: USA)
#'
#' @param nation Name of country (default: United States)
#'
#' @return A histogram demonstrating the amount of people displaced based on the country selected
#' @export
#'
#' @examples
#' displaced_histogram()
#' displaced_histogram("Dominican Republic")
#' @import ggplot2
#' @import tidyr
#' @import scales
displaced_histogram <-

  function(nation = "United States") {

  histo_data <-
    displaced_by_disaster %>%
    filter(country == nation) %>%
    select(country, displaced_count)

  histo_displaced <-
    ggplot(histo_data, aes(x = displaced_count)) +
    geom_histogram(fill="#69b3a2", color="#e9ecef", alpha=0.9, bins=20) +
    scale_x_continuous(labels = comma) +
    labs(
      x = "Internally Displaced People",
      y = "count",
      title = paste("Distribution of Displaced Individuals in", nation, "\nfrom 2008-2021"))

  return(histo_displaced)}

#' Internally Displaced Individuals Over Thirteen Years (2008-2021)
#'
#' This function produces a line graph comparing the amount of displaced individuals over 13 years for two regions (a country and North America, or two countries)(default: USA)
#'
#' @param nation Name of country (default: United States)
#'
#' @return A faceted-line graph demonstrating the amount of people displaced from 2008 to 2021 in two countries, or one country and North America
#' @export
#'
#' @examples
#' displaced_linegraph ()
#' displaced_linegraph("Haiti")
#' @import ggplot2
#' @import tidyr
#' @import scales
displaced_linegraph <-

  function(nation = "United States") {

    trends_data <-
      displaced_by_disaster %>%
      filter(country == nation) %>%
      select(country, year, displaced_count)

    line_displaced <-
      ggplot(trends_data, aes(x = year, y = displaced_count)) +
      geom_line() + scale_color_brewer(palette="Accent") +
      scale_y_continuous(labels = comma) +
      labs(
        x = "Year",
        y = "Total Number of Displaced Individuals",
        title = paste("Internally Displaced People Displaced Individuals in", nation, "\nfrom 2008-2021"))

    return(line_displaced)}

