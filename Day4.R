# Function Level R Program 
# File name: student_result_function.R

# Create function to calculate result
student_result <- function(name, marks) {
  
  average <- mean(marks)
  
  grade <- ifelse(average >= 90, "A",
           ifelse(average >= 75, "B",
           ifelse(average >= 60, "C", "Fail")))
  
  cat("Student Name :", name, "\n")
  cat("Marks        :", marks, "\n")
  cat("Average      :", round(average, 2), "\n")
  cat("Grade        :", grade, "\n")
}

# Call function
student_result("Masha", c(88, 92, 95, 90))
student_result("Arun", c(65, 70, 72, 68))