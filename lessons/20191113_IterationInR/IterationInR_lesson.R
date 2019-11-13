
# Load the tidyverse, which includes purrr
#install.packages("tidyverse")
library(tidyverse)


# Basic list to show some simple examples
practice_list <- list(a = 9,
                      b = 16,
                      c = 25)


# Load in gene data
treatment1 <- read.csv(paste0(
  "https://raw.githubusercontent.com/UBC-R-Study-group/studyGroup/gh-pages/",
  "lessons/20191113_IterationInR/genes_treatment1_vs_ctrl.csv"
))

treatment2 <- read.csv(paste0(
  "https://raw.githubusercontent.com/UBC-R-Study-group/studyGroup/gh-pages/",
  "lessons/20191113_IterationInR/genes_treatment2_vs_ctrl.csv"
))

# Set up dummy data frames
ex_df_1 <- tibble(
  colA = paste0("=", sample(50, size = 20)),
  colB = paste0(sample(letters, size = 20), "=", sample(50, size = 20))
)

ex_df_2 <- tibble(
  colA = paste0("=", sample(50, size = 20)),
  colB = paste0(sample(letters, size = 20), "=", sample(50, size = 20))
)


### Start coding here!
