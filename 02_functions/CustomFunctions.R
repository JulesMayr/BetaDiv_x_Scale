################################################################################
############################### Custom Functions ###############################
################################################################################

# 1. remove outliers based on the 99.7th percentile ----------------------------

# Remove outliers from a dataframe based on upper quantile thresholds
#
# This function removes rows from the dataframe where any of the variables
# exceed the specified quantile cutoff (default is the 99.7th percentile). 
# All quantiles are calculated before filtering, and filtering is applied jointly 
# — a row is retained only if it falls below the cutoff for *all* variables.
#
#' @param data A dataframe containing the variables to filter.
#' @param vars A character vector of column names to evaluate for outliers.
#' @param quantile_cutoff A numeric value between 0 and 1 specifying the upper quantile threshold.
#                        Default is 0.997 (i.e., top 0.3% treated as outliers).
#
#' @return A filtered dataframe with outliers removed.
#
# The function:
remove_outliers <- function(data, vars, quantile_cutoff = 0.997) {
  
  # Compute the quantile cutoff for each variable
  cutoffs <- sapply(vars, function(var) quantile(data[[var]], quantile_cutoff, na.rm = TRUE))
  
  # Build a logical condition that checks if each row is below all corresponding cutoffs
  condition <- Reduce(`&`, lapply(seq_along(vars), function(i) data[[vars[i]]] <= cutoffs[i]))
  
  # Return the filtered dataframe
  return(data[condition, ])
}

# 2. normalize a vector between 0 (inclusive) and 1 (exclusive) ----------------

# This function applies min-max normalization to a specified column,
# rescaling the values between 0 (inclusive) and 1 (exclusive). 
# The result is stored in a new column in the dataframe.
#
#' @param data A dataframe containing the column to normalize.
#' @param var A character string specifying the column name to normalize.
#' @param epsilon A small positive value to keep the maximum normalized value below 1 (default is 0.0001).
#' @param new_var_name Optional. Name of the new column for the normalized values.
#                     Defaults to var + "_normalized" if not provided.
#
#' @return The dataframe with the normalized column added.
#
# The function:
normalize_min_max <- function(data, var, epsilon = 0.0001, new_var_name = NULL) {
  
  # Calculate the minimum and maximum of the specified variable
  min_val <- min(data[[var]], na.rm = TRUE)
  max_val <- max(data[[var]], na.rm = TRUE)
  
  # Use the provided new column name or create one based on the original variable name
  if (is.null(new_var_name)) {
    new_var_name <- paste0(var, "_normalized")
  }
  
  # Apply min-max normalization to include 0 while excluding 1 (using epsilon)
  data[[new_var_name]] <- (data[[var]] - min_val) / (max_val - min_val) * (1 - epsilon)
  
  return(data)
}














