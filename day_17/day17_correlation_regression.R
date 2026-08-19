# Day 17 - Correlation and Linear Regression
# Bioinformatics R Learning Journey

# Gene expression dataset

gene_expression <- data.frame(
  Gene = paste0("Gene", 1:8),
  GeneA = c(12, 18, 25, 30, 22, 15, 35, 40),
  GeneB = c(15, 20, 28, 32, 24, 18, 37, 42)
)

print("Gene Expression Dataset:")
print(gene_expression)

# Pearson correlation

correlation <- cor(gene_expression$GeneA,
                   gene_expression$GeneB,
                   method = "pearson")

print("Pearson Correlation:")
print(correlation)

# Pearson correlation test

cor_test <- cor.test(
  gene_expression$GeneA,
  gene_expression$GeneB,
  method = "pearson"
)

print("Pearson Correlation Test:")
print(cor_test)

# Scatter plot of GeneA vs GeneB

plot(
  gene_expression$GeneA,
  gene_expression$GeneB,
  main = "GeneA vs GeneB Expression",
  xlab = "GeneA Expression",
  ylab = "GeneB Expression",
  pch = 19
)


# Simple Linear Regression

regression_model <- lm(GeneB ~ GeneA, data = gene_expression)

print("Linear Regression Model:")
print(regression_model)

print("Regression Model Summary:")
summary(regression_model)


# Scatter plot with regression line

plot(
  gene_expression$GeneA,
  gene_expression$GeneB,
  main = "GeneA vs GeneB Expression",
  xlab = "GeneA Expression",
  ylab = "GeneB Expression",
  pch = 19
)

abline(regression_model, lwd = 2)


# Predict GeneB expression when GeneA = 27

new_data <- data.frame(GeneA = 27)

predicted_geneB <- predict(
  regression_model,
  newdata = new_data
)

print("Predicted GeneB expression when GeneA = 27:")
print(predicted_geneB)

# Save gene expression dataset as CSV

write.csv(
  gene_expression,
  "gene_correlation.csv",
  row.names = FALSE
)

print("Gene expression dataset saved as gene_correlation.csv")
