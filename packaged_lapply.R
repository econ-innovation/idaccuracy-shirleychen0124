#!/usr/bin/env Rscript

# 加载tidyverse包
library(tidyverse)

# 从命令行参数获取Aminer文件夹路径
aminer_folder_path <- commandArgs(trailingOnly = TRUE)[1]

# 获取文件夹中的所有CSV文件列表
csv_files <- list.files(aminer_folder_path, pattern = "\\.csv$", full.names = TRUE)

# 读取并合并所有CSV文件
merged_df <- bind_rows(lapply(csv_files, read_csv))

# 输出合并后的数据框
print(merged_df)

# 从命令行参数获取输出文件路径
#output_file_path <- commandArgs(trailingOnly = TRUE)[2]

# 可选：将合并后的数据保存为CSV文件
#write_csv(merged_df, output_file_path, na = "")
