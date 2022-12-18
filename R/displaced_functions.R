globalVariables(c("displaced_count", "year", "country"))

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
#' displaced_histogram()
#' displaced_histogram("Dominican Republic")
#' @import ggplot2
#' @import tidyr
displaced_histogram <-

  function(nation = "United States") {

  histo_data <-
    displaced_by_disaster %>%
    filter(country == nation) %>%
    select(country, displaced_count)

  displaced_histogram <-
    ggplot(histo_data, aes(x = displaced_count)) +
    geom_histogram(fill="#69b3a2", color="#e9ecef", alpha=0.9, bins=20) +
    labs(
      x = "Internally Displaced People",
      y = "count",
      title = paste("Distribution of Displaced Individuals in", nation, "from 2008-2021"))

  return(displaced_histogram)}

#' Line graph comparing the amount of displaced individuals over 13 years for two regions (a country and North America, or two countries)
#'
#' This function ... specific country (default: USA)
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
displaced_linegraph <-

  function(nation = "United States") {

    trends_data <-
      displaced_by_disaster %>%
      filter(country == nation) %>%
      select(country, year, displaced_count)

    displaced_linegraph <-
      ggplot(trends_data, aes(x = year, y = displaced_count)) +
      geom_line(fill="#800000") +
      labs(
        x = "Year",
        y = "Amount of Displaced Individuals",
        title = paste("Internally Displaced People Displaced Individuals in", nation, "from 2008-2021"))

    return(displaced_linegraph)}
