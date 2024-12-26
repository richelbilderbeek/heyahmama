#' Get the K3 CDs
#' @return a tibble with the K3 CDs
get_cds <- function() {
  readr::read_csv(get_heyahmama_path("cds.csv"))
}
