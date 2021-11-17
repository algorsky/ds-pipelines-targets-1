This is a template repo for coursework on pipelines using the targets package

# How to run the code

```r
library(dplyr)
library(readr)
library(stringr)
library(sbtools)
library(whisker)

#put in the read me file
#Call fetch_data
source("1_fetch/src/fetch_data.R")
#Get the data
mendota_file<- fetch_data('1_fetch/out/model_RMSEs.csv', '5d925066e4b0c4f70d0d0599', 'me_RMSE.csv')

#call process_data
source("2_process/src/process_data.R")
#Add colors to data
eval_data<- add_colors_to_data(file_in = mendota_file)

#Call visualize_data
source("3_visualize/src/visualize_data.R")
#Plot data
plot_results<- plot_data(file_name = '3_visualize/out/', eval_data = eval_data)

```