library(knitr)
library(kableExtra)
library(sessioninfo)
library(tidyverse)
library(tibble)
library(dplyr)


auto_install_packages <- function(packages) {
  # Install packages not yet installed
  installed_packages <- packages %in% rownames(installed.packages())
  if (any(installed_packages == FALSE)) {
    install.packages(packages[!installed_packages])
  }
  # Load packages
  invisible(lapply(packages, library, character.only = TRUE))
}



options(
  knitr.table.format = function() {
    if (knitr::is_latex_output()) {
      "latex"
    } else {
      "pandoc"
    }
  },
  htmltools.dir.version = FALSE,
  formatR.indent = 2,
  width = 55,
  digits = 4,
  warnPartialMatchAttr = FALSE,
  warnPartialMatchDollar = FALSE,
  dplyr.print_min = 4,
  dplyr.print_max = 4,
  crayon.enabled = FALSE,
  rlang_trace_top_env = rlang::current_env()
)


is_on_ghactions <- identical(Sys.getenv("GITHUB_ACTIONS"), "true")
is_online <- curl::has_internet()
is_html <- knitr::is_html_output()
is_latex <- knitr::is_latex_output()



local({
  r <- getOption("repos")
  if (!length(r) || identical(unname(r["CRAN"]), "@CRAN@")) {
    r["CRAN"] <- "https://cran.rstudio.com"
  }
  options(repos = r)
})

lapply(c("DT", "formatR", "svglite", "rticles"), function(pkg) {
  if (system.file(package = pkg) == "") install.packages(pkg)
})

# install from github
githubs <- c("citr" = "crsh/citr")
lapply(names(githubs), function(pkg) {
  if (system.file(package = pkg) == "") remotes::install_github(githubs[pkg], upgrade = FALSE)
})



knitr::opts_chunk$set(echo = FALSE)

# Define function for all tables
kable_style <- function(dat) {
  dat %>% kableExtra::kable_styling(
    full_width = FALSE,
    latex_options = c("striped"),
    bootstrap_options = c("striped", "hover", "condensed", "responsive"),
    position = "float_right",
    font_size = ifelse(is_latex_output(), 9, 16)
    # format.args = list(big.mark = ",", scientific = FALSE),
  )
}

# We can then use the code in an inline
# R expression `r colorize("some words in red", "red")`,
# which will create some words in red (you will not see the red color
# if you are reading this book printed in black and white).
colorize <- function(x, color) {
  if (knitr::is_latex_output()) {
    sprintf("\\textcolor{%s}{%s}", color, x)
  } else if (knitr::is_html_output()) {
    sprintf("<span style='color: %s;'>%s</span>", color, x)
  } else {
    x
  }
}
