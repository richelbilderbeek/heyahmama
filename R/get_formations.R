#' Get the K3 formations
#' @return a tibble with the K3 formations
get_formations <- function() {
  full <- system.file("extdata", filename, package = "heyahmama")
  if (!file.exists(full)) {
      stop("'filename' must be the name of a file in 'inst/extdata'")
  }
  full
}
