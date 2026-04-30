# Day 2 - R Basics (Vectors & Operations)

# Create a vector
numbers <- c(1, 2, 3, 4, 5)
print(numbers)   # print full vector

# Access elements (index starts from 1)
print(numbers[3])   # 3rd element
print(numbers[1])   # 1st element
print(numbers[0])   # returns empty vector

# Vector arithmetic (element-wise operations)
a <- c(5, 6, 3)
b <- c(8, 2, 1)

sum <- a + b        # add vectors
print(sum)

print(a + b)        # direct addition

# Create sequences
seq1 <- 1:9         # sequence from 1 to 9
print(seq1)

# seq(start, end, by)
seq2 <- seq(1, 10, 2)   # step of 2
print(seq2)

seq2 <- seq(2, 10, 2)   # even numbers
print(seq2)

# Repeat values
rep1 <- rep(4, 6)   # repeat 4, six times
print(rep1)

# Basic functions
print(mean(numbers))   # average
print(sum(numbers))    # total sum
print(max(numbers))    # maximum value
print(min(numbers))    # minimum value