# ---------------------------
# homework 8 script
# 31 Mar 21
# MJD
# ---------------------------
# homozygous tadpoles - higher viral load
# heterozygous tadpoles - lower viral load
library(tidyr)
library(ggplot2)

sampleSize <- 1:2

# random normal data for homzygous
homozygous <- rnorm(n=sampleSize, mean = 10000, sd =500)
homozygous 

# random normal data for heterozygous
heterozygous <- rnorm(n=sampleSize, mean = 3000, sd = 500)


df <- data.frame(homozygous, heterozygous)
df

# making a data frame
df2 <- gather(df,group,virus)
df2

# statistical analysis
anova <- aov(virus~group, data=df2)
summary(anova)


p1 <- ggplot(data=df2, mapping=aes(x=group, y=virus, fill=group)) +
               geom_boxplot() 
             p1

# group <- c(homozygous,heterozygous)
# names <- c(rep("homo", 40), rep("hetero", 40))
# 
# newDF <- data.frame(colnames=group, rownames=names)
# newDF
