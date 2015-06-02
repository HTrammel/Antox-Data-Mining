# --------------------------------
# Antox Data Mining
#
# Starting with csv extract for now
# Business questions:
# - are there any predictors around grape intoxication
#
# --------------------------------
require(dplyr)
require(tidyr)

source("myplclust.R")

# get the data
grapes <- read.table("./data/grapes.txt", header=T, sep = "|", na.strings = "")

# change vectors to characters
#grapes$finding <- as.character(grapes$finding)
#grapes$finding_status <- as.character(grapes$finding_status)

# create a new column with finding and status pasted together
#grapes$finding.status <- with(grapes, paste(finding, status, sep = "."))

# ag <- count(grapes, animal_group)
# fs <- count(grapes, finding.status)
# fnd <- count(grapes, finding)

#grapes <-transform(grapes, finding.status = factor(finding.status))

# cats <- subset(grapes, animal_group == "Feline Domestic")
# distanceMatrix <- dist(cats[,1:2])
# hclustering <- hclust(distanceMatrix)
# myplclust(hclustering, lab.col = unclass(cats$finding))

#dogs <- subset(grapes, anim_group == "Canine Domestic")
g <- grapes %>% group_by(anim_group) %>% count(finding) %>% top_n(50,n)

distanceMatrix <- dist(g[,1:2])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(dogs$finding))
