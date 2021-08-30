# Create a mynumbers object then multiply it by two

mynumbers <- c(4, 8, 15, 16, 23, 42)


# Multiply mynumbers by 2 (but don't update the object)

mynumbers * 2


# Multiply mynumbers by 2 and store it as mynumbers2 object

mynumbers2 <- mynumbers * 2


# Find the maximum and minimum of mynumbers and mynumbers2

max(mynumbers)
max(mynumbers2)
min(mynumbers)
min(mynumbers2)


# See if we can calculate and store the range of mynumbers

mynumbers_range <- max(mynumbers) - min(mynumbers)


# R is case sensitive, so Max() doesn't work
# We get errors if we have a typo for object names too

Max(mynumbers)
max(mynumbres)


# Use ? to get help about the mtcars dataset in R

?mtcars


# These are all functions to explore a dataset
# glimpse requires the dplyr package
# skim requires the skimr package
# kable also requires another package

library(dplyr)
library(skimr)

head(mtcars)
summary(mtcars)
View(mtcars)
glimpse(mtcars)
skim(mtcars)


# The $ operator is used to look at specific variables in a data frame
# The code below prints the hp values in mtcars

mtcars$hp


# Below we print the car weights and calculate the minimum mpg

mtcars$wt
min(mtcars$mpg)