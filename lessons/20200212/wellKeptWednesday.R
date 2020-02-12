
# Load the tidyverse
library(tidyverse)

# Loading the data from github
nyc_squirrels <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-29/nyc_squirrels.csv")

# Take a quick glimpse!
glimpse(nyc_squirrels)

# Get a quick summary of the data
summary(nyc_squirrels)

# Check number of unique entries
length(unique(nyc_squirrels$unique_squirrel_id))

# Check the colors of the squirrels
ggplot(nyc_squirrels, aes(primary_fur_color, fill = primary_fur_color)) +
  geom_histogram(stat = "count")


ggplot(nyc_squirrels, aes(primary_fur_color, fill = primary_fur_color)) +
  geom_histogram(stat = "count") +
  theme_light()


# To examine activities by time of day (AM/PM), first use pivot_longer() to
# get the data into a more "tidy" format. The `cols` specified are merged into
# a single column, "activity", with their values going into "TF"
squirrels2 <- nyc_squirrels %>%
  pivot_longer(., cols = c(running, chasing, climbing, eating, foraging),
               names_to = "activity", values_to = "TF") %>%
  filter(TF == TRUE)

# Now we can plot
ggplot(squirrels2, aes(shift, fill = activity)) +
  geom_histogram(stat = "count") +
  theme_classic(base_size = 12) +
  labs(x = "Shift", y = "Count", fill = "Activity",
       title = "Squirrel Activity by Time of Day") +
  scale_fill_brewer(type = "qual", palette = 5)

# Check out the different color palettes available
RColorBrewer::display.brewer.all()
