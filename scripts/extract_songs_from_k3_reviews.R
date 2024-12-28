#!/bin/env Rscript

review_filenames <- list.files(
  path = "/home/richel/GitHubs/k3reviews/inst/extdata",
  full.names = TRUE
)
heyahmama_folder <- "/home/richel/GitHubs/heyahmama/inst/extdata"
testthat::expect_true(length(list.files(heyahmama_folder)) > 0)



testthat::expect_true(length(review_filenames) > 0)

extract_lyrics_from_file <- function(filename) {
  text <- readr::read_lines(filename)
  apostrophe_lines <- stringr::str_which(text, "```")
  if (length(apostrophe_lines) < 2) {
    stop("No apostrophes found in file ", filename)
  }
  lyrics_lines_from <- apostrophe_lines[1] + 1
  lyrics_lines_to <- apostrophe_lines[2] - 1
  lyrics <- text[lyrics_lines_from:lyrics_lines_to]
  testthat::expect_false(lyrics[1] == "```")
  testthat::expect_false(tail(lyrics, n = 1) == "```")
  lyrics
}

# Convert the k3reviews camelcase filenames
# to snake case filenames
convert_to_heyahmama_filename <- function(
  k3review_path,
  heyahmama_folder = "/home/richel/GitHubs/heyahmama/inst/extdata"
) {
  filename <- basename(k3review_path)
  snake_case_basename <- stringr::str_replace(
    string = snakecase::to_snake_case(filename),
    pattern = "_md$",
    replacement = ".txt"
  )
  paste0(heyahmama_folder, "/", snake_case_basename)

}

convert_to_heyahmama_filename(k3review_path = review_filenames[1])
t <- tibble::tibble(
  k3review_path = review_filenames,
  heyahmama_path = Vectorize(convert_to_heyahmama_filename)(review_filenames)
)
t$k3review_basename <- basename(t$k3review_path)
t$heyahmama_basename <- basename(t$heyahmama_path)


# Extract all lyrics
for (review_filename in review_filenames) {
  path_to <- convert_to_heyahmama_filename(review_filename)
  message(paste0(review_filename, " -> ", path_to))
  lyrics <- extract_lyrics_from_file(review_filenames)
  readr::write_lines(lyrics, path_to)
}
