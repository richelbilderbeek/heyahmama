#' Convert an integer to a a vector of booleans
#'
#' Convert an integer to a a vector of booleans
#' using a big-endian conversion, i.e.
#' the last bool encodes for a 1,
#' the one-but-last bool encodes for a 2,
#' etcetera.
#' @param i an integer
#' @return a vector of booleans
#' @examples
#' int_to_bools(0) # FALSE
#' int_to_bools(1) # TRUE
#' int_to_bools(2) # c(TRUE, FALSE)
#' int_to_bools(3) # c(TRUE, TRUE)
#' int_to_bools(4) # c(TRUE, FALSE, FALSE)
#' @author Richèl J.C. Bilderbeek
#' @export
int_to_bools <- function(i) {
  testthat::expect_gte(i, 0)
  if (i == 0) return(FALSE)
  n_bits <- floor(log2(i)) + 1
  rev_bits <- rep(NA, n_bits)
  for (j in seq(1, n_bits)) {
    rev_bits[j] <- i %% 2 == 1
    i <- bitwShiftR(i, 1)
  }
  rev(rev_bits)
}
