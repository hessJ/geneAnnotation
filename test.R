
## Set a working direction -- the folder must contain GeneAnnotationTool_version(x).R and GeneAnnotatioTool_data.Rdata

cd = "E:/GeneAnnotationTool"

setwd(cd)


source("GeneAnnotationTool_version1.R")
# load("GeneAnnotationTool_data_version1.2.Rdata")
load("GeneAnnotationTool_data_version1.3.Rdata")



# list a set of genes 

geneSet = c("DRD2", "ZNF804A", "COMT", "MAOA", "PDE4B", "MCAM", "NCAM", "SLC1A1", "SLC9A9", "RELN", "TYMS")

geneSet = read.csv("G:/Manuscripts/Splicing_GWAS/clnc3_genemania.csv", header = T)
geneSet = geneSet[geneSet$Gene.1 %in% "CLCN3" | geneSet$Gene.2 %in% "CLCN3",]
geneSet = unique(c(as.character(geneSet$Gene.1), as.character(geneSet$Gene.2)))

geneSet = read.csv("E:/CommonMind/RNAseq/Results/wgcna/WGCNA_hubmeta.info.csv", header = T)
geneSet  = geneSet$gene_symbol

## You can sub-group genes by inputting categories manually


geneClass = read.csv("E:/CommonMind/RNAseq/Results/wgcna/WGCNA_hubmeta.info.csv", header = T)
geneClass = geneClass$moduleColor
geneClass = rep("black", length(geneSet))

## list abbreviations for brain regions of interest:
## options: A1C, V1C, DTH, AMY, VFC, ITC, CB, MFC, CBC, M1C, MGE, CGE, DFC, LGE, STR, PCx, HIP, M1C-S1C, URL, IPC, Ocx, OFC, TCx, STC, S1C, MD

brainRegions = c("DFC", "MFC", "STC", "STR")

## select GWAS results of interest
## options: Anxiety, CD, IBD, ADHD, ASD, BP, MDD, SZ, EVRSMK 

gwasSet = c("SZ", "MDD", "CD", "IBD", "ADHD", "ASD", "MDD", "BP","EVRSMK")

dev.off() ## clear the plotting space

saveFileExtension = "E:/geneAnnotationTool_update.1.3.pdf"


## Optional: save file 
plotGeneTracks(geneSet = geneSet, brainRegions = brainRegions, gwasSet = gwasSet, fileWidth = 16, fileHeight = 10, saveFile = TRUE)

## Optional: Don't save file 
plotGeneTracks(geneSet = geneSet, brainRegions = brainRegions, gwasSet = gwasSet, fileWidth = 16, fileHeight = 10, saveFile = FALSE)


pDF ## returns matrix of gene annotations 

## Separate plot of GWAS results with line denoting genome-wide significance

gwas <- pDF[,grepl("_logP", colnames(pDF))]

dev.off()
par(mfrow=c(4,5))

for( i in 1:nrow(gwas)){
  
barplot(t(gwas[i,])[,1], las = 2, ylim = c(0,10), col = rainbow(ncol(gwas)),  main = rownames(gwas)[[i]])
abline(h = -log10(5e-8), lty = 1, col = "red")
abline(h = -log10(1e-5), lty = 2, col = "red")


}

