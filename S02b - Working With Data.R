## Activity 02b Solutions

# Set working directory by going to...
#    Session Menu --> Set Working Directory --> To Source File Loc.


# 4 - read csv file into R
#   bridges shows up in the environment pane as a data frame

bridges <- read.csv(file = "Bridges.csv")


# 5 - We can see environment that there are 11 variables 
#   four appaer to be treated as numeric by R (possibly only SR and YEARBUILT
#   are actually quantitative though)


# 6 - There are 13,367 observations (each one is a bridge in NC)


# 7 - Multiple ways of finding the oldest bridge

min(bridges$YEARBUILT)
summary(bridges)
summary(bridges$YEARBUILT)

# 7 - and newest bridge

max(bridges$YEARBUILT)


# 8 - Create object year containing YEARBUILT information

year <- bridges$YEARBUILT


# 9 - Using square brackets (with vectors)
#   Whatever is inside the brackets is the elements we want to choose from
#   our vector (e.g. just the first element, or the first and the last)

year[1]
year[c(1, 13367)]
year[seq(1, 100, 10)]
year[1:5]


# 10 - Using square brackets (with data frames) -- some examples

bridges[1, ] # prints first row
bridges[, 1] # prints first columm
bridges[1, 1] # printing element in row 1 / column 1


# 10 - Create a data frame of just bridges in Alamance County

Alamance <- bridges[1:149, ]


# 11 - Alamance data with only certain columns

Alamance <- bridges[1:149, c(3, 4, 6, 7, 8)]


# 12 - We would have to find what rows Orange county bridges are in
#   Below is another approach you are not required to know
#   We will see an easier option in Notes 4

OrangeNC <- bridges[bridges$COUNTY == "ORANGE", ]
