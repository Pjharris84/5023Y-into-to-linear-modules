library(tidyverse)
library(here)

darwin <- read_csv(here("data", "darwin.csv"))
janitor::clean_names(darwin)

darwin %>% 
  ggplot(aes(x=type,
             y=height))+
  geom_point() #basic scatter plot

ggplot(data = darwin, aes(x = type, y = height)) + 
  geom_boxplot(aes(fill = type), alpha = 0.7, 
               width = 0.5, show.legend = FALSE)
