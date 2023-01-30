library(tidyverse)
library(here)

darwin <- read_csv(here("data", "darwin.csv"))
janitor::clean_names(darwin)

darwin %>% 
  ggplot(aes(x=type,
             y=height))+
  geom_point()
