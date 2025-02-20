#' Function to pull data using SQL from CKAN
#'
#' \code{ckan_query} allows users to pull data using a custom SQL query, with the option of adding geometry if present in the dataset. This function returns either a dataframe or a list including metadata and records.
#'
#' @param sql_query A string SQL query
#' @param geometry Boolean indicating if dataframe contains geometry or not. If TRUE, function returns a geometry object ready for mapping
#' @param nested Boolean indicating if function will return list including metadata and records. If FALSE, only records are returned
#'
#' @import tidyverse
#' @import httr
#' @import jsonlite
#' @md
#' @export


ckan_query <- function(sql_query, geometry = FALSE, nested = FALSE) {
  # Base CKAN SQL query endpoint
  ckan_sql_url <- "https://devckan.data-cave.org/api/action/datastore_search_sql"

  # URL encode the SQL query
  encoded_query <- URLencode(sql_query)

  # Fetch the primary dataset
  response <- GET(paste0(ckan_sql_url, "?sql=", encoded_query))

  # Check response status
  if (status_code(response) != 200) {
    stop(paste("Error:", status_code(response), content(response, "text", encoding = "UTF-8")))
  }

  # Parse the response
  data <- fromJSON(content(response, "text", encoding = "UTF-8"))

  # Handle nested or unnested results
  df <- if (nested) {
    data$result
  } else {
    as.data.frame(data$result$records)
  }

  # If geometry is enabled, check for 'geometry_wkt' column
  if (geometry) {
    if ("geometry_wkt" %in% colnames(df)) {
      # Convert to spatial object using sf
      df <- df %>% st_as_sf(wkt = "geometry_wkt")
    } else {
      warning("No geometry features in this dataset")
    }
  }

  return(df)
}


# unique_neighs <- ckan_query(
#   paste0("SELECT DISTINCT neigh_id FROM \"4c61d0e6-f369-4bcb-bf83-03e36c314869\""),
#   geometry = FALSE, nested = FALSE) %>%
#   filter(!is.na(neigh_id))
