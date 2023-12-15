################################################################################
######################### Create All Margarine Exhibits ######################## 
################################################################################

### Set File Paths
root <- paste0("/Users/", Sys.getenv("USER"), "/Dropbox/github_private/margarine/")
code <- paste0(root, "code/")
data <- paste0(root, "data/")
exhibits <- paste0(root, "exhibits/")

### Load Packages
packages <- c("dplyr", "ggplot2", "readxl")
lapply(packages, require, character.only = TRUE)

### Create Exhibits
files <- c("butter_v_margarine.R", "nyt_mentions.R")
for(i in 1:length(files)){
  source(paste0(code, files[i]))}
