#' Get the K3 songs' composers
#' @return a tibble with the K3 songs' composers. Column names are:
#'
#' - `song_title`: title of the song
#' - `composer`: name of a composer
#'
#' For songs with multiple composers, multiple rows are used.
#' @examples
#' get_composers()
#' @author Richèl J.C. Bilderbeek
#' @export
get_composers <- function() {
  readr::read_csv(
    heyahmama::get_heyahmama_path("composers.csv"),
    show_col_types = FALSE
  )
}
