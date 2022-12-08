
#' Predict Disability Adjusted Life Years and Total Greenhouse Gas emissions in million tonnes for a specific country in a future year
#'
#' @param pred_year
#' @param nation
#'
#' @return
#' @export
#'
#' @examples
#' @import dplyr
dalys_predict <- function(pred_year, nation = "United States"){

  owid_data <- owid_ghg %>%
    filter(country == nation)

  air_pol_data <- air_data %>%
    filter(country == nation)

  all_data <- owid_data %>%
    full_join(air_pol_data, by = "country") %>%
    select(-year.y) %>%
    mutate(year = year.x) %>%
    select(-year.x)

  if(sum(is.na(all_data)) == nrow(all_data)) {
    stop(paste("No GDP data avaliable for ", nation))
  }

  dalys_model_air <- lm(air_pollution ~ year, data = all_data)
  ghg_model <- lm(total_ghg ~ year, data = all_data)
  pop_model <- lm(population ~ year, data = all_data)



  pred_value_air <- round(predict(dalys_model_air, data.frame(year = pred_year), digits = 3))
  pred_value_ghg <- round(predict(ghg_model, data.frame(year = pred_year)), digits = 3)
  pred_value_pop <- round(predict(pop_model, data.frame(year = pred_year)), digits = 3)

  dalys_per_person <- pred_value_air/pred_value_pop

  warning(paste("This prediction is based off of a linear regression model, even if the data might not follow a linear pattern over the years. This is for estimation purposes only."))

  paste0("The Total DALYs predicted for ", nation, " for the year ", pred_year, " is ",
         pred_value_air, " total years. Each person will suffer from a loss in ",
         dalys_per_person, " years. The total predicted ghg is ", pred_value_ghg, " million tonnes.")

}




