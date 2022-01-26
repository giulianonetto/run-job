library(tidyverse)

dir.create("output")
p <- mtcars %>% 
  ggplot(aes(cyl, mpg)) +
  geom_point() +
  theme_minimal()

ggsave("output/plot1.png", p)
