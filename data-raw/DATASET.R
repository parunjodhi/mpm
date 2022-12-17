## code for `OWID-CO2-DATA` data set

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

## code for `AIR_DATA` data set

library(janitor)
air_data <- read_csv("data-raw/disease-burden-by-risk-factor.csv")
air_data <- clean_names(air_data)
air_data$entity[air_data$entity=="North America (WB)"]<-"North America"

air_data <- air_data %>%
  rename(air_pollution = dal_ys_disability_adjusted_life_years_cause_all_causes_risk_air_pollution_sex_both_age_all_ages_number,
         household_pollution = dal_ys_disability_adjusted_life_years_cause_all_causes_risk_household_air_pollution_from_solid_fuels_sex_both_age_all_ages_number,
         outdoor_pollution = dal_ys_disability_adjusted_life_years_cause_all_causes_risk_ambient_particulate_matter_pollution_sex_both_age_all_ages_number,
         country = entity) %>%
  select(country, year, air_pollution, household_pollution, outdoor_pollution)%>%
  filter(country == "United States" | country == "Mexico" | country == "Canada" |
           country == "Bermuda" | country == "Guatemala" | country == "Cuba" | country == "Haiti" |
           country == "Dominican Republic" | country == "Honduras" | country == "Nicaragua" |
           country == "El Salvador" | country =="Costa Rica" | country == "Panama" | country == "Jamaica" |
           country == "Trinidad and Tobago" | country == "Belize" | country == "Bahamas" |
           country == "Barbados" | country == "Saint Lucia" | country == "Grenada" |
           country == "Saint Vincent and the Grenadines" |
           country == "Antigua and Barbuda" | country == "Dominica" | country == "Saint Kitts and Nevis" |
           country == "North America")

usethis::use_data(air_data, overwrite = TRUE)

## code for `REGIONAL_GROUPING` data set

library(dplyr)
regional_grouping <- read_csv("data-raw/WB_Metadata_Country_API_regions.csv")
regional_grouping$TableName[regional_grouping$TableName=="St. Lucia"]<-"Saint Lucia"
regional_grouping$TableName[regional_grouping$TableName=="St. Vincent and the Grenadines"]<-"Saint Vincent and the Grenadines"
regional_grouping$TableName[regional_grouping$TableName=="St. Kitts and Nevis"]<-"Saint Kitts and Nevis"

regional_grouping <- regional_grouping %>%
  select(TableName, Region, IncomeGroup) %>%
  rename(country = TableName, region = Region, income_group = IncomeGroup) %>%
  filter(country == "United States" | country == "Mexico" | country == "Canada" |
           country == "Bermuda" | country == "Guatemala" | country == "Cuba" | country == "Haiti" |
           country == "Dominican Republic" | country == "Honduras" | country == "Nicaragua" |
           country == "El Salvador" | country =="Costa Rica" | country == "Panama" | country == "Jamaica" |
           country == "Trinidad and Tobago" | country == "Belize" | country == "Bahamas" |
           country == "Barbados" | country == "Saint Lucia" | country == "Grenada" |
           country == "Saint Vincent and the Grenadines" |
           country == "Antigua and Barbuda" | country == "Dominica" | country == "Saint Kitts and Nevis" |
           country == "North America")

usethis::use_data(regional_grouping, overwrite = TRUE)

## code for `DISPLACED_BY_DISASTER` data set

library(readxl)
library(tidyr)
library(dplyr)
displaced_by_disaster <- read_xls("data-raw/WB_Country_API_displacement.xls")
displaced_by_disaster$TableName[displaced_by_disaster$TableName=="Bahamas, The"]<-"Bahamas"
displaced_by_disaster$TableName[displaced_by_disaster$TableName=="St. Lucia"]<-"Saint Lucia"
displaced_by_disaster$TableName[displaced_by_disaster$TableName=="St. Vincent and the Grenadines"]<-"Saint Vincent and the Grenadines"
displaced_by_disaster$TableName[displaced_by_disaster$TableName=="St. Kitts and Nevis"]<-"Saint Kitts and Nevis"

displaced_by_disaster <- displaced_by_disaster %>%
  rename(country = CountryName, country_code = CountryCode, indicator_name =
        IndicatorName, indicator_code = IndicatorCode) %>%
  select(country, "2008", "2009","2010", "2011", "2012", "2013", "2014",
         "2015", "2016","2017", "2018", "2019", "2020", "2021") %>%
  pivot_longer(cols = !country, names_to = "year", names_transform = list(year = as.integer),
          values_to = "displaced_count", values_transform = list(displaced_count = as.integer)) %>%
  filter(country == "United States" | country == "Mexico" | country == "Canada" |
           country == "Bermuda" | country == "Guatemala" | country == "Cuba" | country == "Haiti" |
           country == "Dominican Republic" | country == "Honduras" | country == "Nicaragua" |
           country == "El Salvador" | country =="Costa Rica" | country == "Panama" | country == "Jamaica" |
           country == "Trinidad and Tobago" | country == "Belize" | country == "Bahamas" |
           country == "Barbados" | country == "Saint Lucia" | country == "Grenada" |
           country == "Saint Vincent and the Grenadines" |
           country == "Antigua and Barbuda" | country == "Dominica" | country == "Saint Kitts and Nevis" |
           country == "North America") %>%
  inner_join(regional_grouping, by="country") %>%
  select(country, year, displaced_count, income_group)

usethis::use_data(displaced_by_disaster, overwrite = TRUE)
