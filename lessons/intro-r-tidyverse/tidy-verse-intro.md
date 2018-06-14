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

Set your working directory in R to where you saved [this folder]() to.
```{r}
read_csv("data/state_property_data.csv")
```

## Creating objects in R

When we loaded the data just now, we did not assign it to an object, so it printed to the screen, and then poof, it disapeared. Let's use R's assignment symbol to create an object to store it in:

```{r}
prop_data <- read_csv("state_property_data.csv")
```

To print an object to the console in R we can use the `print` function:
```{r}
print(prop_data)
```

## Selecting columns

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
## Filtering rows

If we want to filter a row from a data frame, we can use the `filter` function. Here we filter the rows where the `state` name is equal to NY from the data frame named `prop_data`:
```{r}
filter(prop_data, state == "NY")
```

We can also filter rows containing values below or above a threshold, for example rows where the mean commute time in minutes is > 21.5:
```{r}
filter(prop_data, mean_commute_minutes > 21.5)
```
