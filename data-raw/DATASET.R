## code to prepare `DATASET` dataset goes here

library(tidyverse)
owid_ghg <- read_csv("data-raw/owid-co2-data.csv")

# Y (the GHG) total_ghg / coal_co2 / methane / population / gdp
# X (years) 1940 - 2020
# Key (country) country / U.S is the default

owid_ghg <- owid_ghg %>%
  select (year, country, population, gdp, total_ghg, coal_co2, methane) %>%
  filter(country == "North America" | country == "Canada" | country == "Mexico" | country == "Bermuda")

view(owid_ghg)

# TO DO LIST:
# filtering for north american countries
# filtering by years
# completing the description
# create a push of all edits for Mack and Parunjodhi to view

# RESOURCES:
# 2022-11-08 creating a data set
# 2022-09-22 inside collaborator questions

usethis::use_data(owid_ghg, overwrite = TRUE)
