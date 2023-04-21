#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Data: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
#The desired data will be 3 character string variables each containing all the text from their respective level of government's webscraped sites containing only words (i.e no punctuation or numbers).  
#There will be words in common between these strings but they should have some variety
sample1 <- c("sphinx", "of", "black", "quartz", "judge", "my", "vow")
sample2 <- c("the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog")
sample3 <- c("pack", "my", "box", "with", "five", "dozen", "liquor", "jugs")
words <- c(sample1, sample2, sample3)

#### Simulate data ####
set.seed(111)
selected_words1 <- sample(words, 100, replace = TRUE)
can_sim <- paste(selected_words, collapse = " ")

set.seed(222)
selected_words <- sample(words, 100, replace = TRUE)
on_sim <- paste(selected_words, collapse = " ")

set.seed(333)
selected_words <- sample(words, 100, replace = TRUE)
tor_sim <- paste(selected_words, collapse = " ")

