# Load the ggplot2 package

library(ggplot2)


# Create first graph in notes

ggplot(data = mtcars) +
  geom_point(aes(x = wt, y = mpg))


# Scatterplot of hp vs. mpg

ggplot(data = mtcars) +
  geom_point(aes(x = hp, y = mpg))


# Bar graph of transmission types (am variable)

ggplot(data = mtcars) +
  geom_bar(aes(x = am))


# Histogram of Temp from the airquality data set

ggplot(data = airquality) +
  geom_histogram(aes(x = Temp))


# The aes() function can go inside ggplot() or the geom_xx() function

ggplot(data = airquality, aes(x = Temp)) +
  geom_histogram()


# Change from the default of 30 bins to having 15 bins

ggplot(data = airquality) +
  geom_histogram(aes(x = Temp), bins = 15)

# Instead of choosing number of bins, make bins 5 units wide (e.g. 80 to 85 deg)

ggplot(data = airquality) +
  geom_histogram(aes(x = Temp), binwidth = 5, color = "white")

# Change color between bars and how bars are filled in (later in notes)

ggplot(data = airquality) +
  geom_histogram(aes(x = Temp), bins = 10, color = "blue", fill = "purple")


# Recreate the boxplot in the notes

ggplot(ToothGrowth) +
  geom_boxplot(aes(x = supp, y = len))

ggplot(ToothGrowth) +
  geom_boxplot(aes(y = supp, x = len))

# We can add colors to boxplots too

ggplot(ToothGrowth) +
  geom_boxplot(aes(y = supp, x = len), color = "pink", fill = "forestgreen")


#  A boxplot with more than two groups in the categorical variable
#    The as.factor() function changes Month from quantitative to categorical

ggplot(data = airquality) +
  geom_boxplot(aes(x = as.factor(Month), y = Temp))


# Bar graph from the notes

ggplot(data = diamonds) +
  geom_bar(aes(x = cut))


# Example with labels and a theme
#   alpha = __ argument controls transparency (from 0 to 1)

ggplot(data = diamonds) +
  geom_bar(aes(x = cut, fill = cut), alpha = .5) +
  labs(title = "Bar graph from the notes",
       subtitle = "Used geom_bar() for raw data",
       x = "Cut of Diamonds",
       y = "Number of Diamonds") +
  theme_dark()
