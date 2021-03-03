# Homework 5 
# March 3, 2021
# Maddy Degelsmith
# ------------

x <- 1.1
a <- 2.2
b <- 3.3

z<-x^a^b
print(z)

z<- (x^a)^b
print(z)

z<- 3*(x^3)+2*(x^2)+1
print(z)

# use seq to create vector: (1,2,3,4,5,6,7,8,7,6,5,4,3,2,1)
vec_1 <- c(seq(from=1,to=8),seq(from=7,to=1,by=-1))
 print(vec_1) 

# use rep to create vector: (1,2,2,3,3,3,4,4,4,4,5,5,5,5,5)
vec_2 <- c(1,rep(2,2), rep(3,3),rep(4,4),rep(5,5))
print(vec_2)

# use rep to create vector: (5,4,4,3,3,3,2,2,2,2,1,1,1,1,1)
vec_3 <- c(rep(5,1),rep(4,2),rep(3,3),rep(2,4),rep(1,5))
print(vec_3)

# create vector of two random uniform numbers (x,y) and convert to polar coordinates (r,theta)
vec_4 <-c(runif(2))
print(vec_4)
r <- sqrt(vec_4[1]^2 + vec_4[2]^2)
print(r)
theta <- atan(vec_4[2]/vec_4[1])
print(theta)

# noah's ark, add serpent to queue
queue <- c("sheep", "fox", "owl", "ant")
print(queue)
new_queue <- append(queue,"serpent", after = length(queue))
print(new_queue)

# remove sheep from queue
new_queue <- new_queue[new_queue!="sheep"]
print(new_queue)

# donkey talking way to front of line
new_queue <- append(new_queue, "donkey", after=0)
print(new_queue)

# bye bye serpent
new_queue <- new_queue[new_queue!="serpent"]
print(new_queue)

# bye bye owl
new_queue <- new_queue[new_queue!="owl"]
print(new_queue)

new_queue <- append(new_queue, "aphid", after=3)
print(new_queue)

# where is the aphid in line?
match(c("aphid"),new_queue)

# vector of intergers from 1:100 that are not divisible by 2,3, or 7
vec_ints <- c(seq(1:100))
print(vec_ints)

new_vec <- c(vec_ints[vec_ints %%2 != 0 &
                      vec_ints %%3 != 0 &
                      vec_ints %%4 != 0 ]
                     ) 
print(new_vec)                          
                   