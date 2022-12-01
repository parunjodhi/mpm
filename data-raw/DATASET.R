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


library(janitor)
air_data <- read_csv("data-raw/disease-burden-by-risk-factor.csv")

air_data <- clean_names(air_data)
air_data$entity[air_data$entity=="North America (WB)"]<-"North America"

air_data <- air_data %>%
  rename(air_pollution = dal_ys_disability_adjusted_life_years_cause_all_causes_risk_air_pollution_sex_both_age_all_ages_number,
         household_pollution = dal_ys_disability_adjusted_life_years_cause_all_causes_risk_household_air_pollution_from_solid_fuels_sex_both_age_all_ages_number,
         outdoor_pollution = dal_ys_disability_adjusted_life_years_cause_all_causes_risk_ambient_particulate_matter_pollution_sex_both_age_all_ages_number,
         country_air = entity) %>%
  select(country_air, year, air_pollution, household_pollution, outdoor_pollution)%>%
  filter(country_air == "United States" | country_air == "Mexico" | country_air == "Canada" |
           country_air == "Bermuda" | country_air == "Guatemala" | country_air == "Cuba" | country_air == "Haiti" |
           country_air == "Dominican Republic" | country_air == "Honduras" | country_air == "Nicaragua" |
           country_air == "El Salvador" | country_air =="Costa Rica" | country_air == "Panama" | country_air == "Jamaica" |
           country_air == "Trinidad and Tobago" | country_air == "Belize" | country_air == "Bahamas" |
           country_air == "Barbados" | country_air == "Saint Lucia" | country_air == "Grenada" |
           country_air == "Saint Vincent and the Grenadines" |
           country_air == "Antigua and Barbuda" | country_air == "Dominica" | country_air == "Saint Kitts and Nevis" |
           country_air == "North America")

usethis::use_data(air_data, overwrite = TRUE)


