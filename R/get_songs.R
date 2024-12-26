#' Get the K3 songs
#' @return a tibble with the K3 songs
get_songs <- function() {
  readr::read_csv(get_heyahmama_path("songs.csv"), show_col_types = FALSE)
}
