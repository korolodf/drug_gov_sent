#### Preamble ####
# Purpose: Always clean your data :)
# Author: Finn Korol
# Date: 20 April 2023
# Contact: finn.korol@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulation, 01-download_data
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(xml2)
library(rvest)
library(tm)

#### Clean data ####

#to remove bad characters, begin and end string around meaningful content (determined based on inspection)
#starting w/ the canadian gov files
info_can_text <- paste(readLines("inputs/data/can.txt"), collapse="\n")
info_can_text_reduced <- gsub(".*(Supervised consumption services save.*matterEnd the stigma).*", "\\1", info_can_text)
info_can_text_reduced <- gsub("\\\r\n","",info_can_text_reduced)
info_can_text_reduced <- gsub("(?<=[a-z])(?=[A-Z])", ". ", info_can_text_reduced, perl=TRUE)
info_can_text_reduced <- gsub("      ",". ",info_can_text_reduced)

law_can_text <- paste(readLines("inputs/data/can2.txt"), collapse="\n")
law_can_text_reduced <- gsub(".*(Definitions.*September 30, 2025.).*", "\\1", law_can_text)
law_can_text_reduced <- gsub("\\\r\n","", law_can_text_reduced)
law_can_text_reduced <- gsub("(?<=[a-z])(?=[A-Z])", ". ", law_can_text_reduced, perl=TRUE)
law_can_text_reduced <- gsub("      ",". ", law_can_text_reduced)

#combining canadian files and writing while removing punctuation and numbers
can_str <- paste(info_can_text_reduced, law_can_text_reduced) |>
  removePunctuation() |>
  removeNumbers()
writeLines(can_str, "inputs/data/can_clean.txt")


#cleaning data from pdf from province on receiving funding
pol_on_text <- paste(readLines("inputs/data/on.txt"), collapse="\n")
pol_on_text_reduced <- gsub("[^[:alnum:][:punct:]\\s]", " ", pol_on_text)
pol_on_text_reduced <- gsub(".*(In October 2018,.*provide wrap-around services.).*", "\\1", pol_on_text_reduced)
pol_on_text_reduced <- gsub(" o ", " ", pol_on_text_reduced)
pol_on_text_reduced <- gsub("            ", " ", pol_on_text_reduced) #all these spaces don't need to be removed as it is handled in tokenization but it doesn't hurt and makes it easier to read on inspection
pol_on_text_reduced <- gsub("           ", " ", pol_on_text_reduced)
pol_on_text_reduced <- gsub("        ", " ", pol_on_text_reduced)
pol_on_text_reduced <- gsub("       ", " ", pol_on_text_reduced)
pol_on_text_reduced <- gsub("    ", " ", pol_on_text_reduced)
pol_on_text_reduced <- gsub("   ", " ", pol_on_text_reduced)

on_str <- pol_on_text_reduced |>
  removePunctuation() |>
  removeNumbers()

writeLines(on_str, "inputs/data/on_clean.txt")


#now moving on to toronto files
info_tor_text <- paste(readLines("inputs/data/tor1.txt"), collapse="\n")
info_tor_text_reduced <- sub(".*Toronto Public Health \\(TPH\\)(.*or on Facebook).*", "\\1", info_tor_text)
smoosh <- "Toronto Public Health (TPH)"
info_tor_text_reduced <- paste(smoosh, info_tor_text_reduced)
#info_tor_text_reduced <- gsub(".*(Toronto Public Health (TPH).*or on Facebook).*", "\\1", pol_on_text_reduced)
info_tor_text_reduced <- gsub("\\b\n\\b", "", info_tor_text_reduced)
info_tor_text_reduced <- gsub("\\b\t\\b", "", info_tor_text_reduced)
info_tor_text_reduced <- gsub("[^[:alnum:][:punct:]\\s]", " ", info_tor_text_reduced)

info2_tor_text <- paste(readLines("inputs/data/tor2.txt"), collapse="\n")
info2_tor_text_reduced <- gsub(".*(Toronto Public Health opened.*use in the local community).*", "\\1", info2_tor_text)
info2_tor_text_reduced <- gsub("\\b\n\\b", "", info2_tor_text_reduced)
info2_tor_text_reduced <- gsub("\n", "", info2_tor_text_reduced)
info2_tor_text_reduced <- gsub(" \n ", " ", info2_tor_text_reduced)

info3_tor_text <- paste(readLines("inputs/data/tor3.txt"), collapse="\n")
info3_tor_text_reduced <- gsub(".*(This page contains reports .*/Infection Control Program).*", "\\1", info3_tor_text)
info3_tor_text_reduced <- gsub("\n", "", info3_tor_text_reduced)
info3_tor_text_reduced <- gsub(" \n ", " ", info3_tor_text_reduced)
info3_tor_text_reduced <- gsub("\t", "", info3_tor_text_reduced)
info3_tor_text_reduced <- gsub(".*(Toronto Public Health opened.*drug use in the local community).*", "\\1", info3_tor_text_reduced)

tor_str <- paste(info_tor_text_reduced, info2_tor_text_reduced)
tor_str <- paste(tor_str, info3_tor_text_reduced) |>
  removePunctuation() |>
  removeNumbers()

writeLines(tor_str, "inputs/data/tor_clean.txt")

