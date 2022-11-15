## code to prepare `DATASET` dataset goes here

library(tidyverse)
library(dplyr)
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
