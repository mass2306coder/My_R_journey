\# Day 3 - Environments in R 🌍



Today I learned about \*\*Environments in R\*\*.  

Environments are special data structures used to store objects like variables, functions, and data. They are different from vectors, lists, and data frames because they use \*\*reference semantics\*\*.



\---



\## 📌 What is an Environment?



An environment is like a \*\*container\*\* or \*\*workspace\*\* where objects are stored with names.



Examples:

\- Global Environment (`.GlobalEnv`) → where user-created variables are stored

\- Package Environments → functions from packages

\- Function Environments → local variables inside functions



\---

\# Important Environments in R for Bioinformatics / Research Coding 🧬



\## 📌 Why Environments are Important?



\- Store variables and functions

\- Used in package development

\- Used in functions and scoping

\- Helps understand memory management

\- Prevents unnecessary copying of data



\---



\## 📌 Creating an Environment



```r

\# Create new environment

newEnv <- new.env()



\# View environment

newEnv



Environments are very useful when working with large datasets, reusable functions, pipelines, simulations, and package-style code.



\---



\# 📌 Why Learn Environments for Research?



In bioinformatics, you may work with:



\- Gene expression matrices

\- FASTA / sequence objects

\- Reproducible pipelines

\- Multiple datasets

\- Temporary variables inside functions

\- Memory-heavy analysis



Environments help organize and manage these efficiently.



\---



\# 1️⃣ Create an Environment



```r

lab <- new.env()

lab

