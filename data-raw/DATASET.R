## code to prepare `OWID-CO2-DATA` dataset goes here

library(tidyverse)
owid_ghg <- read_csv("data-raw/owid-co2-data.csv")

owid_ghg <- owid_ghg %>%
  select (year, country, population, gdp, total_ghg, coal_co2, methane) %>%
  filter(country == "United States" | country == "Mexico" | country == "Canada" |
           country == "Bermuda" | country == "Guatemala" | country == "Cuba" | country == "Haiti" |
           country == "Dominican Republic" | country == "Honduras" | country == "Nicaragua" |
           country == "El Salvador" | country =="Costa Rica" | country == "Panama" | country == "Jamaica" |
           country == "Trinidad and Tobago" | country == "Belize" | country == "Bahamas" |
           country == "Barbados" | country == "Saint Lucia" | country == "Grenada" |
           country == "Saint Vincent and the Grenadines" |
           country == "Antigua and Barbuda" | country == "Dominica" | country == "Saint Kitts and Nevis" |
           country == "North America") %>%
  filter(!(year <= "1939"))

usethis::use_data(owid_ghg, overwrite = TRUE)

# Importing 'regional_grouping'
library(dplyr)
regional_grouping <- read_csv("data-raw/Metadata_Country_API_VC.IDP.NWDS_.csv")

regional_grouping <- regional_grouping %>%
  select(TableName, Region, IncomeGroup) %>%
  rename(Country = TableName, Income_Group = IncomeGroup) %>%
  filter(Country == "United States" | Country == "Mexico" | Country == "Canada" |
           Country == "Bermuda" | Country == "Guatemala" | Country == "Cuba" | Country == "Haiti" |
           Country == "Dominican Republic" | Country == "Honduras" | Country == "Nicaragua" |
           Country == "El Salvador" | Country =="Costa Rica" | Country == "Panama" | Country == "Jamaica" |
           Country == "Trinidad and Tobago" | Country == "Belize" | Country == "Bahamas" |
           Country == "Barbados" | Country == "St. Lucia" | Country == "Grenada" |
           Country == "St. Vincent and the Grenadines" |
           Country == "Antigua and Barbuda" | Country == "Dominica" | Country == "St. Kitts and Nevis" |
           Country == "North America")


