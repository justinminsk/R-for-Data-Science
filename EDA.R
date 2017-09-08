library(tidyverse)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
#an example of a categorical data point

diamonds %>%
  count(cut)
#gives the raw numbers for each bar

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)
#an example of a continusous data point graphed

diamonds %>%
  count(cut_width(carat, 0.5))
#gives raw numbers in a 0.5 carat width

smaller <- diamonds %>%
  filter(carat < 3)
#create a varible of diamonds with a carat less than 3

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)
#since our largest set of data is betwen 0.25 and 0.75 looking at data around that with a larger breakdown
#of 0.1 instead of 0.5 

ggplot(data = smaller, mapping = aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.1)
#shows the same as above but with cut also shown in color so that you can see a breakdown of cut and carat

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)
#create a graph of common observations, the problem is that we cannot see the outliears in this graph

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))
#zooms into the yaxis to see the rare "bins" of data using coord_cartesian

unusual <- diamonds %>%
  filter(y < 3 | y > 20) %>%
  arrange(y)
#create a dara set of unusual data aka the data less then 3 and greater than 20 on the y axis

unusual
#as you can see there are some diamonds with 0's in x and y which y is a width and diamonds cannot 
#have a width of 0 also they cannot have a width of 31.8 or 58.9 mm which is almost over an inch long

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 1000) 
#here is a histogram based on price and as you can see there are some odd data points like the price being
#below 0

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 100) +
  coord_cartesian(xlim = c(-1000, 1000))
#using a coord_cartesian we can see that while on the histogram it looks like there are points below 0
#in fact there are not now to look at the upper end

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 100) +
  coord_cartesian(xlim = c(15000, 30000))
#here we can see that diamonds drop off before 20000 in price

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 100) +
  coord_cartesian(xlim = c(300, 1400))
#here is the spike in out data

spike <- diamonds %>%
  filter(between(price, 300, 1400)) %>%
  arrange(price)
#narrow our window

spike

spike %>%
  count(cut_width(price, 100))
#look at where the bulk of the data lies

spike2 <- spike %>%
  filter(between(price, 600, 800))
#narrow even more

spike2

ggplot(spike2) +
  geom_bar(mapping = aes(x = carat, color = cut, fill = cut))
#see what carat and cut diamonds are selling for in this 200 dollar range 
#can see that the bulk of diamonds are sold around 600-800 dollars and are ideal cut 0.3-0.35 carat diamonds

highcarat <- spike2 %>%
  filter(between(carat, 0.4, 0.41)) %>%
  arrange(price)
#want to look at the bumb around 0.4 carats

ggplot(highcarat) +
  geom_boxplot(mapping = aes(y = price, x = cut))
#this seems to show in the 0.4 - 0.41 carat range premium seems to sell for the most and ideal 
#has some of the lowest selling diamonds which is odd

highcarat %>%
  count(cut)

highcarat %>%
  count(cut_width(price, 50))
#looking at what the data has in terms of numbers for cut and price
#since we are looking at price looks like price is a good data set to hone into

highcarat2 <- highcarat %>%
  filter(between(price, 675, 725))
#looking at our largest amount of data in this price point

ggplot(highcarat2) +
  geom_boxplot(mapping = aes(y = price, x = cut))
#oddly the worst cut diamonds seem to be sold for more than the other cuts, while premium has a large range

ggplot(highcarat2) +
  geom_boxplot(mapping = aes(y = y, x = cut))
#most of the y socres are around the same minus the fair diamons

ggplot(spike2) +
  geom_boxplot(mapping = aes(y = y, x = cut))
#this is more even for the price between 600- 800 and makes more sense with fair needing higher y
#scores then premium or ideal
#this might just be an outliear unless found else where it shows little 