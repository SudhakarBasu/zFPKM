library(zFPKM)
library(dplyr)

fpkm <- read.csv("fpkm_genes.csv", row.names=1)
#fpkm <- select(fpkm, -MGI_Symbol)

zfpkm <- zFPKM(fpkm)
activeGenes <- which(rowMeans(zfpkm) > -3)

