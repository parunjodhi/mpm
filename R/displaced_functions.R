globalVariables(c("displaced_count", "year", "country"))

#' Distribution of the Internally Displaced Individuals Over Thirteen Years (2008-2021)
#'
#' This function visualizes the distribution of people internally displaced by natural disasters and climate change in a specific country (default: USA)
#'
#' @param nation Name of country (default: United States)
#'
#' @return A histogram demonstrating the amount of people displaced based on the country selected from 2008 to 2021
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
    geom_histogram(fill="#7D3C98", color="#CE93D8", alpha=0.9, size=1, bins=20) +
    scale_x_continuous(labels = comma) +
    theme(axis.text.x = element_text(angle=60)) +
    labs(
      x = "Internally Displaced People",
      y = "count",
      title = paste("Distribution of Displaced Individuals in", nation, "\nfrom 2008-2021"))

  return(histo_displaced)}

#' Internally Displaced Individuals Line Graph (2008-2021)
#'
#' This function produces a line graph depicting the toal amount of displaced individuals in a given country (default: USA)
#'
#' @param nation Name of country (default: United States)
#'
#' @return A line graph and area chart demonstrating the amount of people displaced from 2008 to 2021
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
      ggplot(trends_data, aes(x = year, y = displaced_count, fill=country)) +
      geom_line(colour = "#E3963E", size=2) +
      scale_y_continuous(labels = comma) +
      theme(axis.text.x = element_text(angle=60)) +
      labs(
        x = "Year",
        y = "Total Number of Displaced Individuals",
        title = paste("Line Graph of Displaced Individuals inn", nation, "\nfrom 2008-2021"))

    return(line_displaced)}

#' Internally Displaced Individuals Area Chart (2008-2021)
#'
#' This function produces an area chart visualizing how the amount of displaced individuals over 13 years for a given country (default: USA)
#'
#' @param nation Name of country (default: United States)
#'
#' @return An area graph and area chart demonstrating the amount of people displaced from 2008 to 2021
#' @export
#'
#' @examples
#' displaced_areachart ()
#' displaced_areachart("Nicaragua")
#' @import ggplot2
#' @import tidyr
#' @import scales
displaced_areachart <-

  function(nation = "United States") {

    area_data <-
      displaced_by_disaster %>%
      filter(country == nation) %>%
      select(country, year, displaced_count)

    area_displaced <-
      ggplot(area_data, aes(x = year, y = displaced_count, fill=country)) +
      geom_area(fill = "#097969", color="#82E0AA", size=2) +
      scale_y_continuous(labels = comma) +
      theme(axis.text.x = element_text(angle=60)) +
      labs(
        x = "Year",
        y = "Total Number of Displaced Individuals",
        title = paste("Area Chart of Displaced Individuals in", nation, "\nfrom 2008-2021"))

    return(area_displaced)}
