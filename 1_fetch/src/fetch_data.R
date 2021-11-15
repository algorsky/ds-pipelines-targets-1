# Function to get the data from ScienceBase
fetch_data <- function(target_name, sb_id, sb_filename) {
  item_file_download(
    sb_id, 
    names = sb_filename, 
    destinations = target_name, 
    overwrite_file = TRUE)
}

