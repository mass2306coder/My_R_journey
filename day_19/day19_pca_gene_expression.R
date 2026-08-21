# ==========================================
# R Learning - Day 19
# Principal Component Analysis of
# Gene Expression Data
# ==========================================


# ------------------------------------------
# 1. Import data
# ------------------------------------------

expression_data <- read.csv(
  "gene_expression_day19.csv"
)

cat("\nGene Expression Dataset:\n")
print(expression_data)


# ------------------------------------------
# 2. Extract gene names
# ------------------------------------------

gene_names <- expression_data$Gene


# ------------------------------------------
# 3. Create expression matrix
# ------------------------------------------

expression_matrix <- expression_data[, -1]

rownames(expression_matrix) <- gene_names


# ------------------------------------------
# 4. Transpose the matrix
# ------------------------------------------

sample_matrix <- t(expression_matrix)

cat("\nSample Expression Matrix:\n")
print(sample_matrix)


# ------------------------------------------
# 5. Perform PCA
# ------------------------------------------

pca_result <- prcomp(
  sample_matrix,
  scale. = TRUE
)


# ------------------------------------------
# 6. PCA summary
# ------------------------------------------

cat("\nPCA Summary:\n")
print(summary(pca_result))


# ------------------------------------------
# 7. Calculate variance explained
# ------------------------------------------

variance_explained <- (
  pca_result$sdev^2 /
  sum(pca_result$sdev^2)
) * 100

cat("\nVariance Explained (%):\n")
print(round(variance_explained, 2))


# ------------------------------------------
# 8. Create PCA score dataframe
# ------------------------------------------

pca_scores <- as.data.frame(
  pca_result$x
)

pca_scores$Sample <- rownames(
  pca_scores
)


# ------------------------------------------
# 9. Assign experimental condition
# ------------------------------------------

pca_scores$Condition <- c(
  "Control",
  "Control",
  "Control",
  "Treatment",
  "Treatment",
  "Treatment"
)


cat("\nPCA Scores:\n")
print(pca_scores)


# ------------------------------------------
# 10. Save PCA results
# ------------------------------------------

write.csv(
  pca_scores,
  "day19_pca_scores.csv",
  row.names = FALSE
)


# ------------------------------------------
# 11. Create PCA plot
# ------------------------------------------

plot(
  pca_scores$PC1,
  pca_scores$PC2,

  xlab = paste0(
    "PC1 (",
    round(variance_explained[1], 1),
    "%)"
  ),

  ylab = paste0(
    "PC2 (",
    round(variance_explained[2], 1),
    "%)"
  ),

  main = "PCA of Gene Expression Data",

  pch = 19,

  col = ifelse(
    pca_scores$Condition == "Control",
    "blue",
    "red"
  )
)


# ------------------------------------------
# 12. Add sample labels
# ------------------------------------------

text(
  pca_scores$PC1,
  pca_scores$PC2,
  labels = pca_scores$Sample,
  pos = 3,
  cex = 0.8
)


# ------------------------------------------
# 13. Save PCA plot
# ------------------------------------------

pdf(
  "day19_pca_plot.pdf",
  width = 10,
  height = 8
)

plot(
  pca_scores$PC1,
  pca_scores$PC2,

  xlab = paste0(
    "PC1 (",
    round(variance_explained[1], 1),
    "%)"
  ),

  ylab = paste0(
    "PC2 (",
    round(variance_explained[2], 1),
    "%)"
  ),

  main = "PCA of Gene Expression Data",

  pch = 19,

  col = ifelse(
    pca_scores$Condition == "Control",
    "blue",
    "red"
  )
)

text(
  pca_scores$PC1,
  pca_scores$PC2,
  labels = pca_scores$Sample,
  pos = 3,
  cex = 0.8
)

legend(
  "topright",
  legend = c("Control", "Treatment"),
  col = c("blue", "red"),
  pch = 19
)

dev.off()


cat(
  "\nPCA analysis completed successfully.\n"
)
