
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sims

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis-CI Build
Status](https://travis-ci.com/poissonconsulting/sims.svg?branch=master)](https://travis-ci.com/poissonconsulting/sims)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/sims?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/sims)
[![Coverage
Status](https://img.shields.io/codecov/c/github/poissonconsulting/sims/master.svg)](https://codecov.io/github/poissonconsulting/sims?branch=master)
[![License:
GPL3](https://img.shields.io/badge/License-GPL3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.html)
<!-- [![Tinyverse status](https://tinyverse.netlify.com/badge/sims)](https://CRAN.R-project.org/package=sims) -->
<!-- [![CRAN status](https://www.r-pkg.org/badges/version/sims)](https://cran.r-project.org/package=sims) -->
<!-- ![CRAN downloads](http://cranlogs.r-pkg.org/badges/sims) -->
<!-- badges: end -->

sims is an R package to generate datasets from
[JAGS](http://mcmc-jags.sourceforge.net) or R code for use in simulation
studies. The datasets are returned as an
[nlists](https://github.com/poissonconsulting/nlist) object and/or saved
to file as individual .rds files.

## Installation

To install the developmental version from
[GitHub](https://github.com/poissonconsulting/sims)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/sims")
```

To install the latest developmental release from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

``` r
# install.packages("drat")
drat::addRepo("poissonconsulting")
install.packages("sims")
```

## Demonstration

### Simulate Data

By default, `sims_simulate()` returns the simulated datasets in the form
of an [nlists](https://github.com/poissonconsulting/nlist) object.

``` r
library(sims)
#> Loading required package: purrr
set.seed(10)
sims_simulate("a ~ dunif(0,1)", nsims = 2L)
#> $a
#> [1] 0.6857306
#> 
#> an nlists object of 2 nlist objects each with 1 natomic element
```

If, however, `save = TRUE` then each nlist object is saved as an `.rds`
file in `path`.

``` r
set.seed(10)
sims_simulate("a ~ dunif(0,1)", nsims = 2L, save = TRUE, path = tempdir(), exists = NA)
#> [1] TRUE
sims_data_files(tempdir())
#> [1] "data0000001.rds" "data0000002.rds"
sims_data(tempdir())
#> $a
#> [1] 0.6857306
#> 
#> an nlists object of 2 nlist objects each with 1 natomic element
```

## Information

For more information see the [Using
sims](https://poissonconsulting.github.io/sims/articles/sims.html)
vignette.

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/sims/issues).

[Pull requests](https://github.com/poissonconsulting/sims/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/poissonconsulting/sims/blob/master/CODE_OF_CONDUCT.md).
By contributing, you agree to abide by its terms.
