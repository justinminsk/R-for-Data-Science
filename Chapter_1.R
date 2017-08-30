library(tidyverse) # Library I am using for ggplot2 and dplyr

mpg #First set of data

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) 
#Basic point plot with color shows the engine type and highway milage the car gets and also what type of car it is with color

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth() 
#adds a line of best fit showing that highway mileage lowers with the amount of cylinders 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
#breaks data into different graphs based on the class of car

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact"),
    se = FALSE
  )
#the smooth line now only is based off of the subcompact car class