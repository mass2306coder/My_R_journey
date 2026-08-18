#=========================================
#R learning - Day-16
#Statistical analysis for Gene Expression
#Author: Masha Srinivasan
#=========================================
library(dplyr)
library(ggplot2)

#-----------------------------------------
#1.Import dataset
#-----------------------------------------
expression_data <-read.csv("gene_expression_day16.csv")
cat("\nGene Expression Dataset:\n")
print(expression_data)

#--------------------------------------------
#2.Basic Summary Statistics
#--------------------------------------------
cat("\nControl Mean:\n")
print(mean(expression_data$Control))


cat("\nTreatment Mean:\n")
print(mean(expression_data$Treatment))


cat("\nControl Median:\n")
print(median(expression_data$Control))

cat("\nTreatment Median:\n")
print(median(expression_data$Treatment))	

# ------------------------------------------
# 3. Standard deviation
# ------------------------------------------
control_sd <- sd(expression_data$Control)

treatment_sd <- sd(expression_data$Treatment)

cat("\nControl Standard Deviation:\n")
print(control_sd)

cat("\nTreatment Standard Deviation:\n")
print(treatment_sd)


# ------------------------------------------
# 4. Variance
# ------------------------------------------

cat("\nControl Variance:\n")
print(var(expression_data$Control))

cat("\nTreatment Variance:\n")
print(var(expression_data$Treatment))



# ------------------------------------------
# 5. Summary statistics
# ------------------------------------------

cat("\nComplete Control Summary:\n")
print(summary(expression_data$Control))

cat("\nComplete Treatment Summary:\n")
print(summary(expression_data$Treatment))



# ------------------------------------------
# 6. Correlation
# ------------------------------------------
Correlation <- cor(expression_data$Control,expression_data$Treatment)

cat("\nCorrelation between Control and Treatment:\n")
print(Correlation)



# ------------------------------------------
# 7. T-test
# ------------------------------------------

test_result <- t.test(
  expression_data$Control,
  expression_data$Treatment
)

cat("\nT-test result:\n")
print(test_result)




# ------------------------------------------
# 8. Extract p-value
# ------------------------------------------
p_value <- test_result$p.value

cat("\nP-value:\n")
print(p_value)


# ------------------------------------------
# 9. Interpret p-value
# ------------------------------------------
if (p_value < 0.05) {

  cat(
    "\nResult: Statistically significant difference detected.\n"
  )

} else {

  cat(
    "\nResult: No statistically significant difference detected.\n"
  )
}
# ------------------------------------------
# 10. Create summary table
# ------------------------------------------
summary_table <- data.frame(
  Condition = c(
    "Control",
    "Treatment"
  ),
 Mean = c(
    mean(expression_data$Control),
    mean(expression_data$Treatment)
  ),

  Median = c(
    median(expression_data$Control),
    median(expression_data$Treatment)
  ),

  Standard_Deviation = c(
    sd(expression_data$Control),
    sd(expression_data$Treatment)
  )
)

cat("\nSummary Table:\n")
print(summary_table)



# ------------------------------------------
# 11. Visualize expression distributions
# ------------------------------------------
expression_long <- expression_data %>%
  tidyr::pivot_longer(
    cols = c(Control, Treatment),
    names_to = "Condition",
    values_to = "Expression"
  )


ggplot(
  expression_long,
  aes(
    x = Condition,
    y = Expression
  )
) +
  geom_boxplot() +
  geom_jitter(width = 0.1) +
  labs(
    title = "Gene Expression Distribution",
    x = "Condition",
    y = "Expression"
  ) +
  theme_minimal()


# ------------------------------------------
# 12. Save statistics
# ------------------------------------------

write.csv(
  summary_table,
  "day16_expression_statistics.csv",
  row.names = FALSE
)

cat(
  "\nStatistical summary saved successfully.\n"
)
