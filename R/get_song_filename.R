#' Get a K3 songs' filename
#' @param song_title title of a K3 song.
#'   Capitalization of this value is ignored.
#' @return a filename
#' @examples
#' get_song_filename("Heyah Mama")
#' @author Richèl J.C. Bilderbeek
#' @export
get_song_filename <- function(song_title) {
  paste0(
    stringr::str_replace_all(
      stringr::str_to_lower(song_title),
      pattern = " ",
      replacement = "_"
    ),
    ".txt"
  )
}
