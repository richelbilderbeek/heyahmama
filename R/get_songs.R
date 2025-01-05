#' Get the K3 songs
#' @return a tibble with the K3 songs. Column names are:
#'
#' - `cd_title`: title of the CD
#' - `cd_number`: the CD number. For single-CD releases, this will be 1.
#' - `track_number`: track number on that CD, e.g.
#'   1 for the first track
#' - `song_title`: title of the song
#' - `duration`: duration of this recording of the song.
#'   For some songs, e.g. 'Heyah mama', recordings differ
#' @examples
#' get_songs()
#' @author Richèl J.C. Bilderbeek
#' @export
get_songs <- function() {
  readr::read_csv(get_heyahmama_path("songs.csv"), show_col_types = FALSE)
}
