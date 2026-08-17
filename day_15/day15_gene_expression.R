# ==========================================
# R Learning - Day 15
# Gene Expression Data Analysis
# Author: Masha Srinivasan
# ==========================================

library(dplyr)
library(ggplot2)


# ------------------------------------------
# 1. Import gene expression data
# ------------------------------------------

expression_data <- read.csv(
  "gene_expression.csv"
)

cat("\nGene Expression Dataset:\n")
print(expression_data)


# ------------------------------------------
# 2. Inspect dataset
# ------------------------------------------

cat("\nDataset dimensions:\n")
print(dim(expression_data))

cat("\nColumn names:\n")
print(names(expression_data))

cat("\nDataset structure:\n")
str(expression_data)


# ------------------------------------------
# 3. Calculate mean expression
# ------------------------------------------

expression_data <- expression_data %>%
  mutate(
    Control_Mean = (Control + Control_2) / 2,
    Treatment_Mean = (Treatment + Treatment_2) / 2
  )

cat("\nMean expression values:\n")
print(expression_data)


# ------------------------------------------
# 4. Calculate fold change
# ------------------------------------------

expression_data <- expression_data %>%
  mutate(
    Fold_Change = Treatment_Mean / Control_Mean
  )

cat("\nFold change:\n")
print(
  expression_data %>%
    select(Gene, Fold_Change)
)


# ------------------------------------------
# 5. Calculate log2 fold change
# ------------------------------------------

expression_data <- expression_data %>%
  mutate(
    Log2_Fold_Change = log2(Fold_Change)
  )

cat("\nLog2 fold change:\n")
print(
  expression_data %>%
    select(Gene, Log2_Fold_Change)
)


# ------------------------------------------
# 6. Classify gene expression
# ------------------------------------------

expression_data <- expression_data %>%
  mutate(
    Regulation = case_when(
      Log2_Fold_Change >= 1 ~ "Upregulated",
      Log2_Fold_Change <= -1 ~ "Downregulated",
      TRUE ~ "No major change"
    )
  )

cat("\nGene regulation status:\n")
print(
  expression_data %>%
    select(
      Gene,
      Log2_Fold_Change,
      Regulation
    )
)


# ------------------------------------------
# 7. Find highly expressed genes
# ------------------------------------------

high_expression <- expression_data %>%
  filter(Treatment_Mean > 30)

cat("\nHighly expressed genes:\n")
print(high_expression)


# ------------------------------------------
# 8. Find upregulated genes
# ------------------------------------------

upregulated_genes <- expression_data %>%
  filter(Log2_Fold_Change >= 1)

cat("\nUpregulated genes:\n")
print(upregulated_genes)


# ------------------------------------------
# 9. Sort genes by fold change
# ------------------------------------------

sorted_genes <- expression_data %>%
  arrange(desc(Log2_Fold_Change))

cat("\nGenes sorted by log2 fold change:\n")
print(
  sorted_genes %>%
    select(
      Gene,
      Log2_Fold_Change,
      Regulation
    )
)


# ------------------------------------------
# 10. Create expression plot
# ------------------------------------------

ggplot(
  expression_data,
  aes(
    x = Gene,
    y = Treatment_Mean
  )
) +
  geom_col() +
  labs(
    title = "Gene Expression Under Treatment",
    x = "Gene",
    y = "Mean Expression"
  ) +
  theme_minimal()


# ------------------------------------------
# 11. Save processed dataset
# ------------------------------------------

write.csv(
  expression_data,
  "day15_processed_expression.csv",
  row.names = FALSE
)

cat(
  "\nProcessed gene-expression data saved successfully.\n"
)
