# ==========================================
# R Learning - Day 12
# Handling Missing Data (NA) in R
# Author: Masha Srinivasan
# ==========================================

# Create dataset with missing values

students <- data.frame(
  Name = c(
    "Alice", "Bob", "Charlie", "David",
    "Emma", "John", "Sophia", "Daniel"
  ),

  Biology = c(
    88, 72, NA, 65,
    91, 78, 89, NA
  ),

  Chemistry = c(
    85, NA, 92, 68,
    94, 80, NA, 73
  ),

  Bioinformatics = c(
    90, 70, 96, NA,
    93, 82, 91, 75
  )
)

cat("Original Dataset\n")
print(students)


# ------------------------------------------
# 1. Check for missing values
# ------------------------------------------

cat("\nMissing values in each column\n")

print(is.na(students))


# ------------------------------------------
# 2. Count missing values
# ------------------------------------------

cat("\nNumber of missing values per column\n")

print(colSums(is.na(students)))


# ------------------------------------------
# 3. Total number of missing values
# ------------------------------------------

total_missing <- sum(is.na(students))

cat(
  "\nTotal missing values:",
  total_missing,
  "\n"
)


# ------------------------------------------
# 4. Find rows containing missing values
# ------------------------------------------

missing_rows <- students[
  !complete.cases(students),
]

cat("\nRows containing missing values\n")
print(missing_rows)


# ------------------------------------------
# 5. Find complete rows
# ------------------------------------------

complete_rows <- students[
  complete.cases(students),
]

cat("\nComplete rows\n")
print(complete_rows)


# ------------------------------------------
# 6. Calculate mean while ignoring NA
# ------------------------------------------

biology_mean <- mean(
  students$Biology,
  na.rm = TRUE
)

cat(
  "\nMean Biology mark:",
  biology_mean,
  "\n"
)


# ------------------------------------------
# 7. Replace missing Biology values
# with the mean
# ------------------------------------------

students$Biology[
  is.na(students$Biology)
] <- biology_mean

cat("\nBiology after replacing NA\n")
print(students)


# ------------------------------------------
# 8. Replace missing Chemistry values
# with the mean
# ------------------------------------------

chemistry_mean <- mean(
  students$Chemistry,
  na.rm = TRUE
)

students$Chemistry[
  is.na(students$Chemistry)
] <- chemistry_mean


# ------------------------------------------
# 9. Replace missing Bioinformatics values
# with the mean
# ------------------------------------------

bioinformatics_mean <- mean(
  students$Bioinformatics,
  na.rm = TRUE
)

students$Bioinformatics[
  is.na(students$Bioinformatics)
] <- bioinformatics_mean


# ------------------------------------------
# 10. Final cleaned dataset
# ------------------------------------------

cat("\nFinal Cleaned Dataset\n")
print(students)


# ------------------------------------------
# 11. Verify that no NA values remain
# ------------------------------------------

cat("\nMissing values after cleaning:\n")

print(colSums(is.na(students)))


# ------------------------------------------
# 12. Save cleaned dataset
# ------------------------------------------

write.csv(
  students,
  "cleaned_students.csv",
  row.names = FALSE
)

cat(
  "\nCleaned dataset saved as cleaned_students.csv\n"
)
