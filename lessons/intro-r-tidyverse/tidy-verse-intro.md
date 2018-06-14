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

