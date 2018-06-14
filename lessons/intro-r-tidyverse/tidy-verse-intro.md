# Short intro to R via the `tidyverse`

This is a list of the commands we will explore today, as well as some exercises we will try!

## installing and loading the `tidyverse` package

How to install the `tidyverse` package (inside R):
```{r}
install.packages("tidyverse")
```
*note - this only has to be done once on your computer*

How to load the `tidyverse` package so that you can use its functions:
```{r}
library(tidyverse)
```
*note - this has to be done for each coding document you write*

## loading data

Set your working directory in R to where you saved [this folder](https://github.com/minisciencegirl/studyGroup/files/2101006/intro-r-tidyverse.zip) to.
```{r}
read_csv("data/state_property_data.csv")
```

## creating objects in R

When we loaded the data just now, we did not assign it to an object, so it printed to the screen, and then poof, it disapeared. Let's use R's assignment symbol to create an object to store it in:

```{r}
prop_data <- read_csv("state_property_data.csv")
```

To print an object to the console in R we can use the `print` function:
```{r}
print(prop_data)
```

## selecting columns
If we want to select a column from a data frame, we can use the `select` function. Here we select the column named `state` from the data frame named `prop_data`:
```{r}
select(prop_data, state)
```

We can also select multiple columns:
```{r}
select(prop_data, state, med_prop_val, mean_commute_minutes)
```

As well as a range of columns:
```{r}
select(prop_data, state:med_prop_val)
```
## filtering rows

If we want to filter a row from a data frame, we can use the `filter` function. Here we filter the rows where the `state` name is equal to NY from the data frame named `prop_data`:
```{r}
filter(prop_data, state == "NY")
```

We can also filter rows containing values below or above a threshold, for example rows where the mean commute time in minutes is > 21.5:
```{r}
filter(prop_data, mean_commute_minutes > 21.5)
```

## the pipe (`%>%`) operator
In R we can use a pipe operator, `%>%`, to efficiently combine functions. You can think of the pipe as a physical pipe - taking the output from the expression on the left-handside of the pipe and passing it as the input to first expression on the right-handside of the pipe.

Here is an example of using the pipe to combine `filter` and `select` to subset the median household income and the median property value for the state of California:
```{r}
filter(prop_data, state == "CA")
select(ca_prop_data, med_income, med_prop_val)
```

We can even use it to chain together more than 2 functions! Here we will use it to join together 2 datasets and then select and filter the joined data:

First we read in a new dataset (and take a look at it):
```{r}
vote_data <- read_csv("data/2016_presidential_election_state_vote.csv")
print(vote_data)
```
And let's look at our prop_data data frame again:
```{r}
print(prop_data)
```

Since both data frames have a state column, we can join the two data frames on that column, and then perform select and filter on that joined data frame to get the median household income for DC and which party DC voted for in the 2016 Presidential election:
```{r}
left_join(prop_data, vote_data, by = "state") %>%
    filter(state == "DC") %>%
    select(med_income, party)
```

## plotting the data

Here we will create a scatter plot of the `prop_data` to look to see if there is a relationship between the 2015 US state median household income and median property value:

```{r}
ggplot(prop_data, aes(x = med_income, y = med_prop_val, color = party)) +
  geom_point() +
  xlab("Income (USD)") +
  ylab("Median property value (USD)")
```

If we again join our `prop_data` and `vote_data` data frames to create a new one called `combined_data` we can then add colour to the points on our scatter plot for which party each state voted for in the 2016 Presidential election:
```{r}
combined_data <- prop_data %>% 
  filter(state != "PR") %>% 
  left_join(vote_data)
  
ggplot(combined_data, aes(x = med_income, y = med_prop_val, color = party)) +
  geom_point() +
  xlab("Income (USD)") +
  ylab("Median property value (USD)")
```

That's all for now folks! Come to work-a-long next week to get practice and questions answered :)
