
#' Title
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

  dalys_model <- lm(air_pollution ~ total_ghg, data = all_data)

  pred_value <- predict(dalys_model, data.frame(year = pred_year))
  return(pred_value)

  paste0("The Total DALYs predicted for ", nation, " for the year ", pred_yr, " is ", pred_value, " .")

}
