#' Convert a vector of booleans to an integer
#'
#' Convert a vector of booleans to an integer,
#' using a big-endian conversion, i.e.
#' the last bool encodes for a 1,
#' the one-but-last bool encodes for a 2,
#' etcetera.
#' @return a integer
#' @examples
#' bools_to_int(FALSE) # 0
#' bools_to_int(TRUE) # 1
#' bools_to_int(c(TRUE, FALSE)) # 2
#' bools_to_int(c(TRUE, TRUE)) # 3
#' bools_to_int(c(TRUE, FALSE, FALSE)) # 4
#' bools_to_int(c(TRUE, FALSE, TRUE)) # 5
#' bools_to_int(c(TRUE, TRUE, FALSE)) # 6
#' bools_to_int(c(TRUE, TRUE, TRUE)) # 7
#' @author Richèl J.C. Bilderbeek
#' @export
bools_to_int <- function(bools) {
  if (length(bools) == 0) {
    stop(
      "'bools' must have at least 1 element. ",
      "Current length is zero."
    )
  }
  if (!all(is.logical(bools))) {
    stop(
      "All elements of 'bools' must be either TRUE or FALSE. ",
      "Current content: ", bools
    )
  }
  if (any(is.na(bools))) {
    stop(
      "No element of 'bools' can be NA. ",
      "All elements of 'bools' must be either TRUE or FALSE. ",
      "Current content: ", bools
    )
  }

  exponent <- 0
  sum <- 0
  for (b in rev(bools)) {
    sum <- sum + (as.integer(b) * (2 ^ exponent))
    exponent <- exponent + 1
  }
  sum
}
