# ==========================================
# R Learning - Day 13
# Data Manipulation using dplyr
# Author: Masha Srinivasan
# ==========================================

# Install dplyr if needed:
# install.packages("dplyr")

library(dplyr)


# ------------------------------------------
# 1. Create a dataset
# ------------------------------------------

students <- data.frame(
  Name = c(
    "Alice", "Bob", "Charlie", "David",
    "Emma", "John", "Sophia", "Daniel"
  ),

  Age = c(21, 22, 20, 23, 21, 22, 20, 24),

  Biology = c(88, 72, 95, 65, 91, 78, 89, 70),

  Chemistry = c(85, 75, 92, 68, 94, 80, 87, 73),

  Bioinformatics = c(90, 70, 96, 62, 93, 82, 91, 75)
)

print(students)


# ------------------------------------------
# 2. filter()
# Select students with Biology > 80
# ------------------------------------------

high_biology <- students %>%
  filter(Biology > 80)

cat("\nStudents with Biology > 80:\n")
print(high_biology)


# ------------------------------------------
# 3. select()
# Select specific columns
# ------------------------------------------

selected_data <- students %>%
  select(Name, Biology, Bioinformatics)

cat("\nSelected columns:\n")
print(selected_data)


# ------------------------------------------
# 4. arrange()
# Sort by Biology marks
# ------------------------------------------

sorted_students <- students %>%
  arrange(desc(Biology))

cat("\nStudents sorted by Biology:\n")
print(sorted_students)


# ------------------------------------------
# 5. mutate()
# Create Total and Average columns
# ------------------------------------------

students <- students %>%
  mutate(
    Total = Biology + Chemistry + Bioinformatics,
    Average = Total / 3
  )

cat("\nDataset with Total and Average:\n")
print(students)


# ------------------------------------------
# 6. Create Performance category
# ------------------------------------------

students <- students %>%
  mutate(
    Performance = ifelse(
      Average >= 80,
      "High",
      "Normal"
    )
  )

cat("\nPerformance categories:\n")
print(students)


# ------------------------------------------
# 7. summarise()
# Calculate average Biology mark
# ------------------------------------------

biology_average <- students %>%
  summarise(
    Mean_Biology = mean(Biology)
  )

cat("\nAverage Biology mark:\n")
print(biology_average)


# ------------------------------------------
# 8. group_by()
# Calculate average marks by performance
# ------------------------------------------

performance_summary <- students %>%
  group_by(Performance) %>%
  summarise(
    Average_Mark = mean(Average),
    Number_of_Students = n()
  )

cat("\nPerformance summary:\n")
print(performance_summary)


# ------------------------------------------
# 9. Find the top student
# ------------------------------------------

top_student <- students %>%
  arrange(desc(Average)) %>%
  slice(1)

cat("\nTop student:\n")
print(top_student)


# ------------------------------------------
# 10. Save processed dataset
# ------------------------------------------

write.csv(
  students,
  "day13_processed_students.csv",
  row.names = FALSE
)

cat("\nProcessed dataset saved successfully.\n")
