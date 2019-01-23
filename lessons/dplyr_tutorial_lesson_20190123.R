# Intro to Data Manipulation with dplyr!

# Here we will cover some of the most commonly used dplyr functions, using one
# of dplyr's practice datasets. Specifically, we will be looking at five
# functions used to manipulate dataframes (tables):

# 1. select() - extract columns based on name or index
# 2. filter() - extract rows based on some criteria
# 3. mutate() - add new columns based on existing ones
# 4. group_by() - group rows (observations) by value in a given column
# 5. summarize() - perform action/function on whole groups

# We will also cover the use of the pipe ( %>% ) function, used to send the
# output of one command/function into another.

# Finally, we will see how pipes allow us to chain or link multiple functions
# into a single, elegant step.

# Link to the Software Carpentry page:
# https://swcarpentry.github.io/r-novice-gapminder/13-dplyr/index.html


# Load the data -----------------------------------------------------------

# The dataset we will use is starwars, from dplyr, and can be loaded as follows
library(dplyr)

starwars <- starwars

# There are 13 columns (attributes, or variables) and 87 rows (characters, or
# observations).


# select() ----------------------------------------------------------------

# Let's use select() to extract a few columns from the overall dataset. The way
# we do this is as follows:
new_df <- select(my_df, col1, col2, col4, ...)

# For our starwars dataset, we could select the name, height, mass, homeworld,
# and species columns.
# CODE HERE

# We can rewrite the same command, this time making use of the %>% function.
# This function pushes, sends, or "pipes" the desired object into the subsequent
# function.
new_df <- my_df %>% select(.data = ., col1, col2, col4, ...)

# The "." is simply a placeholder for the object being piped (my_df in this
# example). Now let's apply this method to our starwars data, selecting the
# same columns as before.
# CODE HERE


# filter() ----------------------------------------------------------------

# This function allows us to extract rows from a dataframe, using some sort of
# logical criteria. So, you could extract rows for which the value of a
# particular column is negative (< 0). Or extract rows which contain a certain
# (non-numerical) value, such as a particular place or name.
new_df <- my_df %>% filter(col1 < 0)

# Or, for strings (i.e. "words"):
new_df <- my_df %>% filter(col2 == "blue")

# Equality in R is done using "==", while "=" is for assignment of aguments.

# Let's use filter to pick certain rows from the starwars data, choosing
# characters (rows) which are human:
# CODE HERE

# Another example, this time using a numeric column (i.e. logical criteria) to
# filter for characters above a certain height:
# CODE HERE


# mutate() ----------------------------------------------------------------

# mutate() allows us to create new columns, based on existing columns.
# Operations can be mathematical, or string (i.e. word) -related (i.e. combine
# strings). It works as follows:
new_df <- my_df %>% mutate(new_col = col1 * 2)

# Let's use mutate() to convert the mass column from kg to lbs:
# CODE HERE


# Combining functions through pipes ---------------------------------------

# Now is where we will see the real utility of pipes: they allow us to chain
# together multiple steps into a single command. The output of one function
# (e.g. select() ) can be piped into another function (e.g. filter() ). This
# allows us to combine multiple steps and run them all at once.
new_df <- my_df %>%
  select(col1, col2, col4) %>%
  filter(col2 == "blue") %>%
  mutate(new_col = col1 * 2)

# Let's try it on our starwars dataset, selecting columns of interest, filtering
# on species, and converting mass to pounds:
# CODE HERE


# group_by() and summarise() ----------------------------------------------

# These functions allow us to perform operations on subsets of data.
# group_by() "groups" rows based on a column/value, e.g. all rows for which
# colour (a column name) is equal to "blue". Then, summarise() performs some
# operation on each group as a whole. In this example, we would be grouping
# based on values in col1, then calculating the mean of col2 for each group.
new_df <- my_df %>%
  group_by(col1) %>%
  summarise(mean(col2))

# So, let's use these functions to calculate the average height for each
# species in the starwars dataset.
# CODE HERE

# Another example, this time getting two different summaries, one for height
# and one for mass.
# CODE HERE


# Tying it all together ---------------------------------------------------

# Now let's use all of the functions we've learned thus far in a single command,
# strung together via pipes. Let's say we want to calculate the average mass,
# in pounds, for each species, but only for characters above a certain height.
# We could do this as follows:
# CODE HERE
