#### Preamble ####
# purpose: hard to do data science without data!!!
# Author: Finn Korol
# Date: 20 April 2023
# Contact: finn.korol@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulation, 02-data_cleaning
# for this analysis all the files are stored as txt for easy access of text strings

# Download the webpage content and remove HTML tags
#install.packages('rvest')
library(rvest)
library(xml2)
library(pdftools)

#scraping and downloading
#starting with canada page
info_can_webpage <- read_html("https://www.canada.ca/en/health-canada/services/substance-use/supervised-consumption-sites/explained.html")
info_can_text <- html_text(info_can_webpage)
writeLines(info_can_text, "inputs/data/can.txt")


law_can_webpage <- read_html("https://www.canada.ca/en/health-canada/services/health-concerns/controlled-substances-precursor-chemicals/policy-regulations/policy-documents/subsection-56-1-class-exemption-urgent-public-health-needs-sites-provinces-territories.html")
law_can_text <- html_text(law_can_webpage)
writeLines(law_can_text, "inputs/data/can2.txt")

#ontario page is a pdf
# Download and extract the text from the PDF file and combine all the pages into a single character string
pol_on_text <- pdf_text("https://health.gov.on.ca/en/pro/programs/opioids/docs/CTS_application_guide_en.pdf") |>
  paste(collapse = " ")
writeLines(pol_on_text, "inputs/data/on.txt")

#toronto pages
info_tor_webpage <- read_html("https://www.toronto.ca/news/toronto-public-health-submits-application-to-continue-providing-supervised-injection-and-treatment-services/")
info_tor_text <- html_text(info_tor_webpage)
writeLines(info_tor_text, "inputs/data/tor1.txt")

info2_tor_webpage <- read_html("https://www.toronto.ca/community-people/health-wellness-care/health-programs-advice/supervised-injection-services/")
info2_tor_text <- html_text(info2_tor_webpage)
writeLines(info2_tor_text, "inputs/data/tor2.txt")

info3_tor_webpage <- read_html("https://www.toronto.ca/community-people/health-wellness-care/health-programs-advice/supervised-injection-services/")
info3_tor_text  <- html_text(info3_tor_webpage)
writeLines(info3_tor_text, "inputs/data/tor3.txt")



         