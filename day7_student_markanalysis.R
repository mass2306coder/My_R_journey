#====================================================================
# R learning -Day 7
# Student Marks Analysis
# Author: MASHA
#====================================================================
#Create a data frame

students <- data.frame(
Name=c("Alice","Bob","Charlie","David","Emma"),
Math=c(85,65,78,62,98),
Science=c(88,78,26,95,98),
English=c(86,35,76,95,95)
)
print("Student Data")
print(student)

#Function to calculate total marks
calculate_percentage <- function(Math, Science, English){
  return(Math+Science+English)
  }
#Function to calculate percentage

calculate_percentage<- function(total){
  return(total/3)
  }
#Add new columns

students$Total <- calculate_total(
   students$Math,
   students$Science,
   student$English
  )

students$Percentage <- calculate_percentage(students$Total)

# Assign Grades

students$Grade <- ifelse(
  students$Percentage >=90, "A",
  ifelse(
      students$Percentage >= 80, "B",
      ifelse(
          students$Percentage >= 70, "C",
          "D"
        )
    )
  )
print("Updated Student Data")
print(students)

# Find Top Performer

top_student <- student[which.max(students$Percentage), ]

cat("\nTop Performer\n")
print(top_student)

#Average Marks 

cat("\nAverage Math Marks:", mean(students$Math))
cat("\nAverage Science Marks:", mean(students$Science))
cat("\nAverage English Marks:", mean(students$English))

#Highest and Lowest Percentage
cat("\nHighest Percentage:", max(students$Percentage))
cat("\nLowest Percentage", min(students$Percentage))

# Highest and Lowest Percentage

cat("\nHighest Percentage:", max(students$Percentage))
cat("\nLowest Percentage:", min(students$Percentage))

# Loop through each student

cat("\n\nStudent Report\n")

for(i in 1:nrow(students)){

  cat("---------------------\n")
  cat("Name:", students$Name[i], "\n")
  cat("Percentage:", round(students$Percentage[i],2), "\n")
  cat("Grade:", students$Grade[i], "\n")
  }
