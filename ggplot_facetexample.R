# Read in data from Activity 08a

fidget <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2021/main/fidget_spinners.csv")


# Create a separate histogram for each Condition category
# Put them in a single column for easy comparison

ggplot(fidget) +
  geom_histogram(aes(x = MemoryScore), binwidth = 2, color = "orange") +
  facet_wrap(facets = vars(Condition), ncol = 1) +
  theme_classic()


# Create a grid of histograms where each row corresponds to a Condition
#   category and each column to a Gender category

ggplot(fidget) +
  geom_histogram(aes(x = MemoryScore), binwidth = 2, color = "orange") +
  facet_grid(rows = vars(Condition), cols = vars(Gender)) +
  theme_bw()
