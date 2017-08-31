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
#select also uses common string functions like contains, starts_with, etc.

flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
#makes a sample set of day, month, year, all delay sets, distance, and air time

mutate(flights_sml, gain = arr_delay - dep_delay, speed = distance / air_time * 60)
#creates columns for gain and speed based off of our parameters

transmute(flights, gain = arr_delay - dep_delay, hours = air_time / 60, gain_per_hour = gain/hours )
#only keeps new varibles that you create using your parameters

x <- 1:10
#make x 1-10
lag(x)
#looks at x from one spot the the left so NA to 9 instead
lead(x)
#looks at x from one spot the the right so 2 to NA instead
cumsum(x)
#adds all values
cummean(x)
#finds rolling mean
min_rank(x)
#ranks from smallest to largest 

by_day <- group_by(flights, year, month, day)
#group by_day in flights by year, month, day
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))
#finds the mean delay for a day exculding NA's

by_dest <- group_by(flights, dest)
delay <- summarize(by_dest, count = n(), dist = mean(distance, na.rm = TRUE), delay = mean(arr_delay, na.rm = TRUE))
delay <- filter(delay, count > 20, dest != "HNL")
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)
#groups flights by destionation, summarizes to coute distance, average delay, and # of flights
#filter to remove short flights and honolulu since it is an outliear

delays <- flights %>%
  group_by(dest) %>%
  summarize(count = n(), dist = mean(distance, na.ra = TRUE), delay = mean(arr_delay, na.ra = TRUE)) %>%
  filter(count > 20, dest != "HNL")
#%>% means or can be thought of as then so create a varible based on our data THEN group the data by destionation
#THEN create a summary with a count and dist as a mean of the distances and delay as the mean of delays from short to highest
#THEN filter out our short flights and Honolulu since it is an outliear

