#' auto_install_packages
#'
#' @param packages
#'
#' @returns
#' @export
#'
#' @examples
auto_install_packages <- function(packages) {
  # Install packages not yet installed
  installed_packages <- packages %in% rownames(installed.packages())
  if (any(installed_packages == FALSE)) {
    install.packages(packages[!installed_packages])
  }
  # Load packages
  invisible(lapply(packages, library, character.only = TRUE))
}

packages <- c(
  "bookdown",
  "boot",
  "broom",
  "bslib",
  "caret",
  "cli",
  "curl",
  "data.table",
  "desc",
  "downlit",
  "dplyr",
  "DT",
  "formatR",
  "fs",
  "gapminder",
  "GGally",
  "ggforce",
  "ggmosaic",
  "ggplot2",
  "gh",
  "glmnet",
  "globals",
  "glue",
  "gridExtra",
  "hexSticker",
  "Hmisc",
  "ICC",
  "ISLR",
  "janitor",
  "jsonlite",
  "jtools",
  "kableExtra",
  "knitr",
  "lares",
  "lattice",
  "lme4",
  "magick",
  "MASS",
  "methods",
  "mice",
  "mnormt",
  "mosaic",
  "multcomp",
  "nlme",
  "openintro",
  "pander",
  "png",
  "pROC",
  "profvis",
  "pscl",
  "purrr",
  "remotes",
  "renv",
  "reshape2",
  "rlang",
  "rmarkdown",
  "rpart",
  "rpart.plot",
  "rsample",
  "rsconnect",
  "RSQLite",
  "sessioninfo",
  "shiny",
  "shinycssloaders",
  "shinyFeedback",
  "shinyloadtest",
  "shinytest",
  "shinythemes",
  "styler",
  "sysfonts",
  "testthat",
  "thematic",
  "tibble",
  "tidyverse",
  "tinytex",
  "vctrs",
  "vroom",
  "waiter",
  "waldo",
  "webshot",
  "xfun",
  "xml2",
  "xtable",
  "yaml",
  "zeallot"
)

auto_install_packages(packages)
