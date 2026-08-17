# R Learning - Day 15

## Topic

Gene Expression Data Analysis

## Concepts Covered

- Importing CSV data
- Inspecting gene-expression data
- Mean expression
- Fold change
- Log2 fold change
- Filtering genes
- Identifying upregulated genes
- Sorting genes
- Basic gene-expression visualization
- dplyr
- ggplot2

## Dataset

A small educational gene-expression dataset comparing Control and Treatment conditions.

## Program Features

The R script:

1. Imports the gene-expression dataset.
2. Calculates mean expression for Control and Treatment.
3. Calculates fold change.
4. Calculates log2 fold change.
5. Classifies genes as upregulated or showing no major change.
6. Identifies highly expressed genes.
7. Sorts genes according to expression change.
8. Creates a basic gene-expression plot.
9. Exports the processed dataset.

## Bioinformatics Relevance

Gene-expression analysis is a fundamental component of transcriptomics and RNA-seq analysis.

Fold change and log2 fold change are commonly used to describe changes in gene expression between experimental conditions.

This exercise provides a basic introduction to expression analysis using R.

## Important Note

This is a small educational dataset. Real RNA-seq differential-expression analysis requires biological replicates and appropriate statistical methods such as DESeq2 or edgeR.
