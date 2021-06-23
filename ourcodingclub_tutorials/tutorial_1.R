# Coding Club Workshop 1 - R Basics
# Learning how to import and explore data, and make graphs about Edinburgh's biodiversity
# Written by Gergana Daskalova 06/11/2016 University of Edinburgh
install.packages("dplyr")
library(dplyr)
# Note that there are quotation marks when installing a package, but not when loading it
# and remember that hashtags let you add useful notes to your code! 
edidiv <- read.csv("C:/Users/marti/Documents/RStudio_Practice/ourcodingclub_tutorials/CC-RBasics-master/CC-RBasics-master/edidiv.csv")

head(edidiv) #Displays the firts few rows
tail(edidiv) #Displays the last few rows
str(edidiv) #Tells you whether the variables are continuous, integers, categorical or characters

head(edidiv$taxonGroup)     # Displays the first few rows of this column only
class(edidiv$taxonGroup)    # Tells you what type of variable we're dealing with: it's character now but we want it to be a factor

edidiv$taxonGroup <- as.factor(edidiv$taxonGroup)     # turns whatever vaues into a factor

# More exploration
dim(edidiv)                 # Displays number of rows and columns
summary(edidiv)             # Gives you a summary of the data
summary(edidiv$taxonGroup)  # Gives you a summary of that particular variable (column) in your dataset

# CALCULATING SPECIES RICHNESS

Beetle <- filter(edidiv, taxonGroup == "Beetle")
# The first argument of the function is the data frame, the second argument is the condition you want to filter on. Because we only want the beetles here, we say: the variable taxonGroup MUST BE EXACTLY (==) Beetle - drop everything else from the dataset. (R is case-sensitive so it's important to watch your spelling! "beetle" or "Beetles" would not have worked here.)

Bird <- filter(edidiv, taxonGroup == "Bird")   # We do the same with birds. It's very similar to filtering in Excel if you are used to it.
# You can create the objects for the remaining taxa. If you need to remind yourself of the names and spellings, type summary(edidiv$taxonGroup)

Butterfly <- filter(edidiv, taxonGroup == "Butterfly")
Dragonfly <- filter(edidiv, taxonGroup == "Dragonfly")
Flowers <- filter(edidiv, taxonGroup == "Flowering.Plants")
Fungus <- filter(edidiv, taxonGroup == "Fungus")
Hymenopteran <- filter(edidiv, taxonGroup == "Hymenopteran")
Lichen <- filter(edidiv, taxonGroup == "Lichen")
Liverwort <- filter(edidiv, taxonGroup == "Liverwort")
Mammal <- filter(edidiv, taxonGroup == "Mammal")
Mollusc <- filter(edidiv, taxonGroup == "Mollusc")

a <- length(unique(Beetle$taxonName))
b <- length(unique(Bird$taxonName))
c <- length(unique(Butterfly$taxonName))
d <- length(unique(Dragonfly$taxonName))
e <- length(unique(Flowers$taxonName))
f <- length(unique(Fungus$taxonName))
g <- length(unique(Hymenopteran$taxonName))
h <- length(unique(Lichen$taxonName))
i <- length(unique(Liverwort$taxonName))
j <- length(unique(Mammal$taxonName))
k <- length(unique(Mollusc$taxonName))

# CREATING A VECTOR AND PLOTTING IT

biodiv <- c(a,b,c,d,e,f,g,h,i,j,k)     # We are chaining together all the values; pay attention to the object names you have calculated and their order
names(biodiv) <- c("Beetle",
                   "Bird",
                   "Butterfly",
                   "Dragonfly",
                   "Flowering.Plants",
                   "Fungus",
                   "Hymenopteran",
                   "Lichen",
                   "Liverwort",
                   "Mammal",
                   "Mollusc")
barplot(biodiv, xlab = "Taxon", ylab = "Number", ylim = c(0,600),cex.names = 0.8, cex.axis = 1.0, cex.lab = 1.2)

# CREATING A DATAFRAME AND PLOTTING IT

# Creating an object called "taxa" that contains all the taxa names
taxa <- c("Beetle",
          "Bird",
          "Butterfly",
          "Dragonfly",
          "Flowering.Plants",
          "Fungus",
          "Hymenopteran",
          "Lichen",
          "Liverwort",
          "Mammal",
          "Mollusc")
# Turning this object into a factor, i.e. a categorical variable
taxa_f <- factor(taxa)

# Combining all the values for the number of species in an object called richness
richness <- c(a,b,c,d,e,f,g,h,i,j,k)

# Creating the data frame from the two vectors
biodata <- data.frame(taxa_f, richness)

# Saving the file
write.csv(biodata, file="biodata.csv")  # it will be saved in your working directory

png("barplot2.png", width=1600, height=600)
barplot(biodata$richness, names.arg=c("Beetle",
                                      "Bird",
                                      "Butterfly",
                                      "Dragonfly",
                                      "Flowering.Plants",
                                      "Fungus",
                                      "Hymenopteran",
                                      "Lichen",
                                      "Liverwort",
                                      "Mammal",
                                      "Mollusc"),
        xlab="Taxa", ylab="Number of species", ylim=c(0,600))
dev.off()


# Extra Challenge
# produce a bar plot of the mean wingspan for each species and save it to your computer

sparrow <- mean(22,24,21)
kingfisher <- mean(26,23,25)
eagle <- mean(195,201,185)
hummingbird <- mean(8,9,9)

# chain them together in a vector
wingspan <- c(sparrow, kingfisher, eagle, hummingbird)

#create a bird species vector
bird_sp <- c("sparrow","kingfisher","eagle","hummingbird")

# make bird_sp a factor
class(bird_sp) #currently character
bird_sp <- as.factor(bird_sp) #transforming into factor
class(bird_sp)

#combine the two vectors into a dataframe
wings <- data.frame(bird_sp,wingspan)

#plot
png("occ_t1_extrachallenge.png", width = 800, height= 600)

barplot(wings$wingspan, names.arg = wings$bird_sp,    # notice how we call the bird_sp column instead of typing all the names
        xlab = "Bird species", 
        ylab = "Average wingspan (cm)",               # adding axis titles
        ylim = c(0, 200),                             # setting the limits of the y axis to fit the eagle
        col = "gold"                                  # changing the colour because why not!
)
dev.off()

