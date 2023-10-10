# Title: Creating plots and maps of EXIF metadata from smartphone photos
# Author: Mario Rollo
# Date of last modification: 29.09.23

# Description: 
# This R script extracts EXIF metadata from smartphone photos with a ".jpeg" file extension, selects specific columns of interest, 
# and then performs the following tasks:

# 1. Loads necessary libraries, including exifr for extracting EXIF data, dplyr for data manipulation, and leaflet for creating interactive maps.
# 2. Lists all files in the current directory with the ".jpeg" file extension.
# 3.Extracts EXIF data from the selected image files and stores it in the 'dat' data frame.
# 4.Selects specific columns of interest (SourceFile, DateTimeOriginal, GPSLongitude, and GPSLatitude) from the 'dat' data frame and stores the result in 'dat2'.
# 5.Writes the selected EXIF data to a CSV file named 'Exifdata.csv' without including row names.
# 6. Creates a scatter plot of GPS coordinates using longitude and latitude from the 'dat' data frame.
# 7. Creates an interactive leaflet map using data from 'dat2' and adds map tiles from Esri.WorldImagery, along with markers indicating GPS coordinates on the map.


# Load necessary libraries
library(exifr)     # For extracting EXIF data from image files
library(dplyr)     # For data manipulation and filtering
library(leaflet)   # For creating interactive maps

# List all files in the current directory that have the ".JPG" file extension
files <- list.files(pattern = "*.jpeg")

# Extract EXIF data from the selected image files and store it in the 'dat' data frame
dat <- read_exif(files)

# Select specific columns of interest from the 'dat' data frame and store the result in 'dat2'
dat2 <- select(dat,
               SourceFile,         # File name of the image
               DateTimeOriginal,   # Date and time the image was taken
               GPSLongitude,       # Longitude information from GPS
               GPSLatitude)        # Latitude information from GPS
              
               
# Write the selected EXIF data to a CSV file named 'Exifdata.csv' without including row names
write.csv(dat2, 'Exifdata.csv', row.names = FALSE)
# Create a scatter plot of GPS coordinates using longitude and latitude from 'dat' data frame
plot(dat$GPSLongitude, dat$GPSLatitude)
               
# Create an interactive leaflet map using data from 'dat2' and add map tiles from Esri.WorldImagery
leaflet(dat2) %>%
addProviderTiles("Esri.WorldImagery") %>%
addMarkers(~ GPSLongitude, ~ GPSLatitude)  # Add markers to the map using GPS coordinates
               

