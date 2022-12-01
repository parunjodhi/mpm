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
air_data <- read_csv("data-raw/disease-burden-by-risk-factor.csv") %>%
  clean_names() %>%
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


