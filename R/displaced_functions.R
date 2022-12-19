globalVariables(c("displaced_count", "year", "country"))

#' Distribution of the Internally Displaced Individuals (2008-2021)
#'
#' This function visualizes the distribution of people internally displaced by natural disasters (inflicted by climate change) in a specific country (default: USA)
#'
#' @param nation Name of country (default: United States)
#'
#' @return A histogram demonstrating the amount of internally displaced people based on the country selected from 2008 to 2021
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
      x = "Total Number of Displaced Individuals",
      y = "Count",
      title = paste("Distribution of Displaced Individuals in", nation, "\nfrom 2008-2021"))

  warning(paste("Some countries have very limited or missing data for the amount of
      internally displaced individuals so please view the country's dataframe and their
      displacement count before using the displaced_histogram function for best usage."))

  return(histo_displaced)}

#' Internally Displaced Individuals Line Graph (2008-2021)
#'
#' This function produces a line graph depicting the total amount of individuals internally displaced by events (some inflicted by climate change) in a given country (default: USA)
#'
#' @param nation Name of country (default: United States)
#'
#' @return A line graph demonstrating the amount of internally displaced people based on the country selected from 2008 to 2021
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
        title = paste("Line Graph of Displaced Individuals in", nation, "\nfrom 2008-2021"))

    warning(paste("Some countries have very limited or missing data for the amount of
      internally displaced individuals so please view the country's dataframe and their
      displacement count before using the displaced_linegraph function for best usage."))

    return(line_displaced)}

#' Internally Displaced Individuals Area Chart (2008-2021)
#'
#' This function produces an area chart visualizing the amount of displaced individuals of a given country compared to the U.S (default: Costa Rica)
#'
#' @param nation Name of country (default: Costa Rica)
#'
#' @return An area chart demonstrating displaced individuals from 2008 to 2021 for a given country compared to the U.S
#' @export
#'
#' @examples
#' displaced_areachart ()
#' displaced_areachart("Mexico")
#' @import ggplot2
#' @import tidyr
#' @import scales
displaced_areachart <-

  function(nation = "Costa Rica") {

    area_data <-
      displaced_by_disaster %>%
      filter(as.factor(country) %in% c("United States", nation)) %>%
      select(country, year, displaced_count)

    area_data$country <- factor(area_data$country, levels=c("United States", nation) )

    area_displaced <-
      ggplot(area_data, aes(x = year, y = displaced_count)) +
      geom_area(aes(fill=country)) +
      scale_fill_manual(values=c("#82E0AA", "#097969"))+
      scale_y_continuous(labels = comma) +
      theme(axis.text.x = element_text(angle=60)) +
      labs(
        x = "Year",
        y = "Total Number of Displaced Individuals",
        title = paste("Area Chart of Displaced Individuals from 2008-2021"),
        subtitle = paste("Comparing", nation ,"and the United States"))

    warning(paste("Some countries have very limited or missing data so please view the
      country's displacement count in the dataframe before using the displaced_areachart function.
      Example: if you choose Bermuda which has a lot of NAs and very limited displacement
      counts than the function will only visualize the count for the United States."))

    return(area_displaced)}
