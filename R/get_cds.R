#' Get the K3 CDs
#' @return a tibble with the K3 CDs:
#'
#' - `cd_title`: title of the CD
#' - `formation`: the formation number,
#'   where '1' denotes the first formation
#'   (see \link{get_formations} to get information on the formations)
#' - `year`: the release year of the CD
#' @examples
#' get_cds()
#' @author Richèl J.C. Bilderbeek
#' @export
get_cds <- function() {
  readr::read_csv(get_heyahmama_path("cds.csv"), show_col_types = FALSE)
}
