# An introduction to git, Github, and RStudio integration


### Requirements for this lesson:
- A Github account, available for free [here]()
- Git installed on your computer
	- Installing git for [Windows]()
	- Installing git for [Mac]()


## Creating a repository
- To get started, head over to [github.com](github.com) and sign in to your account
- Use the "+" symbol at the top right, then select "New repository" from the list
- On this page, you need to set up a few things:
	- Provide a unique name for your repository
	- Keep the repository set to public
	- Check the box to add a README file
	- Add a "gitignore" file, and use the dropdown to select the R preset
	- No license
- Try editing the README directly on Github by adding a few new lines


## Get our repository into RStudio
- Use the green "Code" button on the right side, then copy the URL provided in the box
- Open RStudio
- Use the "File" menu to create a new project, then select the following options as presented:
	- Version Control
	- Git
	- Paste in the URL
	- Choose a folder to keep your project in (e.g. Desktop), and hit "Create"


## Exploring git in RStudio
- Notice in the pane window in the lower right, we now have a "Git" pane - try clicking on it, and familiarize yourself with it
- Here you'll see any new, edited, or deleted files that git can see
- Try opening the README file, and add another new line
- The README will now appear as modified in the Git pane
- Hit the commit button inside the Git pane to open RStudio's git window


## Making a commit and pushing
- In the top left portion, you'll see the list of new or edited files
	- There should be the README and ".Rproj" file
	- When you select a file, it's "diff" (changes made) are displayed in the large lower pane
- To the left of each file, the "Staged" column indicates if a file will be included in the next commit
- Check the box next to each listed file to add (or stage) it to the next commit
- In the "Commit message" box, type in a nice descriptive message to go with our changes
	- You should now see a message that states "You're ahead of origin/master by 1 commit"
	- This means we have a change locally, that is not yet on the remote (Github)
- In the top right of the window, hit the "Push" button to send our new changes to Github
	- On github.com you should be able to see our new changes made in RStudio on our online repository


## Editing on github and pulling changes
- Since we're already on Github, let's try making another change in the README
- Then switch back to RStudio, and check out the git pane
	- Notice that it doesn't tell us we're behind by a commit
	- Hence it's a good idea to always pull before beginning to work locally
- Use the blue down arrow in the Git pane to pull down the change from Github to our local repo


## Adding some R code
- Before we continue, make a new R script, and add some simple code like below
```r
library(tidyverse)

ggplot(mtcars, aes(cyl, mpg)) +
	geom_point()

ggsave("plot1.png")
```
- Then save the file as "script1.R"
- Use the git pane/window to add, commit, and push the new files


## Creating a new branch
- In the git pane, look for the button with purple boxes, next to "main" (which is our current branch)
- Click it, and name the new branch "branch2"
	- Leave the other options at their default
- Create another new script, and add the following code:

```r
library(tidyverse)

ggplot(mtcars, aes(disp, mpg)) +
	geom_point()

ggsave("plot2.png")
```

- Save this as "script2.R", and add, commit, and push the changes
- On github, you can use the dropdown to switch between the branches and see the extra files in the new branch
- You can do the same locally, by selecting "branch2" in the upper right corner of the git pane and switching to the main branch


## Pull requests and merges
- On Github, you should see a green button which says "Compare and pull request"; click it to get started
- There's a lot to unpack here, so let's look at a few things in particular
  - Near the top, we can see we merging the branches like "master <- branch2  v Able to merge"
  - Below that, it will list all the commits that are being pulled into the main branch
  - You can also browse the "Files Changed" tab to see what files have been added/removed/edited
- Now click the green button to create the pull request, then merge and confirm
- Back in RStudio, switch to the master branch using the git pane, then pull to bring down the merge we made on Github
