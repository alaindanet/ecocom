usethis::use_build_ignore("dev_history.R")


usethis::use_gpl3_license(name = "Alain Danet")


# documentation
usethis::use_readme_rmd()
usethis::use_vignette("aa-moments")

usethis::use_pipe()

# build package 
attachment::att_to_description()
devtools::check()
devtools::install()

# CI
usethis::use_travis()
usethis::use_github_action_check_standard()
usethis::use_github_action("pkgdown")
