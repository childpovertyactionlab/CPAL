#### Function to pull multiple years of census data from a geography with TidyCensus #####

#' Pull ACS Census data for multiple years across the same geographies and combine into a single dataframe.
#'
#' @param variables Character string or vector of character strings of variable IDs. tidycensus automatically returns the estimate and the margin of error associated with the variable.
#' @param years a dataframe containing a list of the years to include data from.
#' @param geography The geography of your data.
#' @param state An optional vector of states for which you are requesting data. State names, postal codes, and FIPS codes are accepted. Defaults to NULL.
#' @param survey The ACS contains one-year, three-year, and five-year surveys expressed as "acs1", "acs3", and "acs5". The default selection is "acs5."
#'
#' @return A dataframe containing all identified census variables for the specified years.
#' @export
#'
#' @examples
#' test <- "test"
#' @import tidycensus
get_acs_years <- function(variables, years, geography, state, survey) {
  acs_df <- list()

  for(i in 1:nrow(years)) {
    year_pull <- years$value[i]

    acs_pull <- get_acs(geography = geography,
                          state = state,
                          variables = variables,
                          year = years,
                          survey = survey,
                          output = "wide",
                          geometry = FALSE) %>%
      mutate(Year = year_pull)

    acs_df[[i+1]] <- acs_pull
  }

  acs_combine <- data.table::rbindlist(acs_df, fill = TRUE)

}
