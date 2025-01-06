test_that("use", {
  expect_silent(get_cds())
  expect_true(tibble::is_tibble(get_cds()))
  expect_true("cd_title" %in% names(get_cds()))
  expect_true("formation" %in% names(get_cds()))
  expect_true("year" %in% names(get_cds()))
})

test_that("All CD titles are in title case", {

  cd_titles <- get_cds()$cd_title

  # 'Tele-Romeo' should be spelled like that
  expect_true("Tele-Romeo" %in% cd_titles)
  cd_titles <- cd_titles[ ! "Tele-Romeo" == cd_titles]

  # '10.000 Luchtballonnen' should be spelled like that
  expect_true("10.000 Luchtballonnen" %in% cd_titles)
  cd_titles <- cd_titles[ ! "10.000 Luchtballonnen" == cd_titles]

  # 'MaMaSé' should be spelled like that
  expect_equal(1, length(stringr::str_subset(cd_titles, "MaMaS")))
  cd_titles <- cd_titles[stringr::str_detect(cd_titles, "MaMaS", negate = TRUE)]

  # 'Eyo!' should be spelled like that
  expect_true("Eyo!" %in% cd_titles)
  cd_titles <- cd_titles[ ! "Eyo!" == cd_titles]

  expect_equal(cd_titles, snakecase::to_title_case(cd_titles))
})
