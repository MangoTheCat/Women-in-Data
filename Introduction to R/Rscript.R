########################################################################################################
#                                                                                                      #
#     1. Reading in data                                                                               #
#                                                                                                      #
########################################################################################################

# load the libraries
library(gdata)
library(xlsx)  # You might have to install 64-nit Java for this package to run successfully 



# ----- Reading in .txt file -----------

TXTdf <- read.table("file.txt", header = TRUE)


# ----- Reading in .csv file -----------

CSVdf <- read.csv("file.csv", header=TRUE, sep=",")
  

# ----- Reading in .xls file -----------

#library(gdata)  it's good practice to declare all libraries at the beginning of your script!
XLSdf <- read.xls("file.xls", sheet = 1, header=TRUE)


# ----- Reading in .xlsx file -----------

#library(xlsx) it's good practice to declare all libraries at the beginning of your script!
XLSXdf <- read.xlsx("file.xlsx", sheet = 1, header=TRUE)




########################################################################################################
#                                                                                                      #
#     2. Manipulate data                                                                               #
#                                                                                                      #
########################################################################################################

# ---------- Merge two datasets --------------

# merge two data frames by ID
# total <- merge(dfA, dfB, by="ID")

# add rows from dfB to dfA
# total <- rbind(dfA, dfB)


#---------- dplyr package for data manipulation -------------------------

# filter to only display data for cars with 4 cylinders
filter(mtcars, cyl == 4) # note double equals to test equality

# select 3 columns of the data
select(mtcars, mpg, cyl, wt) 

# arrange data in the increasing order of mpg
arrange(mtcars, mpg) 

# create new variables using mutate function, such as horsepower to weigth ratio 
mutate(mtcars, pwr2wt = hp/wt) 
# ... or multiple new variables at once
mutate(mtcars, pwr2wt = hp/wt, pwr2wt.Sq = pwr2wt^2) 


#--- Summarise function --- 
summarise(mtcars, mean(mpg), n_distinct(cyl))

# specifying the column names 
summarise(mtcars, MPG = mean(mpg), NCyls = n_distinct(cyl))


#--- Pipe operator ---
summarise(group_by(mtcars, cyl, am), MPG = mean(mpg))
# is the same as
mtcars %>% group_by(cyl, am) %>%
               summarise(MPG = mean(mpg))

mtcars %>%
      select(mpg, wt, cyl, am, gear) %>%
      filter(am == 0) %>%
      group_by(cyl) %>%
      summarise(mean.mpg = mean(mpg))


########################################################################################################
#                                                                                                      #
#     3. Simple statistics                                                                             #
#                                                                                                      #
########################################################################################################




# Fit a model of E(MPG) = a + b * Weight
mpgLm <- lm(mpg ~ wt, data = mtcars)

#check what is in the linear model mpgLm 
names(mpgLm)

# store coefficients of the linear model in vector variable coefs
coefs <- mpgLm$coefficients


# extract coeffcients into variables a and b 
a <- coefs[1]
b <- coefs[2]

# denote for convinience x and y as Temperature and Wind respectively 
y <- mtcars$mpg
x <- mtcars$wt


# plot data points and the line 
plot(x,y, type = "p")
y<- a+b*x
plot(x, y, type = "l")



########################################################################################################
#                                                                                                      #
#     4. Data Visualisation                                                                            #
#                                                                                                      #
########################################################################################################


#----- qplot -------

# basic plot
qplot (mpg, hp, data = mtcars)


# get the range for the x and y axis 
xRange <- range(mtcars$mpg) 
yRange <- range(mtcars$hp) 

# add layers
qplot (mpg, hp, data = mtcars,
       main = 'Horsepower Vs MPG Using mtcars Data',
       xlab = 'Miles/US Gallon', 
       ylab = 'Gross Horsepower',
       xlim = xRange, ylim = yRange)




#---- ggplot -----

basicPlot <- ggplot(data = mtcars) +
  geom_bar(aes(
    x = as.factor(cyl), 
    y = mpg, 
    fill = as.factor(carb)), 
    stat = "summary", 
    fun.y = "mean", 
    position = "dodge")

basicPlot

labelPlot <- basicPlot +
  labs(title = "Miles per gallon vs number of cylinders and carburetors",
       x = "Number of cylinders", y = "Miles per gallon", 
       caption = "data: mtcars",
       fill = "Number of \ncarburetors")

labelPlot





