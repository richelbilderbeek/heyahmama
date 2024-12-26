#' Get the K3 songs
#' @return a tibble with the K3 songs. Column names are:
#'
#' - `cd_title`: title of the CD
#' - `track_number`: track number on that CD, e.g.
#'   1 for the first track
#' - `song_title`: title of the song
#' - `duration`: duration of the song
#' @examples
#' get_songs()
#' @author Richèl J.C. Bilderbeek
#' @export
get_songs <- function() {
  readr::read_csv(get_heyahmama_path("songs.csv"), show_col_types = FALSE)
}
