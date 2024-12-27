test_that("use", {
  expect_silent(get_cds())
  expect_true(tibble::is_tibble(get_cds()))
  expect_true("cd_title" %in% names(get_cds()))
  expect_true("formation" %in% names(get_cds()))
  expect_true("year" %in% names(get_cds()))
})

test_that("All CD titles must be in MusicBrainz", {

  # artists <- musicbrainz::search_artists("K3")
  # k3_mbid <- artists[which(artists$disambiguation == "Flemish all girl pop group"), ]$mbid
  # releases <- musicbrainz::browse_releases_by("artist", k3_mbid)
  # # recordings <- musicbrainz::browse_recordings_by("artist", k3_mbid) # songs
  # musicbrainz_titles <- releases$title
  #
  # # ??? releases <- musicbrainz::lookup_release_by_id(k3_mbid, includes = "recordings")
  #
  #
  # titles <- get_cds()$cd_title
  #
  # found_titles <- titles[titles %in% musicbrainz_titles]
  # missing_titles <- titles[! titles %in% musicbrainz_titles]

})
