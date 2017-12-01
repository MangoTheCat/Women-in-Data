
# you can use the assign opperator "<-" 
# or "=". It is considered a good coding practice to use "<-" when 
# creating an object, and "=" when setting value of parameters inside functions
y <- 10

# once when you download an R package use "library" function to make the package 
# available
library(dplyr)

# list packages attached to your RStudio session
search()

# what is inside "dplyr" package
objects("package:dplyr")

# this will shor the documentation on "mutate" function
?mutate


# what is my work directory:
getwd()

#chenge the work directory
#give the path to desired place. How you are going to give the path depends on 
#your operative system
# for example, on Windows machines it can look like:
# "C:\\Temp"
# On MacOS or linux:
# "/Users/jilic/Desktop/WiD/" 
# which is the same as "~/Desktop/WiD/london.csv"

setwd("~/Desktop/WiD/")

# ------------------------- Reading in datasets --------------------------------

# read csv file 
# you can use RStudio ImportDataset button, or:

library(readr)
london <- read_csv(file = "~/Desktop/WiD/london.csv")

#see created dataframe:
View(london)

# examine the dataframe
names(london)
ncol(london)
nrow(london)


# Write data into a csv file
write_csv(london, "test_london.csv")

##------ answer to Excercise 1----------
# 1)
# attach the library (if it is not already attached)
library(readr)
london1 <- read_csv(file = "~/Desktop/WiD/london.csv")

# or you can set the workdir to be the dir where the file is
setwd("~/Desktop/WiD/")
london1 <- read_csv(file = "london.csv")

# 2)
View(london1)
#3)
nrow(london1)
ncol(london1)
#4)
names(london1)

# ------------------------- Data Manipulation --------------------------------
# attach needed library
library(dplyr)

# ------filter function (get rows that satisfy some condition)
?filter

# we will be usin mtcars dataset (one of data set in a package datasets. That
# package is always attached to your RStudio session)
?mtcars
View(mtcars)

mtcars_filt <- filter(mtcars, cyl == 4)
# logical opperators
# == "is equal"
# > "grates than"
# < "less than"
# | "or"
# & "and"
# != "not equals"

#combine logical operations
filter(mtcars, cyl == 4 & hp > 90)

# --------select function (get columns that you want)
# documentation
?select

#select 3 columns by name
select_mtcars_1 <- select(mtcars, mpg, hp, wt )
select_mtcars_1

#remove a comumn
select(mtcars, -mpg)

# print top 4 rows
head(mtcars, n=4)
# print bottom 4 rows
tail(mtcars, n=4)

# you can pass a function call as a parameter
# this will select only 2 colums from mtcars and print 4 bottom rows
tail(select(mtcars, hp, mpg), n=4)

# ------ arrange function (sorting the table)
?arrange

# sorting is by default ascending
arrange(mtcars, cyl)

# if you want to change use "desc" function
arrange(mtcars, desc(cyl))

# you can sort by any number of columns
arr2 <- arrange(mtcars, cyl, hp)
arr2

# ------- mutate function (add a new column)
?mutate

mtcars_1<- mutate(mtcars, prod_mpg_hp= mpg*hp)
mtcars_1

# you do not have to create columns one by one
mtcars_1 <- mutate(mtcars, prod_mpg_hp= mpg*hp, ttt = log(prod_mpg_hp)^2)
mtcars_1

##------ answer to Excercise 2----------
View(airquality)
#1)
mayData <- filter(airquality, Month == 5)
mayData
#2)
mayData1 <- select(mayData, -Month)
mayData1
#3)
mayData_filtered <- filter(mayData1, Wind >15)
mayData_filtered
#4
select(mayData_filtered, Ozone, Wind, Temp)



# -------summarise function
?summarise

sm <- summarize(mayData1, maxTemp = max(Temp))
sm

#this will return NA because there are missing values in the Ozone column
# R treats missing values differently than excel 
summarize(mayData1, mnOzone= mean(Ozone))

# try:
# NA + 5
# NA - 5
# NA*5

#to remove NAs use function mean with parameter na.rm set to TRUE

sm <- summarize(mayData1, mnOzone= mean(Ozone, na.rm = TRUE) )
sm
# you can get more than one summary
sm <- summarize(mayData1, mnOzone= mean(Ozone, na.rm = TRUE), maxTemp = max(Temp) )
sm

# ----- group_by function
# look at the structure of mtcars
str(mtcars)

# now apply group_by function
gr_mtcars <- group_by(mtcars, cyl) 
gr_mtcars

# visualy nothing changed, but structurally:
str(gr_mtcars) 
# some metadata have been added to your table

# now try summarise on your grouped dataset 
summarise(gr_mtcars, max(mpg))

# try sumarise on the dataset that has not been grouped
summarise(mtcars, max(mpg))

# you can group by more than one column
gr_mtcars2 <- group_by(mtcars, cyl, am) 
summarise(gr_mtcars2, max(mpg))

# you can use nesting to do the same as above
summarise(group_by(mtcars, cyl, am), max(mpg))

##------ answer to Excercise 3----------
# 1)
airSort <- arrange(airquality, Wind, desc(Temp))

# 2)
head(airSort, n=5)
# 3)
airSort <- mutate(airSort, HighWind = between(Wind, 15, max(Wind)))
airSort
#_______


# ---- pipe operator  

mtcars %>%
  group_by(cyl, am) %>%
  mutate(nwr = hp*wt) %>%
  summarise(max(nwr))

##------ answer to Excercise 4----------

airquality %>%
  mutate(-Solar.R) %>%
  group_by(Month) %>%
  arrange(desc(Wind)) %>%
  filter(Wind > 15) %>%
  summarise(max(Ozone))

# ------------------------- Data Visualisation --------------------------------


library(ggplot2)

# 2 functions:  
# qplot (quick plot; makes many assymptions)
# ggplot (no assumptions on what do you want to do)

# histogram, just x axes given
qplot(x = Sepal.Length, data = iris)

# change number of bins:
qplot(x = Sepal.Length, data = iris, bins = 20)

# scatter plot
qplot(x = Sepal.Length, 
      y = Petal.Length, 
      data = iris)

# add title and labels
qplot(x = Sepal.Length, 
        y = Petal.Length, 
        data = iris,      
        main = 'Petal lenght as a function of sepal
        length \n for different species of iris plant',        
        xlab = 'Sepal Length (cm)',        
        ylab = 'Petal Lenght (cm)')

# add limits
qplot(x = Sepal.Length, 
      y = Petal.Length, 
      data = iris,      
      main = 'Petal lenght as a function of sepal
      length \n for different species of iris plant',        
      xlab = 'Sepal Length (cm)',        
      ylab = 'Petal Lenght (cm)',                
      xlim = c(3, 8),        
      ylim = c(0, 7))

# map colour and shape with some variable
qplot(x = Sepal.Length, 
      y = Petal.Length, 
      data = iris,      
      main = 'Petal lenght as a function of sepal
      length \n for different species of iris plant',        
      xlab = 'Sepal Length (cm)',        
      ylab = 'Petal Lenght (cm)',                
      xlim = c(3, 8),        
      ylim = c(0, 7),
      colour = Species,
      shape = Species)


# chose the colour (no maping!)
qplot(x = Sepal.Length, 
      y = Petal.Length, 
      data = iris,      
      main = 'Petal lenght as a function of sepal
      length \n for different species of iris plant',        
      xlab = 'Sepal Length (cm)',        
      ylab = 'Petal Lenght (cm)',                
      xlim = c(3, 8),        
      ylim = c(0, 7),
      colour = I("red"),
      shape = Species)

##------ answer to Excercise 5----------
# 1)
?airquality
qplot(x = Wind, y = Ozone, data = airquality,
      xlab = "Wind (m/h)",
      ylab = "Ozone level (ppb)",
      main = " Ozone level as a function of\n average wind speed")

# 2) 
qplot(x = wt, data = mtcars, bins = 15)



# bar chart 
# I want to plot mean Sepal.Length for differen iris species as a bar chart
# first sort out data
iris_mean <- iris %>%  
  group_by(Species) %>%  
  summarize(mean.Length = mean(Sepal.Length))

# than do the same as for the scatter plot, but add new "bar" geometry
# note: you can give hexadecimal colors
qplot(x= Species, y= mean.Length, data = iris_mean ) + 
  geom_bar(stat="identity", fill = "#9e6b9b")

# box plot
qplot(x= Species, y= Sepal.Length, data = iris ) + 
  geom_boxplot()

# there are many geometries available in ggplot2 package. Which one you will chose
# depends on your data

grep(pattern="^geom", x=objects("package:ggplot2"),value =T) 



# - -------------------  Linear Model ------------------------------------------
# use mtcars dataset
# Fit a model of E(mpg) = a + b * wt
mpgLm <- lm(mpg ~ wt, data = mtcars)

print(mpgLm)

# diagnostic plots:
plot(mpgLm)

# residuals
resid(mpgLm)

# coefficients
coef(mpgLm)

# confindence interval
confint(mpgLm)


