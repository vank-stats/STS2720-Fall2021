library(dplyr)

# Option 1 - Repetitive, creates lots of objects

auto <- filter(mtcars, am == 0)
auto_grouped <- group_by(auto, cyl)
auto_avg_by_cyl <- summarize(auto_grouped, mean_mpg = mean(mpg))
auto_avg_by_cyl


# Option 2 - Hard to read functions nested inside one another

auto_avg_by_cyl <- summarize(group_by(filter(mtcars, am == 0), cyl), 
                             mean_mpg = mean(mpg))
auto_avg_by_cyl


# Option 3 (What we will use) - Uses %>% to create more readable code

auto_avg_by_cyl <- mtcars %>%
  filter(am == 0) %>%
  group_by(cyl) %>%
  summarize(mean_mpg = mean(mpg))
auto_avg_by_cyl



# Using the filter() function - Choose only rows where am is 0

auto <- filter(mtcars, am == 0)


# Create a subset of the data including cars that get less than 20 mpg

low_mileage <- filter(mtcars, mpg < 20)


# Two ways to create a subset that includes only manual trans. with < 20 mpg

manually_bad <- filter(mtcars, mpg < 20, am == 1)
lowmpg_manual <- filter(mtcars, mpg < 20 & am == 1)


# If we don't want to create an object, this is one way to View what gets made

filter(mtcars, mpg < 20 & am == 1) %>%
  View()


# Using summarize() to create numeric summaries of data

summarize(mtcars, Minimum = min(mpg), Q1 = quantile(mpg, .25), 
          Median = median(mpg), Q3 = quantile(mpg, .75), Maximum = max(mpg))

summarize(mtcars, Min = min(mpg), Lower_Q = quantile(mpg, .25), 
          Median = median(mpg), Upper_Q = quantile(mpg, .75), Max = max(mpg))

summarize(mtcars, min(mpg), quantile(mpg, .25), median(mpg), quantile(mpg, .75), 
          max(mpg))


# Using group_by() and summarize() to get summaries for each group in a var.

# Method 1 - data name is 1st argument of 1st function, piped into 2nd function

group_by(mtcars, am) %>%
  summarize(Minimum = min(mpg), Q1 = quantile(mpg, .25), 
            Median = median(mpg), Q3 = quantile(mpg, .75), Maximum = max(mpg))

# Method 2 - data name on own line, piped into 1st function
mtcars %>%
  group_by(am) %>%
  summarize(Number = n(), Minimum = min(mpg), Q1 = quantile(mpg, .25), 
            Median = median(mpg), Q3 = quantile(mpg, .75), Maximum = max(mpg))


# Using mutate() to create new variables
# We can store updated dataset in an object or print it to console

mycars <- mutate(mtcars, weight = wt * 1000, disp_cm = disp * 16.387)

mutate(mtcars, weight = wt * 1000, disp_cm = disp * 16.387)