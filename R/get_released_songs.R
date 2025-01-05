#' Get the K3 released songs
#' @return a tibble with released K3 songs. Column names are:
#'
#' - `cd_title`: title of the CD
#' - `cd_number`: the CD number. For single-CD releases, this will be 1.
#' - `track_number`: track number on that CD, e.g.
#'   1 for the first track
#' - `song_title`: title of the song
#' - `duration`: duration of this recording of the song,
#'   as indicated on the CD.
#'   Some songs, e.g. 'Heyah mama', have different durations for
#'   different recordings
#' @examples
#' get_released_songs()
#' @author Richèl J.C. Bilderbeek
#' @export
get_released_songs <- function() {
  readr::read_csv(
    get_heyahmama_path("released_songs.csv"),
    show_col_types = FALSE
  )
}
