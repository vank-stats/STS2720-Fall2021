## Example 1 - Single proportion

prop.test(x = 59, n = 100, p = 0.5, alternative = "two.sided")
prop.test(x = 59, n = 100, p = 0.5, alternative = "two.sided")$p.value



# Example 2 - Comparing two proportions

prop.test(x = c(38, 24), n = c(50, 30), alternative = "less")



# Example 3 - Single mean

library(palmerpenguins)

t.test(penguins$body_mass_g, mu = 4000, alternative = "greater")
t.test(penguins$body_mass_g, mu = 4000, alternative = "greater")$p.value



# Example 4 - Comparing two means

t.test(penguins$flipper_length_mm ~ penguins$sex, alternative = "less")



# Example 5 - ANOVA

fidget <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2021/main/fidget_spinners.csv")

fidget.aov <- aov(MemoryScore ~ Condition, data = fidget)
summary(fidget.aov)


# Example 6 - Chi-Squared

example <- data.frame(season = c(rep("Fall", 7), rep("Spring", 10),
                                 rep("Summer", 19), rep("Winter", 15)),
                      handedness = c("Left", rep("Right", 6),
                                     "Left", rep("Right", 9), 
                                     "Both", "Left", rep("Right", 17),
                                     "Both", rep("Left", 3), rep("Right", 11)))

chisq.test(example$season, example$handedness)
