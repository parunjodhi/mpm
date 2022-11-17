test_that("owid_ghg row count", {
  expect_equal(nrow(owid_ghg), 1827)
})

test_that("owid_ghg column count", {
  expect_equal(ncol(owid_ghg), 7)
})

test_that("variable search", {
  expect_equal(names(owid_ghg), c("year", "country", "population", "gdp", "total_ghg", "coal_co2", "methane"))
})
