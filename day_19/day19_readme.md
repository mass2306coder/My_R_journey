# Day 19 — Principal Component Analysis (PCA) of Gene Expression Data

## 📌 Overview

Day 19 focuses on **Principal Component Analysis (PCA)**, an important dimensionality reduction technique used in bioinformatics and transcriptomics.

PCA helps reduce high-dimensional gene expression data into a smaller number of principal components while retaining the major patterns of variation in the dataset.

---

## 🎯 Learning Objectives

- Understand the concept of PCA
- Perform PCA using R
- Understand PC1 and PC2
- Calculate the percentage of variance explained
- Visualize samples using a PCA plot
- Understand sample clustering and separation
- Learn why PCA is useful in transcriptomics

---

## 🧬 Dataset

A small example gene expression dataset containing:

- 10 genes
- 6 samples
- 3 Control samples
- 3 Treatment samples

The dataset is provided as:

`gene_expression_day19.csv`

---

## 🔬 Workflow

```text
Gene Expression Data
        ↓
Import CSV Dataset
        ↓
Separate Gene Names
        ↓
Create Expression Matrix
        ↓
Transpose Matrix
        ↓
Scale Expression Data
        ↓
Perform PCA
        ↓
Calculate Variance Explained
        ↓
Extract PCA Scores
        ↓
Visualize PC1 vs PC2
