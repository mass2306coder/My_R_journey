# ==========================================
# R Learning - Day 10
# Data Visualization Using Base R
# Author: Masha Srinivasan
# ==========================================

# Create dataset

students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David",
           "Emma", "John", "Sophia", "Daniel"),

  Biology = c(88, 72, 95, 65, 91, 78, 89, 70),

  Chemistry = c(85, 75, 92, 68, 94, 80, 87, 73),

  Bioinformatics = c(90, 70, 96, 62, 93, 82, 91, 75)
)

print(students)


# ------------------------------------------
# 1. Bar Plot
# ------------------------------------------

barplot(
  students$Biology,
  names.arg = students$Name,
  main = "Biology Marks",
  xlab = "Students",
  ylab = "Marks",
  las = 2
)


# ------------------------------------------
# 2. Histogram
# ------------------------------------------

hist(
  students$Biology,
  main = "Distribution of Biology Marks",
  xlab = "Biology Marks",
  ylab = "Number of Students"
)


# ------------------------------------------
# 3. Boxplot
# ------------------------------------------

boxplot(
  students$Biology,
  main = "Biology Marks Distribution",
  ylab = "Marks"
)


# ------------------------------------------
# 4. Scatter Plot
# Biology vs Bioinformatics
# ------------------------------------------

plot(
  students$Biology,
  students$Bioinformatics,
  main = "Biology vs Bioinformatics",
  xlab = "Biology Marks",
  ylab = "Bioinformatics Marks",
  pch = 19
)


# ------------------------------------------
# 5. Compare Three Subjects
# ------------------------------------------

marks <- rbind(
  students$Biology,
  students$Chemistry,
  students$Bioinformatics
)

barplot(
  marks,
  beside = TRUE,
  names.arg = students$Name,
  main = "Subject-wise Marks",
  xlab = "Students",
  ylab = "Marks",
  las = 2
)


# ------------------------------------------
# 6. Correlation
# ------------------------------------------

correlation <- cor(
  students$Biology,
  students$Bioinformatics
)

cat(
  "\nCorrelation between Biology and Bioinformatics:",
  correlation,
  "\n"
)
