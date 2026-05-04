# Day 6 - Conditional Statements and Loops in R

# if statement
age <- 20

if(age >= 18){
  print("Eligible to vote")
}

# if else statement
marks <- 45

if(marks >= 50){
  print("Pass")
} else {
  print("Fail")
}

# else if statement
score <- 82

if(score >= 90){
  print("A Grade")
} else if(score >= 75){
  print("B Grade")
} else if(score >= 50){
  print("C Grade")
} else {
  print("Fail")
}

# for loop
for(i in 1:5){
  print(i)
}

# multiplication table of 7
for(i in 1:10){
  print(7 * i)
}

# while loop
x <- 1

while(x <= 5){
  print(x)
  x <- x + 1
}

# break statement
for(i in 1:10){
  if(i == 6){
    break
  }
  print(i)
}

# next statement
for(i in 1:5){
  if(i == 3){
    next
  }
  print(i)
}

# even numbers from 1 to 10
for(i in 1:10){
  if(i %% 2 == 0){
    print(i)
  }
}

# sum of first 5 numbers
sum <- 0

for(i in 1:5){
  sum <- sum + i
}

print(sum)