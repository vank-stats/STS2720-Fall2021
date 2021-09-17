# Load libraries

library(moderndive)
library(ggplot2)
library(dplyr)


# Recreating my original sample from Notes 5

set.seed(82720)
house_of_reps <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2021/main/house_of_reps.csv")
mysamp <- rep_sample_n(house_of_reps, size = 30)
mysamp


# Taking a new sample (with replacement) from my original sample

mysamp2 <- rep_sample_n(mysamp, size = 30, replace = TRUE)
mysamp2
mean(mysamp2$party == "Democratic")


# Taking 1,000 samples (with replacement) from my original sample

resamples <- mysamp %>%
  rep_sample_n(size = 30, replace = TRUE, reps = 1000) %>%
  group_by(replicate) %>%
  summarize(prop_dems = mean(party == "Democratic"))


# Graphing my 1,000 sample proportions from my resampling

ggplot(resamples) +
  geom_histogram(aes(x = prop_dems), bins = 15, color = "white") +
  geom_vline(xintercept = mean(mysamp$party == "Democratic"), color = "red") +
  labs(title = "1,000 Sample Proportions from Resampling",
       subtitle = "Red line = original sample proportion")


# Calculating the standard deviation of my sample proportions
# Finding 1.645 SDs above and below the mean

resample_sd <- sd(resamples$prop_dems)
resample_mean <- mean(resamples$prop_dems)

resample_mean - 1.645 * resample_sd
resample_mean + 1.645 * resample_sd


# Finding z* for a Theory-based Method CI

conf_level <- .9
qnorm(conf_level + (1 - conf_level) / 2)
