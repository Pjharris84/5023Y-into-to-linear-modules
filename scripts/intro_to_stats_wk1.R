library(tidyverse)
library(here)
library(kableExtra)

darwin <- read_csv(here("data", "darwin.csv"))
janitor::clean_names(darwin)

darwin %>% 
  ggplot(aes(x=type,
             y=height))+
  geom_point() #basic scatter plot

ggplot(data = darwin, aes(x = type, y = height)) + 
  geom_boxplot(aes(fill = type), alpha = 0.7, 
               width = 0.5, show.legend = FALSE)

darwin %>% 
  group_by(type) %>% 
  summarise(mean=mean(height),
            sd=sd(height))

# make a new object - summary table of mean and SD for height
darwin_summary <-darwin %>% 
  group_by(type) %>% 
  summarise(mean=mean(height),
            sd=sd(height))

# make a summary plot
darwin_summary %>% 
  ggplot(aes(x=type,
             y=mean))+
  geom_pointrange(aes(ymin=mean-sd, ymax=mean+sd))+
  theme_bw()

# use kable extra functions to make a nice table (could be replaced with kable() if needed)
darwin_summary %>% 
  kbl(caption="Summary statistics of crossed and selfed maize plants") %>% 
  kable_styling(bootstrap_options = "striped", full_width = T, position = "left")

darwin_wide <- darwin %>% 
  pivot_wider(names_from = type, values_from = height) %>% 
  mutate(difference = Cross - Self)

difference_summary <- darwin_wide %>% 
  summarise(mean=mean(difference),
            sd=sd(difference),
            n=n())

difference_summary

difference_summary %>% #mutate difference_summary to calculate SE
  mutate(se= sd/sqrt(n))

lowerCI <- 2.62-(2*1.22) # confidence intervals

upperCI <- 2.62+(2*1.22)

lowerCI
upperCI