
# Load packages
library(tidyverse)

# Example of looking at a function
select()
mean()
filter()

# Using body() to inspect a function
body(select)


# First example function

tri_area <- function(height, base) {
  height * base / 2
}

tri_area(height = 2, base = 3)


tri_area2 <- function(height, base) {
  x <- height * base / 2
  return(x)
}
tri_area2(2, 3)


# Challenge 1
# Write a function that takes height, width, and depth, and calculates volume of
# a rectangular prism

vol_rect <- function(height, width, depth) {
  vol <- height * width * depth
  return(vol)
}
vol_rect(2, 3, 4)


# Example of print debugging
debug_ex <- function(height, base) {
  print(height)
  height * base / 2
}

debug_ex(4, 5)


# Example of tidy evaluation
data("mtcars")
mtcars


# Normal ggplot2 call:
ggplot(mtcars, aes(cyl, mpg)) +
  geom_point()

multi_graph <- function(cx, cy) {
  ggplot(mtcars, aes(cx, cy)) +
    geom_point()
}

multi_graph(disp, mpg)


# Fixing our tidyeval problem
multi_graph_2 <- function(cx, cy) {
  ggplot(mtcars, aes({{cx}}, {{cy}})) +
    geom_point()
}

multi_graph_2(disp, mpg)


# Challenge 2
# Create a function that:
#   Will plot a graph of any column in the mtcars dataset
#   Saves the box plot under any name given (hint: use ggsave())

my_plot_function1 <- function(col1, col2, filename) {
  ggplot(mtcars, aes({{col1}}, {{col2}}, group = {{col1}})) +
    geom_boxplot()
  ggsave(filename)
}

my_plot_function1(carb, mpg, "plot1.png")


my_plot_function2 <- function(col1, col2, filename) {
  theplot <- ggplot(mtcars, aes({{col1}}, {{col2}}, group = {{col1}})) +
    geom_boxplot()
  return(theplot)
  ggsave(plot = theplot, filename)
}

my_plot_function2(carb, mpg, "mtcars_carb_mpg.png")
