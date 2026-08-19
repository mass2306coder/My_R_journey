# Day 17 - Correlation and Linear Regression in R

## Objective

To learn how to analyze the relationship between two gene-expression variables using Pearson correlation and simple linear regression in R.

## Dataset

A small example gene-expression dataset containing expression values for GeneA and GeneB across eight observations.

| Gene | GeneA | GeneB |
|------|------:|------:|
| Gene1 | 12 | 15 |
| Gene2 | 18 | 20 |
| Gene3 | 25 | 28 |
| Gene4 | 30 | 32 |
| Gene5 | 22 | 24 |
| Gene6 | 15 | 18 |
| Gene7 | 35 | 37 |
| Gene8 | 40 | 42 |

## R Functions Used

- `data.frame()`
- `cor()`
- `cor.test()`
- `plot()`
- `abline()`
- `lm()`
- `summary()`
- `predict()`
- `write.csv()`

## Analysis

### 1. Pearson Correlation

Pearson correlation was calculated to measure the strength and direction of the linear relationship between GeneA and GeneB.

**Correlation coefficient:** 0.9990792

This indicates an extremely strong positive correlation between GeneA and GeneB.

### 2. Statistical Significance

A Pearson correlation test was performed.

**p-value:** 1.95 × 10⁻⁹

Since the p-value is less than 0.05, the correlation is statistically significant.

**95% confidence interval:** 0.9946968 - 0.9998404

### 3. Linear Regression

A simple linear regression model was fitted using GeneA as the predictor and GeneB as the response variable.

```text
GeneB = 3.1720 + 0.9676 × GeneA
