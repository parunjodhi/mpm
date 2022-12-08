globalVariables(c("country", "year", "gdp", "total_ghg", "population", "lm", "predict", "owid_data", "air_pol_data", "all_data", "air_data", "year.y", "year.x", "ghg", "air_pollution", "household_pollution", "outdoor pollution"))


#' Predict DALYs for a certain year for a certain country based on Total Greenhouse Gas Emissions
#'
#' @param pred_year
#' @param nation
#'
#' @return
#' @export
#'
#' @examples
#' @import dplyr
#' @import
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
    stop(paste("No emissions avaliable for ", nation))
  }

  dalys_model <- lm(total_ghg~air_pollution, data = all_data)
  summary(dalys_model)

  pred_value <- predict(dalys_model, data.frame(year = pred_year), type="response")
  return(pred_value)

  paste0("The Total DALYs predicted for ", nation, " for the year ", pred_yr, " is ", pred_value, " .")

}
