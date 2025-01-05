#' Get the titles of all K3 songs, sorted alphabetically
#' @return a vector with titles of all K3 songs
#' @examples
#' get_song_titles()
#' @author Richèl J.C. Bilderbeek
#' @export
get_song_titles <- function() {
  sort(unique(get_released_songs()$song_title))
}
