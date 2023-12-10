#install.packages('tidyverse')
# 加载tidyverse包
library(tidyverse)

# 设置Aminer文件夹路径
aminer_folder_path <- "/Users/shirleychen/RStudio4Shirley/assignment_idaccuracy/Aminer"

# 获取文件夹中的所有CSV文件列表
csv_files <- list.files(aminer_folder_path, pattern = "\\.csv$", full.names = TRUE)

# 读取并合并所有CSV文件,使用lapply
merged_df <- bind_rows(lapply(csv_files, read_csv))

# 输出合并后的数据框
print(merged_df)

# 将合并后的数据保存为CSV文件
write_csv(merged_df, "/Users/shirleychen/Documents/Learn-TJ-SICIP/A-博士课程/应用经济学-史冬波/merged_data.csv", na = "")

#使用for循环
# 初始化一个空数据框
merged_df1 <- data.frame()

# 使用for循环读取并合并所有CSV文件
for (csv_file in csv_files) {
  # 读取CSV文件
  df <- read_csv(csv_file)
  
  # 合并数据框
  merged_df1 <- bind_rows(merged_df1, df)
}

# 输出合并后的数据框
print(merged_df)

# 将合并后的数据保存为CSV文件
write_csv(merged_df, "/Users/shirleychen/Documents/Learn-TJ-SICIP/A-博士课程/应用经济学-史冬波/merged_data_1.csv", na = "")


# 提取所需的列，如DOI、发表年份、杂志和标题
selected_cols <- c("doi", "年份", "期刊", "标题")
result_df <- merged_df[, selected_cols, drop = FALSE]

# 输出提取后的数据框
print(result_df)

# 可选：将提取后的数据保存为CSV文件
write_csv(result_df, "/Users/shirleychen/Documents/Learn-TJ-SICIP/A-博士课程/应用经济学-史冬波/extracted_data.csv", na = "")
