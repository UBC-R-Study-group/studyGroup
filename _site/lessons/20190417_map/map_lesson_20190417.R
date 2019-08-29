
# Load the tidyverse, which includes purrr
library(tidyverse)


# Basic list to show some simple examples
practice_list <- list(a = 9,
                      b = 16,
                      c = 25)


# Load in gene data
treatment1 <- read.csv(
  "https://raw.githubusercontent.com/UBC-R-Study-group/studyGroup/gh-pages/lessons/20190417_map/genes_treatment1_vs_ctrl.csv")

treatment2 <- read.csv(
  "https://raw.githubusercontent.com/UBC-R-Study-group/studyGroup/gh-pages/lessons/20190417_map/genes_treatment2_vs_ctrl.csv")

# Put both data frames into a list
treatment_list <- list(treat1 = treatment1,
                       treat2 = treatment2)

                       
# Using map() to do string replacement in all columns of a data frame
# Set up dummy data frame
ex_df_1 <- tibble(
  colA = paste0("=", sample(50, size = 20)),
  colB = paste0(sample(letters, size = 20), "=", sample(50, size = 20))
)

ex_df_2 <- tibble(
  colA = paste0("=", sample(50, size = 20)),
  colB = paste0(sample(letters, size = 20), "=", sample(50, size = 20))
)

ex_df_list <- list(ex1 = ex_df_1, ex2 = ex_df_2)


### Start coding here!
