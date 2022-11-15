#' CO2 and Greenhouse Gas Emissions in North America (1940-2020)
#'
#' A subset of CO2 and Greenhouse Gas (GHG) Emissions data filtered by countries in North America. The original data was acquired, aggregated and maintained by Hannah Ritchie, Max Roser, Edouard Mathieu, Bobbie Macdonald and Pablo Rosado at [Our World in Data](https://github.com/owid/co2-data).
#'
#' @format ## `owid_ghg`
#' A data frame with 1,827 rows and 7 columns:
#' \describe{
#'   \item{year}{Years of observation since World War 2, from 1940-2020}
#'   \item{country}{Lists the 23 countries in North America plus North America (totaling everything)}
#'   \item{population}{Population of each country or region}
#'   \item{gdp}{Gross domestic product (GDP) represents value added by a country's production of goods and services: measured accounting for inflation and price differences between countries; multiplied GDP per capita with population }
#'   \item{total_ghg}{Total greenhouse gas emissions, measured in million tonnes of carbon dioxide-equivalents (CO2 metric comparing the emissions from various greenhouse gases on the basis of their global-warming potential.}
#'   \item{coal_co2}{?Annual emissions of carbon dioxide (CO2) from coal, measured in million tonnes}
#'   \item{methane}{Total methane emissions, measured in million tonnes of carbon dioxide-equivalents.}
#'   ...
#' }
#' @source <https://github.com/owid/co2-data>
"owid_ghg"

