#' Get the different writers groups
#' @return an list with two elements:
#'
#' - `song_title_to_group_id`: a tibble with columns
#'   `song_title` and `group_id`.
#'   A `group_id` of zero denotes that the writers are
#'   unknown
#' - `group_id_to_writer_name`: a tibble with columns
#'   `group_id` and `writer_name`.
#'   A `group_id` of zero denotes that the writers are
#'   unknown
#'
#' @examples
#' get_writers_groups()
#' @author Richèl J.C. Bilderbeek
#' @export
get_writers_groups <- function() {
  song_title <- NULL; rm(song_title) # nolint, fixes warning: no visible binding for global variable
  group_id <- NULL; rm(group_id) # nolint, fixes warning: no visible binding for global variable

  writers <- get_writers()
  writer_names <- get_writer_names()
  song_titles <- get_song_titles()
  n_cols <- length(writer_names) + 1
  n_rows <- length(song_titles)
  col_names <- c("song_title", writer_names)
  m <- matrix(nrow = n_rows, ncol = n_cols)
  colnames(m) <- col_names
  t <- tibble::as_tibble(m)
  t$song_title <- song_titles

  for (col_index in seq(2, n_cols)) {
    writer_name <- names(t)[col_index]
    songs_with_this_writer <- writers[writers$writer_name == writer_name, ]$song_title
    t[, col_index] <- t$song_title %in% songs_with_this_writer
  }
  t$group_id <- NA
  for (i in seq_len(n_rows)) {
    bools <- as.logical(t[i, 2:n_cols])
    t$group_id[i] <- bools_to_int(bools)
  }
  song_title_to_group_id <- dplyr::select(t, song_title, group_id)

  tibbles <- list()
  group_ids <- unique(t$group_id)
  for (i in seq_len(length(group_ids))) {
    tibbles[[i]] <- tibble::tibble(
      group_id = group_ids[i],
      writer_name = convert_group_id_to_writer_names(group_ids[i])
    )
  }
  group_id_to_writer_name <- dplyr::bind_rows(tibbles)

  list(
    song_title_to_group_id = song_title_to_group_id,
    group_id_to_writer_name = group_id_to_writer_name
  )
}
