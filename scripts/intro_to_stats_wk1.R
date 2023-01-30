library(tidyverse)
library(here)

darwin <- read_csv(here("data", "darwin.csv"))
janitor::clean_names(darwin)
