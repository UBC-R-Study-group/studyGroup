# Setup for the lesson
library(tidyverse)

practice_list <- list(a = 9, b = 16, c = 25)

simple_list_num <- list("first" = 1, "second" = 2, "third" = 3)
simple_list_name <- list("first", "second", "third")

# Load in gene data
treatment1 <- read_csv(
  "https://raw.githubusercontent.com/UBC-R-Study-group/studyGroup/gh-pages/lessons/20191113/genes_treatment1_vs_ctrl.csv"
)

treatment2 <- read_csv(
  "https://raw.githubusercontent.com/UBC-R-Study-group/studyGroup/gh-pages/lessons/20191113/genes_treatment2_vs_ctrl.csv"
)


# Let's get started!!

practice_list
names(practice_list)

practice_list[1]
class(practice_list[1])

practice_list[[1]]
class(practice_list[[1]])

practice_list$a
class(practice_list$a)

testlist <- list(first = "word")
testlist[1]

testlist[[1]]
class(testlist[[1]])

# Coding a for loop
for (i in practice_list) {
  print(i * 2)
}

# more complex formatted for loop
for (i in 1:length(practice_list)) {
  print("starting loop...")
  print(i)
  print(practice_list[[i]])
  print(practice_list[[i]] * 2)
}


# Saving the output of a for loop
output_list <- list()

for (i in 1:length(practice_list)) {
  output_list[i] <- sqrt( practice_list[[i]] )
}
output_list

names(output_list) <- names(practice_list)
output_list


# Starting with map
map(.x = practice_list, .f = sqrt)
output_list2 <- map(.x = practice_list, .f = sqrt)

map(practice_list, function(y) {
  sqrt(y)
})

practice_list %>% map(~sqrt(.x))


# map on a list of data frames
gene_list <- list(
  "treatment1" = treatment1,
  "treatment2" = treatment2 
)

glimpse(treatment1)
glimpse(gene_list)


gene_list_2 <- gene_list %>% map(
  ~select(.x, gene_id, log2FoldChange, padj) %>% 
    filter(padj < 0.01, abs(log2FoldChange) > log2(2))
)

glimpse(gene_list_2)


# Combining lists of data frames
glimpse(
  bind_rows(gene_list_2, .id = "treatment")
)

# splitting a data frame into a list of data frames
bound_dataframe <- bind_rows(gene_list_2, .id = "treatment")

glimpse(
  split(x = bound_dataframe, f = bound_dataframe$treatment)
)


# Using enframe on a named list
enframe(practice_list)
enframe(practice_list) %>% View()

enframe(practice_list) %>% mutate(value = as.numeric(value))

# Using map2
simple_list_name
simple_list_num

map2(
  simple_list_name,
  simple_list_num,
  ~paste0("The ", .x, " number is: ", .y)
)


# using imap
simple_list_num

imap(
  simple_list_num,
  ~paste0("The ", .y, " number is: ", .x)
)


