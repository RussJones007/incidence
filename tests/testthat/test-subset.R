context("Subset of incidence objects")

test_that("[ operator for incidence objects", {
  skip_on_cran()

  set.seed(123)
  dat <- as.integer(sample(-3:10, 50, replace = TRUE))
  x <- incidence(dat)
  y <- incidence(dat + as.Date("2016-01-12"), 7L)

  x.sub1 <- x[c(3,5,7,8)]
  expect_equal_to_reference(x.sub1, file = "rds/x.sub1.rds")

  x.sub2 <- x[-c(5,1,2)]
  expect_equal_to_reference(x.sub2, file = "rds/x.sub2.rds")

  y.sub1 <- y[1:2]
  expect_equal_to_reference(y.sub1, file = "rds/y.sub1.rds")
  expect_equal(y[1:2]$isoweeks, y$isoweeks[1:2])
})




test_that("subset for incidence objects", {
  skip_on_cran()

  set.seed(123)
  dat <- as.integer(sample(-3:10, 50, replace = TRUE))
  x <- incidence(dat)

  x.sub3 <- subset(x, from = 0)
  expect_equal_to_reference(x.sub3, file = "rds/x.sub3.rds")

  x.sub4 <- subset(x, to = 5)
  expect_equal_to_reference(x.sub4, file = "rds/x.sub4.rds")

  x.sub5 <- subset(x, from = 1, to = 4)
  expect_equal_to_reference(x.sub5, file = "rds/x.sub5.rds")

  ## round trip
  expect_identical(x, x[])

  ## corner cases
  expect_error(subset(x, from = 19), "No data retained.")
  expect_error(subset(x, to = -2319), "No data retained.")
  expect_error(subset(x, from = Inf, to = -2319), "No data retained.")
})

test_that("numeric subset works with dates ", {
  skip_on_cran()

  x <-  incidence(as.Date("2001-01-01") + 1:10, 2L)

  expect_equal(subset(x, from = 1, to = 2)$dates,
               x$dates[1:2])

  expect_equal(subset(x, from = -10, to = 2)$dates,
               x$dates[1:2])

  expect_equal(as.data.frame(subset(x, from = 0, to = 1e3)),
               as.data.frame(x))
  expect_identical(x, x[])
})


test_that("numeric subset works with dates and character strings", {
  x <-  incidence(as.Date("2001-01-01") + 1:100, "month")

  expect_equal(subset(x, from = 1, to = -1)$dates,
	       x$dates[1])

  expect_equal(subset(x, from = 1, to = 2)$dates,
               x$dates[1:2])

  expect_equal(subset(x, from = -10, to = 2)$dates,
               x$dates[1:2])


  expect_equal(subset(x, from = 5, to = 5)$dates,
	       x$dates[4])

  expect_equal(as.data.frame(subset(x, from = 0, to = 1e3)),
               as.data.frame(x))
  expect_identical(x, x[])
})

