# Notes 15 code

library(ggplot2)
library(infer)
library(dplyr)


# Read in masks data (from Activity 15a)

masks <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2021/main/masks_covid.csv")


# Calculate simple linear regression line

lm(Symptoms_Pct ~ Masks_Pct, data = masks)


# Predictions with our linear regression line (for x = 90 and x = 60)

masks.lm <- lm(Symptoms_Pct ~ Masks_Pct, data = masks)
predict(masks.lm, newdata = data.frame(Masks_Pct = c(90, 60)))


# Or we can use piping to send out lm function into our predict function

lm(Symptoms_Pct ~ Masks_Pct, data = masks) %>%
  predict(newdata = data.frame(Masks_Pct = c(90, 60)))


# We can also get predicted values for the observations in our data

predict(masks.lm)


# Here is how to add predicted values and residuals to our dataset

masks <- masks %>%
  mutate(Predicted = predict(masks.lm),
         Residual = Symptoms_Pct - Predicted)


# We can use select() if we want to re-order our variables in our data

masks <- masks %>%
  select(State, Region, Masks_Pct, Symptoms_Pct, Predicted, Residual)


# Put a regression line on your graph

ggplot(masks, aes(x = Masks_Pct, y = Symptoms_Pct)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_classic()


# Calculate R^2 (by squaring correlation coefficient, r)

cor(masks$Masks_Pct, masks$Symptoms_Pct)^2


# To understand R^2, look at how much less points vary around our regression
#   line than our line of the mean for y
#   72% of variability in Symptoms_Pct around its mean is explained by Masks_Pct

ggplot(masks, aes(x = Masks_Pct, y = Symptoms_Pct)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  geom_abline(intercept = 24.37255, slope = 0) +
  theme_classic()