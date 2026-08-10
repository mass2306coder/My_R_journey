# ==========================================
# R Learning - Day 11
# Data Visualization with ggplot2
# Author: Masha Srinivasan
# ==========================================

library(ggplot2)

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

ggplot(students, aes(x = Name, y = Biology)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Biology Marks",
    x = "Student",
    y = "Marks"
  )


# ------------------------------------------
# 2. Histogram
# ------------------------------------------

ggplot(students, aes(x = Biology)) +
  geom_histogram(bins = 5) +
  labs(
    title = "Distribution of Biology Marks",
    x = "Biology Marks",
    y = "Number of Students"
  )


# ------------------------------------------
# 3. Boxplot
# ------------------------------------------

ggplot(students, aes(y = Biology)) +
  geom_boxplot() +
  labs(
    title = "Distribution of Biology Marks",
    y = "Biology Marks"
  )


# ------------------------------------------
# 4. Scatter Plot
# ------------------------------------------

ggplot(
  students,
  aes(x = Biology, y = Bioinformatics)
) +
  geom_point(size = 3) +
  labs(
    title = "Biology vs Bioinformatics",
    x = "Biology Marks",
    y = "Bioinformatics Marks"
  )


# ------------------------------------------
# 5. Add a trend line
# ------------------------------------------

ggplot(
  students,
  aes(x = Biology, y = Bioinformatics)
) +
  geom_point(size = 3) +
  geom_smooth(method = "lm") +
  labs(
    title = "Relationship Between Biology and Bioinformatics",
    x = "Biology Marks",
    y = "Bioinformatics Marks"
  )


# ------------------------------------------
# 6. Compare subjects
# ------------------------------------------

students_long <- data.frame(
  Student = rep(students$Name, 3),

  Subject = rep(
    c("Biology", "Chemistry", "Bioinformatics"),
    each = nrow(students)
  ),

  Marks = c(
    students$Biology,
    students$Chemistry,
    students$Bioinformatics
  )
)

print(students_long)


ggplot(
  students_long,
  aes(x = Student, y = Marks, fill = Subject)
) +
  geom_bar(
    stat = "identity",
    position = "dodge"
  ) +
  labs(
    title = "Comparison of Subject Marks",
    x = "Student",
    y = "Marks"
  )


# ------------------------------------------
# 7. Faceted Plot
# ------------------------------------------

ggplot(
  students_long,
  aes(x = Student, y = Marks)
) +
  geom_bar(stat = "identity") +
  facet_wrap(~Subject) +
  labs(
    title = "Subject-wise Student Performance",
    x = "Student",
    y = "Marks"
  )
