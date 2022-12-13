
#' Predict Disability Adjusted Life Years and Total Greenhouse Gas emissions in million tonnes for a specific country in a future year
#'
#' @param pred_year Year for the predicted values
#' @param nation Name of country (default: United States)
#'
#' @return A printed message stating the predicted value for the year and nation specified
#' @export
#'
#' @examples
#' dalys_predict(2040)
#' dalys_predict(2030, "Mexico")

#' @import dplyr
dalys_predict <- function(pred_year, nation = "United States"){

  owid_data <- owid_ghg %>%
    filter(country == nation)

  air_pol_data <- air_data %>%
    filter(country == nation)

  all_data <- owid_data %>%
    full_join(air_pol_data, by = "year") %>%
    select(-country.y) %>%
    mutate(country = country.x) %>%
    select(-country.x) %>%
    select(year, country, everything())

  if(sum(is.na(all_data)) == nrow(all_data)) {
    stop(paste("Data missing for ", nation))
  }

  dalys_model_air <- lm(air_pollution ~ year, data = all_data)
  ghg_model <- lm(total_ghg ~ year, data = all_data)
  pop_model <- lm(population ~ year, data = all_data)



  pred_value_air <- round(predict(dalys_model_air, data.frame(year = pred_year), digits = 3))
  pred_value_ghg <- round(predict(ghg_model, data.frame(year = pred_year)), digits = 3)
  pred_value_pop <- round(predict(pop_model, data.frame(year = pred_year)), digits = 3)

  dalys_per_person <- round(pred_value_air/pred_value_pop, digits = 6)

  warning(paste("This prediction is based off of a generalized linear regression model, even if the data might not follow a linear pattern over the years. This is for estimation purposes only."))

  paste0("The Total DALYs predicted for ", nation, " for the year ", pred_year, " is ",
         pred_value_air, " total years. Each person will suffer from an average loss in about ",
         dalys_per_person, " years due to health issues that arose from air pollution. The Total Predicted GHG is ", pred_value_ghg, " million tonnes.")

}




