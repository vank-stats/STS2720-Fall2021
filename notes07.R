# Load pacakges for Notes 07

library(infer)
library(dplyr)
library(ggplot2)
library(palmerpenguins)


# Recreate my sample from earlier sets of notes

set.seed(82720)
house_of_reps <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2021/main/house_of_reps.csv")
mysamp <- rep_sample_n(house_of_reps, size = 30)


# Calculate my sample proportion

HOR_phat <- mean(mysamp$party == "Democratic")
HOR_phat


# Create a bootstrap distribution of sample proportions

HOR_bootstrap <- mysamp %>%
  specify(formula = party ~ NULL, success = "Democratic") %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "prop")


# Make a histogram of the sample proportions from the bootstrap resampling

visualize(HOR_bootstrap) +
  geom_vline(xintercept = HOR_phat, color = 'red')


# Find a percentile CI

HOR_ci_percentile <- HOR_bootstrap %>%
  get_ci(level = 0.95, type = "percentile")
HOR_ci_percentile


# Find a SE method CI

HOR_ci_se <- HOR_bootstrap %>%
  get_ci(level = 0.95, type = "se", point_estimate = HOR_phat)
HOR_ci_se



# Create peng_samp for second part of notes 07

peng_samp <- filter(penguins, species != "Adelie")


# Use table() to find sample proportion of female for each species

table(peng_samp$species, peng_samp$sex) %>%
  prop.table(margin = 1)


# Alternative method: Use infer functions to find diff. in sample proportions

peng_samp %>%
  specify(formula = sex ~ species, success = "female") %>%
  calculate(stat = "diff in props", order = c("Chinstrap", "Gentoo"))


# Create bootstrap distribution of differences in sample proportions

peng_boot <- peng_samp %>%
  specify(formula = sex ~ species, success = "female") %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "diff in props", order = c("Chinstrap", "Gentoo"))


# Histogram of bootstrap distribution

visualize(peng_boot) +
  geom_vline(xintercept = 0.013, size = 2, color = "purple")


# Percentile and SE method CIs for difference in population proportions

peng_perc <- get_ci(peng_boot, level = 0.99, type = "percentile")
peng_se <- get_ci(peng_boot, level = 0.99, type = "se", point_estimate = 0.013)


# Visualize the CI on our histogram

visualize(peng_boot) +
  shade_ci(endpoints = peng_perc, alpha = .3, color = "orange") +
  geom_vline(xintercept = 0.013, size = 2, color = "purple")