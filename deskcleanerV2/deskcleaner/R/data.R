#' A deliberately messy dataset for demonstration
#'
#' A small tibble containing common data quality issues, such as missing values,
#' an entirely empty row, and an entirely empty column. This dataset is used
#' in examples and vignettes to demonstrate the cleaning functions of the
#' deskcleaner package.
#'
#' @format ## `messy_data`
#' A data frame with 5 rows and 5 columns:
#' \describe{
#'   \item{id}{An identifier, character type}
#'   \item{name}{A name, character type, contains one NA}
#'   \item{score}{A numeric score, contains one NA}
#'   \item{status}{A status, character type}
#'   \item{empty_col}{An all-NA column, logical type}
#' }
#' @source Created for the deskcleaner package to demonstrate functionality.
"messy_data"
