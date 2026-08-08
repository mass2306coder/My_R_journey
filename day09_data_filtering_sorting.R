# ==========================================
# R Learning - Day 09
# Data Filtering and Sorting
# Author: Masha Srinivasan
# ==========================================

# Create student dataset

students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Emma",
           "John", "Sophia", "Daniel"),
  Age = c(20, 21, 19, 22, 20, 21, 19, 23),
  Biology = c(88, 72, 95, 65, 91, 78, 89, 70),
  Chemistry = c(85, 75, 92, 68, 94, 80, 87, 73),
  Bioinformatics = c(90, 70, 96, 62, 93, 82, 91, 75)
)

cat("Original Dataset\n")
print(students)


# ------------------------------------------
# 1. Filter students with Biology > 80
# ------------------------------------------

high_biology <- students[students$Biology > 80, ]

cat("\nStudents with Biology marks > 80\n")
print(high_biology)


# ------------------------------------------
# 2. Filter students with Bioinformatics > 85
# ------------------------------------------

high_bioinformatics <- students[
  students$Bioinformatics > 85,
]

cat("\nStudents with Bioinformatics marks > 85\n")
print(high_bioinformatics)


# ------------------------------------------
# 3. Multiple conditions
# Biology > 80 AND Chemistry > 80
# ------------------------------------------

high_performers <- students[
  students$Biology > 80 &
  students$Chemistry > 80,
]

cat("\nStudents scoring > 80 in Biology AND Chemistry\n")
print(high_performers)


# ------------------------------------------
# 4. OR condition
# Biology > 90 OR Bioinformatics > 90
# ------------------------------------------

top_students <- students[
  students$Biology > 90 |
  students$Bioinformatics > 90,
]

cat("\nStudents with Biology > 90 OR Bioinformatics > 90\n")
print(top_students)


# ------------------------------------------
# 5. Sort by Biology marks
# ------------------------------------------

biology_sorted <- students[
  order(students$Biology, decreasing = TRUE),
]

cat("\nStudents sorted by Biology marks\n")
print(biology_sorted)


# ------------------------------------------
# 6. Sort by Bioinformatics marks
# ------------------------------------------

bioinformatics_sorted <- students[
  order(students$Bioinformatics, decreasing = TRUE),
]

cat("\nStudents sorted by Bioinformatics marks\n")
print(bioinformatics_sorted)


# ------------------------------------------
# 7. Select students between ages 20 and 22
# ------------------------------------------

age_filtered <- students[
  students$Age >= 20 &
  students$Age <= 22,
]

cat("\nStudents aged between 20 and 22\n")
print(age_filtered)


# ------------------------------------------
# 8. Find the highest Bioinformatics score
# ------------------------------------------

highest_score <- max(students$Bioinformatics)

cat("\nHighest Bioinformatics Score:",
    highest_score)


# ------------------------------------------
# 9. Find the student with highest score
# ------------------------------------------

best_student <- students[
  which.max(students$Bioinformatics),
]

cat("\n\nBest Bioinformatics Performer\n")
print(best_student)
