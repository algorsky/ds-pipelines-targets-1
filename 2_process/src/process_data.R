# Function to prepare the data for plotting
add_colors_to_data <- function(fetch_data, col_types = "iccd") {
  fetch_data %>% 
    filter(str_detect(exper_id, 'similar_[0-9]+')) %>% 
    mutate(col = case_when(
      model_type == 'pb' ~ '#1b9e77',
      model_type == 'dl' ~'#d95f02',
      model_type == 'pgdl' ~ '#7570b3'
    ), pch = case_when(
      model_type == 'pb' ~ 21,
      model_type == 'dl' ~ 22,
      model_type == 'pgdl' ~ 23
    ), n_prof = as.numeric(str_extract(exper_id, '[0-9]+')))
}