#' Get the path to a file bundled with this package
#' @param filename name of a file bundled with this package
#' @return the full path to a file bundled with this package
#' @examples
#' get_heyahmama_path("formations.csv")
#' @author Richèl J.C. Bilderbeek
#' @export
get_heyahmama_path <- function(filename) {
    full <- system.file("extdata", filename, package = "heyahmama")
    if (!file.exists(full)) {
        stop("'filename' must be the name of a file in 'inst/extdata'")
    }
    full
}
