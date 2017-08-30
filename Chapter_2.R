#second chapter
library(tidyverse)#need to load this every time

diamonds #second data set

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut)) 
#creates a basic bar graph

ggplot(data = diamond) +
  stat_count(maping = aes(x = cut))
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

