# ==========================================
# R Learning - Day 18
# Gene Expression Correlation & Heatmap
# ==========================================

library(dplyr)
library(corrplot)


# ------------------------------------------
# 1. Import gene expression data
# ------------------------------------------

expression_data <- read.csv(
  "gene_expression_day18.csv"
)

cat("\nGene Expression Dataset:\n")
print(expression_data)


# ------------------------------------------
# 2. Separate gene names
# ------------------------------------------

gene_names <- expression_data$Gene


# ------------------------------------------
# 3. Remove Gene column
# ------------------------------------------

expression_matrix <- expression_data %>%
  select(-Gene)


# ------------------------------------------
# 4. Calculate correlation matrix
# ------------------------------------------

correlation_matrix <- cor(
  expression_matrix,
  method = "pearson"
)

cat("\nCorrelation Matrix:\n")
print(round(correlation_matrix, 2))


# ------------------------------------------
# 5. Save correlation matrix
# ------------------------------------------

write.csv(
  correlation_matrix,
  "day18_correlation_matrix.csv"
)


# ------------------------------------------
# 6. Create correlation heatmap
# ------------------------------------------

pdf(
  "day18_correlation_heatmap.pdf",
  width = 10,
  height = 8
)

corrplot(
  correlation_matrix,
  method = "color",
  type = "upper",
  addCoef.col = "black",
  tl.col = "black",
  tl.srt = 45,
  number.cex = 0.8,
  tl.cex = 0.9,
  mar = c(0, 0, 2, 0),
  title = "Gene Expression Correlation Heatmap"
)

dev.off()


# ------------------------------------------
# 7. Identify strong correlations
# ------------------------------------------

strong_correlations <- which(
  abs(correlation_matrix) >= 0.8 &
  abs(correlation_matrix) < 1,
  arr.ind = TRUE
)

cat("\nStrong correlations (|r| >= 0.8):\n")

if (nrow(strong_correlations) > 0) {

  for (i in seq_len(nrow(strong_correlations))) {

    row_index <- strong_correlations[i, 1]
    col_index <- strong_correlations[i, 2]

    cat(
      rownames(correlation_matrix)[row_index],
      "vs",
      colnames(correlation_matrix)[col_index],
      ":",
      round(
        correlation_matrix[row_index, col_index],
        3
      ),
      "\n"
    )
  }

} else {

  cat("No strong correlations found.\n")
}


# ------------------------------------------
# 8. Completion message
# ------------------------------------------

cat(
  "\nCorrelation analysis completed successfully.\n"
)
