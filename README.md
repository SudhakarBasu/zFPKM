# zFPKM Analysis

A simple R script for identifying active genes from RNA-seq FPKM expression data using z-score transformation.

## Overview

This repository contains an R script that uses the [zFPKM package](https://cran.r-project.org/web/packages/zFPKM/index.html) to transform FPKM (Fragments Per Kilobase Million) values into z-scores, enabling robust identification of actively expressed genes across samples.

## What is zFPKM?

The zFPKM method transforms FPKM values to z-scores relative to their own distribution, making it easier to:
- Identify truly active genes vs. background noise
- Compare expression levels across different genes
- Filter out lowly expressed genes with a consistent threshold

The standard threshold of **z-score > -3** is commonly used to identify active genes, as values below this typically represent background expression.

## Files

- **`zFPKM.R`** - Main analysis script
- **`fpkm_genes.csv`** - Input FPKM expression matrix (23,637 genes × 6 samples)

## Requirements

```r
install.packages("zFPKM")
install.packages("dplyr")
```

## Usage

```r
# Run the script
source("zFPKM.R")
```

The script performs the following steps:

1. Loads FPKM expression data from `fpkm_genes.csv`
2. Transforms FPKM values to z-scores using the `zFPKM()` function
3. Identifies active genes using the threshold: mean z-score > -3 across samples

## Input Data Format

The input CSV file should have:
- **Rows**: Gene identifiers
- **Columns**: Sample FPKM values
- **Format**: First column contains gene names (used as row names)

Example structure:
```
"","FPKM.SRR25626852","FPKM.SRR25626853","FPKM.SRR25626854",...
"6PGDH",13.915277,12.290821,11.598549,...
"ABC1",74.893417,68.240326,73.454239,...
```

## Output

The script creates an `activeGenes` vector containing the indices of genes with mean z-score > -3, representing actively expressed genes.

## References

- Hart T, Komori HK, LaMere S, Podshivalova K, Salomon DR (2013). "Finding the active genes in deep RNA-seq gene expression studies." *BMC Genomics*, 14:778. [doi:10.1186/1471-2164-14-778](https://doi.org/10.1186/1471-2164-14-778)

## License

This project is open source and available for academic and research purposes.
