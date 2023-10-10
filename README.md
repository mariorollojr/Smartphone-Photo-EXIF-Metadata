# Smartphone-Photo-EXIF-Metadata

This repo contains an R script designed to extract EXIF metadata from smartphone photos with a ".jpeg" file extension and perform various tasks, including:

- Loading necessary libraries for EXIF data extraction, data manipulation, and interactive map creation;
- 
- Listing all ".jpeg" files in the current directory;
- 
- Extracting EXIF data from the selected image files and storing it in a data frame;
- 
- Selecting specific columns of interest, such as SourceFile, DateTimeOriginal, GPSLongitude, and GPSLatitude;
- 
- Writing the selected EXIF data to a CSV file named 'Exifdata.csv' without including row names;
- 
- Creating a scatter plot of GPS coordinates using longitude and latitude;
- 
- Generating an interactive leaflet map with markers indicating GPS coordinates on the map, using map tiles from Esri.WorldImagery.

This script is a useful tool for analyzing and visualizing the metadata associated with smartphone photos. It can be used for various purposes, including geospatial analysis and understanding the properties of captured images.
