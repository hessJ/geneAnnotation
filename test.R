
## Set a working direction -- the folder must contain GeneAnnotationTool_version(x).R and GeneAnnotatioTool_data.Rdata

cd = "E:/GeneAnnotationTool"

setwd(cd)


source("GeneAnnotationTool_version1.R")
load("GeneAnnotationTool_data_version1.1.Rdata")



# list a set of genes 

geneSet = c("DRD2", "ZNF804A", "COMT", "MAOA", "PDE4B", "MCAM", "NCAM", "SLC1A1", "SLC9A9", "RELN", "TYMS")


## You can sub-group genes by inputting categories manually


geneClass = rep(c("black", "red"), length(geneSet)/2)

## list abbreviations for brain regions of interest:
## options: A1C, V1C, DTH, AMY, VFC, ITC, CB, MFC, CBC, M1C, MGE, CGE, DFC, LGE, STR, PCx, HIP, M1C-S1C, URL, IPC, Ocx, OFC, TCx, STC, S1C, MD

brainRegions = c("AMY", "MFC", "DFC")

## select GWAS results of interest
## options: Anxiety, CD, IBD, ADHD, ASD, BP, MDD, SZ, EVRSMK 

gwasSet = c("SZ", "MDD", "CD", "IBD", "ADHD", "ASD", "MDD", "BP","EVRSMK")

dev.off() ## clear the plotting space

saveFileExtension = "E:/Geneannotationtool_testv2.pdf" ## Location and filename of plot (required)

pdf(width = 16, height = 10) ## You can adjust the dimensions of the PDF file.


plotGeneTracks(geneSet = geneSet, brainRegions = brainRegions, gwasSet = gwasSet)






