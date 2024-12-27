#' Get the K3 formations in widy format
#' @return a tibble with the K3 formations. Column names are:
#'
#' - `formation`: the formation number, where 1 is the first formation
#' - `member_1`: the first member of that formation
#' - `member_2`: the second member of that formation
#' - `member_3`: the third member of that formation
#'
#' The member names are sorted alphabetically
#' @examples
#' get_formations_wide()
#' @author Richèl J.C. Bilderbeek
#' @export
get_formations_wide <- function() {

  formation <- NULL; rm(formation) # nolint, fixes warning: no visible binding for global variable
  member <- NULL; rm(member) # nolint, fixes warning: no visible binding for global variable
  member_num <- NULL; rm(member_num) # nolint, fixes warning: no visible binding for global variable

  get_formations() |>
    dplyr::group_by(formation) |>
    dplyr::mutate(member_num = dplyr::row_number()) |>
    dplyr::ungroup() |>
    tidyr::pivot_wider(
      names_from = member_num,
      values_from = member,
      names_prefix = "member_"
    ) |>
    dplyr::select(formation, dplyr::everything())
}
