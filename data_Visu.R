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

#second chapter
library(tidyverse)#need to load this every time

diamonds #second data set

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut)) 
#creates a basic bar graph

ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))
#makes the same bar graph different code

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
#makes a bar graph of proportions rather than bulk numbers

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
#makes a box graph here comparing cut and depth they are found at

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut, fill = cut))
#color adds an outline, fill fills thebars a color

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))
#if you use a second varible will fill the bars in proportion to the bar, here cut broken down into clarity

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity),
  position = "fill"
  )
#makes the bars even but shows proportion of cut compared to clarity better

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity),
           position = "dodge"
  )
#makes seprate bars to better show numbers over proportions

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), postion = "jitter")
#makes it so each point is represented, but with loss of accuracy

?position_dodge
#command to get help page can switch with jitter or stack, etc

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()
#makes a box plot of class compared to highway milage, coord_flip() flips the axis

