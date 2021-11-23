library(targets)
# Load functions needed by targets below
source("1_fetch/src/fetch_data.R")
source("2_process/src/process_data.R")
source("3_visualize/src/visualize_data.R")
tar_option_set(packages = c("tidyverse", "sbtools", "whisker"))

list(
  # Get the data from ScienceBase
  tar_target(
    model_RMSEs_csv,
    fetch_data(file_out = "1_fetch/out/model_RMSEs.csv", 
               sb_id = '5d925066e4b0c4f70d0d0599',
               sb_filename = 'me_RMSE.csv'),
    format = "file"
  ), 
  # Prepare the data for plotting
  tar_target(
    eval_data,
    add_colors_to_data(in_filepath = model_RMSEs_csv),
  ),
  # Create a plot
  tar_target(
    Temp_RMSEs_png,
    plot_data( eval_data = eval_data,
              file_out = '3_visualize/out/Temp_RMSEs.png'), 
    format = "file"
  ),
  # Save the processed data
  tar_target(
    model_summary_results_csv,
    save_csv(data_in = eval_data, 
              file_out = '2_process/out/model_summary_results.csv'), 
    format = "file"
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    generate_model_diagnostics(data_in = eval_data,
                               file_out = '2_process/out/model_diagnostic_text.txt'), 
    format = "file"
  )
)
