#' Get the K3 songs' writers
#' @return a tibble with the K3 songs' writers. Column names are:
#'
#' - `song_title`: title of the song
#' - `writer`: name of a writer
#'
#' For songs with multiple writers, multiple rows are used.
#' @examples
#' get_writers()
#' @author Richèl J.C. Bilderbeek
#' @export
get_writers <- function() {
  readr::read_csv(
    heyahmama::get_heyahmama_path("writers.csv"),
    show_col_types = FALSE
  )
}
