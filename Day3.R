# ===============================
# Day 3 - Environments in R
# All Important Codes in One
# ===============================

# 1. Create Environment
lab <- new.env()

# 2. Store Objects
lab$gene <- "BRCA1"
lab$score <- 9.5
lab$ids <- c("S1", "S2", "S3")

# 3. Access Objects
lab$gene
lab$score
lab$ids

# 4. List Objects
ls(lab)

# 5. Check Object Exists
exists("gene", envir = lab)
exists("protein", envir = lab)

# 6. Get Object by Name
get("gene", envir = lab)

# 7. Remove Object
rm(score, envir = lab)
ls(lab)

# 8. Parent Environment
parent.env(lab)

# ===============================
# List vs Environment
# ===============================

# List Example
x <- list(a = 10)

z <- x
z$a <- 20

x$a
z$a

# Environment Example
y <- new.env()
y$a <- 10

w <- y
w$a <- 20

y$a
w$a

# ===============================
# Reference Semantics
# ===============================

db <- new.env()
db$count <- 1

copy <- db
copy$count <- 99

db$count
copy$count

# ===============================
# Functions Use Environments
# ===============================

test <- function() {
  a <- 5
  b <- 10
  a + b
}

test()

# ===============================
# Closure Example
# ===============================

counter <- function() {
  count <- 0
  
  function() {
    count <<- count + 1
    count
  }
}

inc <- counter()

inc()
inc()
inc()

# ===============================
# Bioinformatics Example
# ===============================

project <- new.env()

project$gene_names <- c("TP53", "BRCA1", "EGFR")
project$expression <- c(12.4, 8.2, 15.1)

mean(project$expression)

# ===============================
# Search Path
# ===============================

search()

# ===============================
# Global Environment
# ===============================

ls(.GlobalEnv)

# ===============================
# Separate Project Environments
# ===============================

raw <- new.env()
clean <- new.env()
results <- new.env()

raw$data <- data.frame(
  id = c(1,2,3,4),
  value = c(10, NA, 30, 40)
)

clean$data <- na.omit(raw$data)

results$summary <- summary(clean$data)

raw$data
clean$data
results$summary

# ===============================
# Mini Practice
# ===============================

bio <- new.env()

bio$genes <- c("TP53", "BRCA1", "MYC")
bio$values <- c(10.2, 5.4, 8.1)

ls(bio)

mean(bio$values)

exists("genes", envir = bio)

rm(values, envir = bio)

ls(bio)

# ===============================
# End of Day 3
# ===============================