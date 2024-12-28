#' Get a K3 songs' filename
#' @param song_title title of a K3 song.
#'   Capitalization of this value is ignored.
#' @return a filename
#' @examples
#' get_song_filename("Heyah Mama")
#' @author Richèl J.C. Bilderbeek
#' @export
get_song_filename <- function(song_title) {
  song_name_1 <- snakecase::to_snake_case(song_title)
  # 'K3' is now 'k_3', let's keep it 'K3'
  song_name_2 <- stringr::str_replace(
    string = song_name_1,
    pattern = "k_3",
    replacement = "k3"
  )
  # '10.000' is now '10_000', let's keep it '10000'
  song_name_3 <- stringr::str_replace(
    string = song_name_2,
    pattern = "_000",
    replacement = "000"
  )
  # 'é' is not supported well, use 'e' instead
  song_name_4 <- stringr::str_replace_all(
    string = song_name_3,
    pattern = "\u00E9",
    replacement = "e"
  )
  paste0(
    song_name_4,
    ".txt"
  )
}
