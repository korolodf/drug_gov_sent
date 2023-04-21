#### Preamble ####
# Purpose: Tests on text data involving having cleaned out all non-meaningful characters
# Author: Finn Korol
# Date: 20 April 2023
# Contact: finn.korol@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulation, 02-data_cleaning, 01-download_data
# All cleaned files could be read in for these tests but I will be showing the... 
# ...using the can_clean.txt

can_str <- paste(readLines("inputs/data/can_clean.txt"), collapse="\n")
# is all the html removed?
test_html_tags <- function(can_str) {
  if (grepl("<[^>]+>", can_str)) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

# does the string contain words that should be in there?
(count <- str_count(can_str, "supervised consumption")) > 0
#check to make sure I haven't gotten rid of everything!!
test_empty_string <- function(can_str) {
  if (nchar(can_str) == 0) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

#any non-ASCIIs?
all(charToRaw(can_str) <= as.raw(127))

#any super long words?
all(nchar(strsplit(can_str, " ")[[1]]) >= 2 & nchar(strsplit(can_str, " ")[[1]]) <= 15)


