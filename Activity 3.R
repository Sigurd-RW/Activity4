install.packages("dataspice")
library(dataspice)
create_spice(dir = "data")
edit_creators()
edit_access()
edit_biblio()
edit_attributes()

write_spice()
install.packages(c("jsonlite", "listviewer", "here", "magrittr", "pkgdown"))
library(jsonlite) 
library(listviewer) 
library(here) 
library(magrittr) 
library(pkgdown)
jsonlite::read_json(here::here("data", "metadata", "dataspice.json")) %>% 
  listviewer::jsonedit()
dataspice::build_site(path = "data/metadata/dataspice.json",
                      template_path = system.file("template.html5", package = "dataspice"),
                      out_path = "docs/index.html"
)                 

