usethis::use_build_ignore("dev_history.R")


usethis::use_gpl3_license(name = "Alain Danet")


# documentation
usethis::use_readme_rmd()
usethis::use_vignette("aa-moments")

usethis::use_pipe()


# CI
usethis::use_travis()
usethis::use_github_action_check_standard()
usethis::use_github_action("pkgdown")

# use pkgdown
pkgdown::build_site()
usethis::use_git_ignore("docs")
usethis::use_git_ignore("inst/docs")

# build package 
attachment::att_amend_desc()
devtools::check()
devtools::install()
devtools::build_readme()
pkgdown::build_site()
