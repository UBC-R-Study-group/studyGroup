#install.packages("ggplot2")

library(ggplot2)

#get data
data(mpg, package = "ggplot2")

View(mpg)

# Lets make a scatter plot
# Adding your data, and begining aes
ggplot(data=mpg, aes(x=cty , y=hwy)) 

# Nothing was plotted. This is because we did not tell ggplot how to plot, 
# there are many different types of plotting, lets start with a scatterplot

ggplot(data=mpg, aes(x=cty , y=hwy)) + geom_point()
# These points are overlapping, lets add a jitter, his adds some noise to 
# a numeric vector 

ggplot(data=mpg, aes(x=cty , y=hwy)) + geom_jitter()

# Okay, so this tells us that there seems to be some kind of correlation between 
# the hwy millage and city millage, lets see if we can extract more information from 
# this plot by visuallizing more parameters
# Lets add some colour, we can colour by writing one colour ie "pink" but instead
# lets colour by the class of the car

ggplot(data=mpg, aes(x=cty , y=hwy, colour = class)) + geom_jitter() 

# Add the parameter of size
ggplot(data=mpg, aes(x=cty , y=hwy, colour = class,size = cyl)) +
  geom_jitter()


# Now let's remove the size aes but add a faccet:
# facet_ grid can take both rows and columns allowing you to facet by two
# different variables
ggplot(data=mpg, aes(x=cty , y=hwy, colour = class)) +
  geom_jitter()+ facet_grid(rows = vars(cyl))

# Let's make a different type of plot
# Let's visualize the highway milage for each class of car with a violin plot

ggplot(data = mpg, aes(class,hwy, colour = class)) + geom_violin()

# This is not the pretiest plot, so add some detail
ggplot(data = mpg, aes(class,hwy, colour = class, fill = class)) + geom_violin() +
  # stat summary adds a point at the stat summary specified,
  # y axis ie median, mode, mean etc. 
  stat_summary(fun.y = "median", geom = "point")

# We see no difference! This is because both the violin and the point are the same
# colour. We need to make the violin more transparent. 

# alpha is the aesthetic for transparency. It defaults to alpha = 1 which is fully 
# opaque. We will make it 0.4

ggplot(data = mpg, aes(class,hwy, colour = class, fill = class)) +
  geom_violin(alpha = 0.4) +
  stat_summary(fun.y = "median", geom = "point")

# This worked, but if we just wanted to make the stat_summary its own colour, we can 
# do that too! The list of ggplot2 colours is easily google-able, it can also accept
# hex codes and RGB
ggplot(data = mpg, aes(class,hwy, colour = class, fill = class)) +
  geom_violin(alpha = 0.4) +
  stat_summary(fun.y = "median", geom = "point", colour = "black")


#exercise #1 
#make a plot of the manufactuer v.s cty use any type of plot you would like

#exercise #2
#tell me which manufacturer has the highest mean hwy mileage 
#(by plotting the mean and looking at your plot)


