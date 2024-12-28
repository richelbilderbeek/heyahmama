#' Get a K3 songs' lyrics
#' @param song_title title of a K3 song.
#'   Capitalization of this value is ignored.
#' @return a text. Will \link{stop} if the song
#'   cannot be found
#' @examples
#' get_song_lyrics("Heyah Mama")
#' @author Richèl J.C. Bilderbeek
#' @export
get_song_lyrics <- function(song_title) {
  filename <- get_song_filename(song_title)
  path <- NA
  tryCatch({
    path <- get_heyahmama_path(filename)
  }, error = function(msg) {
    stop(
      "Cannot find the 'heyahmama' file for the song '",
      song_title, "', when looking for a file named '",
      filename, "'. ",
      msg$msg
    )
  }
  )
  readr::read_lines(path)
}
