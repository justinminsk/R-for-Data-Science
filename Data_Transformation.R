#chapter 3
library(tidyverse)

install.packages("nycflights13")
#install out dataset

library(nycflights13)

nycflights13::flights
#our data set

View(flights)
#opens a window so you can see all the data not just an example 

filter(flights, month == 1, day == 1)
#filters the data by first month first day only

(jan1 <- filter(flights, month == 1, day == 1))
#saves that filter into varible jan1

nov_dec <- filter(flights, month %in% c(11, 12))
#assigns all of the nov and dec flights into a table

View(nov_dec)
#test to see that it does

View(arrange(flights, year, month, day))
#arranges from low to high by year, month, and day

arrange(flights, desc(arr_delay))
#aranges from high to low the delay, note na or no vaule data points are moved to the end

select(flights, year, month, day)
#selects only certain columns, can use for example (year:day) all columns between two columns or -(year:day) to
#selects everything but the columns you specifiy in this example day, month, and year