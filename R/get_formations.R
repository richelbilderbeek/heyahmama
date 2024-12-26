#' Get the K3 formations
#' @return a tibble with the K3 formations. Column names are:
#'
#' - `formation`: the formation number, where 1 is the first formation
#' - `member_1`: the first member of that formation
#' - `member_2`: the second member of that formation
#' - `member_3`: the third member of that formation
#'
#' The member names are sorted alphabetically
#' @examples
#' get_formations()
#' @author Richèl J.C. Bilderbeek
#' @export
get_formations <- function() {
  readr::read_csv(get_heyahmama_path("formations.csv"), show_col_types = FALSE)
}
