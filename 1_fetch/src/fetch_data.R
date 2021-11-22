# Function to get the data from ScienceBase
fetch_data <- function(file_out, sb_id, sb_filename) {
  item_file_download(
    sb_id, 
    names = sb_filename, 
    destinations = file_out, 
    overwrite_file = TRUE)
}

