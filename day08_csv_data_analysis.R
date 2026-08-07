# ==========================================
# R Learning - Day 08
# Reading CSV and Data Exploration
# Author: Masha Srinivasan
# ==========================================

# Read CSV file
students <- read.csv("students.csv")

cat("Student Dataset\n")
print(students)

# Dataset information
cat("\nStructure of Dataset\n")
str(students)

cat("\nSummary Statistics\n")
summary(students)

cat("\nDimensions\n")
print(dim(students))

cat("\nColumn Names\n")
print(names(students))

# Average marks

cat("\nAverage Math Marks :", mean(students$Math))
cat("\nAverage Science Marks :", mean(students$Science))
cat("\nAverage English Marks :", mean(students$English))

# Add Total Marks

students$Total <- students$Math +
                  students$Science +
                  students$English

# Add Percentage

students$Percentage <- students$Total / 3

# Display updated dataset

cat("\nUpdated Dataset\n")
print(students)

# Student with highest percentage

top <- students[which.max(students$Percentage),]

cat("\nTop Performer\n")
print(top)

# Save updated dataset

write.csv(students,
          "students_result.csv",
          row.names = FALSE)

cat("\nUpdated file saved as students_result.csv")
