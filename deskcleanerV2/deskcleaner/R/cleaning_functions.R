#' Remove Empty Rows or Columns from a Data Frame
#'
#' This function inspects a data frame and removes all rows or all columns
#' that are composed entirely of `NA` values.
#'
#' @param .data A data frame.
#' @param which A character string, either "rows" (the default) or "cols",
#'   specifying whether to remove empty rows or empty columns.
#'
#' @return A data frame with the empty rows or columns removed.
#' @export
#'
#' @examples
#' # Create a sample data frame for the example
#' messy_df <- data.frame(
#'   x = c(1, NA, 3),
#'   y = c("a", NA, "c"),
#'   z = c(NA, NA, NA)
#' )
#' messy_df[2, ] <- NA # Create a fully empty row
#'
#' # Remove empty rows (the default)
#' remove_empty(messy_df)
#'
#' # Remove empty columns
#' remove_empty(messy_df, which = "cols")
remove_empty <- function(.data, which = "rows") {
  # Defensive programming: ensure input is a data frame
  stopifnot(is.data.frame(.data))

  if (which == "rows") {
    # Keep rows where NOT ALL values are NA
    return(.data[rowSums(is.na(.data)) != ncol(.data), ])
  } else if (which == "cols") {
    # Keep columns where NOT ALL values are NA
    return(.data[, colSums(is.na(.data)) != nrow(.data)])
  } else {
    # Error for invalid 'which' argument
    stop("`which` must be either 'rows' or 'cols'.")
  }
}


#' Summarize Missing Values in a Data Frame
#'
#' This function scans each column of a data frame and returns a summary
#' data frame with the count and percentage of missing (`NA`) values for each one.
#'
#' @param .data A data frame.
#'
#' @return A data frame summarizing the missing values in each column.
#'   The data frame has three columns: `column` (the name of the column),
#'   `n_missing` (the number of NAs), and `pct_missing` (the percentage of NAs).
#' @export
#'
#' @examples
#' # To use the example, you must first load the data from the package
#' # utils::data("messy_data", package = "deskcleanerV2")
#'
#' summarize_missing(messy_data)
summarize_missing <- function(.data) {
  # Defensive programming: ensure input is a data frame
  stopifnot(is.data.frame(.data))

  n_cols <- ncol(.data)
  col_names <- names(.data)
  n_missing <- integer(n_cols) # Pre-allocate a vector of the correct size

  for (i in seq_len(n_cols)) {
    n_missing[i] <- sum(is.na(.data[[i]]))
  }

  # THIS IS THE CORRECTED PART: Using base R data.frame()
  summary_df <- data.frame(
    column = col_names,
    n_missing = n_missing,
    pct_missing = round((n_missing / nrow(.data)) * 100, 2)
  )

  return(summary_df)
}
