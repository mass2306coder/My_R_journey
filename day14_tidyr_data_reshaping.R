# ==========================================
# R Learning - Day 14
# Data Reshaping using tidyr
# Author: Masha Srinivasan
# ==========================================

# Install if needed:
# install.packages("tidyr")
# install.packages("dplyr")

library(tidyr)
library(dplyr)


# ------------------------------------------
# 1. Create a wide-format dataset
# ------------------------------------------

students <- data.frame(
  Student = c(
    "Alice", "Bob", "Charlie", "David"
  ),

  Biology = c(88, 72, 95, 65),

  Chemistry = c(85, 75, 92, 68),

  Bioinformatics = c(90, 70, 96, 62)
)

cat("\nOriginal Wide Dataset:\n")
print(students)


# ------------------------------------------
# 2. Convert Wide → Long
# using pivot_longer()
# ------------------------------------------

students_long <- students %>%
  pivot_longer(
    cols = c(
      Biology,
      Chemistry,
      Bioinformatics
    ),
    names_to = "Subject",
    values_to = "Marks"
  )

cat("\nLong Format Dataset:\n")
print(students_long)


# ------------------------------------------
# 3. Convert Long → Wide
# using pivot_wider()
# ------------------------------------------

students_wide <- students_long %>%
  pivot_wider(
    names_from = Subject,
    values_from = Marks
  )

cat("\nConverted Back to Wide Format:\n")
print(students_wide)


# ------------------------------------------
# 4. Create a dataset with combined data
# ------------------------------------------

student_info <- data.frame(
  Student_ID = c(
    "STU001_Biology",
    "STU002_Chemistry",
    "STU003_Bioinformatics"
  )
)

cat("\nOriginal ID Data:\n")
print(student_info)


# ------------------------------------------
# 5. Separate combined column
# ------------------------------------------

student_info <- student_info %>%
  separate(
    Student_ID,
    into = c("Student", "Subject"),
    sep = "_"
  )

cat("\nAfter separating Student ID:\n")
print(student_info)


# ------------------------------------------
# 6. Unite columns
# ------------------------------------------

student_info <- student_info %>%
  unite(
    "Student_ID",
    Student,
    Subject,
    sep = "_"
  )

cat("\nAfter uniting columns:\n")
print(student_info)


# ------------------------------------------
# 7. Create dataset with missing values
# ------------------------------------------

students_missing <- data.frame(
  Student = c(
    "Alice",
    "Bob",
    "Charlie",
    "David"
  ),

  Biology = c(
    88,
    NA,
    95,
    65
  ),

  Chemistry = c(
    85,
    75,
    NA,
    68
  )
)

cat("\nDataset containing missing values:\n")
print(students_missing)


# ------------------------------------------
# 8. Remove rows containing NA
# using drop_na()
# ------------------------------------------

students_complete <- students_missing %>%
  drop_na()

cat("\nDataset after removing rows with NA:\n")
print(students_complete)


# ------------------------------------------
# 9. Save long-format dataset
# ------------------------------------------

write.csv(
  students_long,
  "day14_long_format.csv",
  row.names = FALSE
)

cat("\nLong-format dataset saved successfully.\n")
