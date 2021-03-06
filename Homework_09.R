# ---------------------------
# Homework 9
# 07 Apr 21
# MJD
# ---------------------------

# preliminaries ------------------------------
library(tidyr)
library(ggplot2)
################################


#-----------------------------------------
# FUNCTION FakeData
# description: makes a hypothetical data set for tadpoles (homozygotes & hterozygotes)
# inputs: mean
#         sample size
#         standard deviation
# outputs: a dataframe of homozygote and heterozygote viral load
##############################


fakeData <- function(meanHomo=6000, sampleSize=40, sdHomo=1000,meanHet = 3000, sdHet=1000){
  
 homozygote1 <- rnorm(n=sampleSize,meanHomo,sdHomo)
 heterozygote1 <- rnorm(n=sampleSize,meanHet,sdHet)
 
 df <- data.frame(homozygote1, heterozygote1)
 df2 <- gather(df,group,virus)
 
  return(df2)
  
} # end of FakeData
#-----------------------------------------
df1 <- fakeData()

#-----------------------------------------
# FUNCTION ANOVA
# description: Make an anova with the fake data
# inputs: df2 
# outputs: p value
##############################

ANOVA <- function(data=df1){
  
  anova <- n(virus~group, data)
  
  return(cat("P = ", summary(anova)[[1]][["Pr(>F)"]][1]))
  
} # end of ANOVA
#-----------------------------------------
new_anova <- ANOVA()


#-----------------------------------------
# FUNCTION boxPlot
# description: make a barPlot from data frame
# inputs: anova
# outputs: bar plot
##############################

boxPlot <- function(data=df1){
  
  p1 <- ggplot(data, mapping=aes(x=group,y=virus, fill=group)) + 
    geom_boxplot() + 
    scale_fill_manual(values=c("olivedrab3", "#E69F00"),labels=c("Heterozygotes", "Homozygotes"))+
    labs(title="Expected Results", x ="", y = "Viral Load",fill="") +
    scale_x_discrete(labels=c("Heterozygotes", "Homozygotes"))
    
              
                        
  
  return(p1)
  
} # end of barPlot
#-----------------------------------------
boxPlot()


  
  

# Modified Data ------------------------------


#-----------------------------------------
# FUNCTION FakeData2
# description: makes a hypothetical data set for FST and Time to Death
# inputs: mean
#         sample size
#         standard deviation
# outputs: 
##############################
fakeData2 <- function(meanHomo=6000, sampleSize=40, sdHomo=1000,meanHet = 3000, sdHet=1000){
  
  homozygote1 <- rnorm(n=sampleSize,meanHomo,sdHomo)
  heterozygote1 <- rnorm(n=sampleSize,meanHet,sdHet)
  
  df <- data.frame(homozygote1, heterozygote1)
  df2 <- gather(df,group,virus)
  
  
  FST <- c(rbeta(n=sampleSize, shape1=2, shape2=5), rbeta(n=sampleSize, shape1=5, shape2=2))
  TimeToDeath <- c(sample(5:13,size=40, replace=TRUE),sample(11:21, size=40,replace=TRUE))
  
  df3 <- data.frame(group=df2$group, FST, TimeToDeath)
  
  return(df3)
}
df3 <- fakeData2() 

#-----------------------------------------
# FUNCTION myHist
# description: make a histogram from data frame 3 with FST and Time to death
# inputs: df3 
# outputs: histogram
##############################

myScat <- function(data=df3){
  
  p1 <- ggplot(data, aes(x=TimeToDeath,y=FST,  color=group)) + 
    geom_point(size=3,shape=20) + 
    geom_smooth(method=lm, color="cyan4") + 
    labs(title="Expected Results", x ="Time To Death", y = "Genetic Differentiation",color="") +
   scale_color_manual(values=c("olivedrab3", "#E69F00"),labels=c("Heterozygote", "Homozygote"))

  
 #  groupColors=c("aquamarine","darkseagreen3")
  return(p1)
  
} # end of barPlot
#-----------------------------------------
myScat()


                      