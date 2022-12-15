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
#'
#'
#'
#'
#' Air Pollution Data Measured in Disability-Adjusted Life Years (DALYs) (1990-2019)
#'
#' A subset of Air Pollution data filtered by countries in North America. DALYs is a metric used to assess disease burden. Data originally aggregated and maintained by Hannah Ritchie and Max Roser at [Our World in Data](https://ourworldindata.org/air-pollution).
#'
#' @format ## `air_data`
#' A data frame with 720 rows and 5 columns:
#' \describe{
#'   \item{country}{Lists the 23 countries in North America plus North America (totaling everything)}
#'   \item{year}{Years of observation from 1990-2019}
#'   \item{air_pollution}{total DALYs resulted from total air pollution: indoor and outdoor}
#'   \item{household_pollution}{total DALYs resulted from indoor air pollution}
#'   \item{outdoor_pollution}{total DALYs resulted from outdoor air pollution}
#'   ...
#' }
#' @source <https://ourworldindata.org/air-pollution>
"air_data"
#'
#'
#'
#'
#' Internally Displaced People Count based on events caused by Climate Change (2008-2021)
#'
#' A subset of data on internal displacement associated with slow-onset environmental change and natural disasters filtered by countries in North America. This data comes from [Internal Displacement Monitoring Centre (IDMC)](https://www.internal-displacement.org/research-areas/Displacement-disasters-and-climate-change) and organized by [The World Bank](https://data.worldbank.org/indicator/VC.IDP.NWDS).
#'
#' @format ## `displaced_by_disaster`
#' A data frame with 294 rows and 3 columns:
#'
#' \describe{
#'   \item{year}{Years of observation, from 2008-2021}
#'   \item{country}{Lists the 23 countries in North America plus North America (totaling everything)}
#'   \item{displaced_count}{Count for internally displaced people based on weather-related disasters such as floods or storms}
#'   ...
#' }
#' @source <https://data.worldbank.org/indicator/VC.IDP.NWDS>
"displaced_by_disaster"
