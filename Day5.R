# Global Variable
x <- 10

show_value <- function() {
  print(x)
}

show_value()


# Local Variable
my_function <- function() {
  y <- 20
  print(y)
}

my_function()


# Global and Local Same Name
x <- 100

test <- function() {
  x <- 50
  print(x)
}

test()
print(x)


# Change Global Variable
count <- 1

change_value <- function() {
  count <<- 10
}

change_value()
print(count)
