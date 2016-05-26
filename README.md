# geneAnnotation
Create an accessible and information-rich plot of gene ontologies.

## Please cite the following if you make use of this tool:
1. Therapeutic Targets Database (http://bidd.nus.edu.sg/group/cjttd/)
2. Psychiatric Genomics Consortium Cross-Disorder Group (PMID: 23453885)
3. "Meta-analysis of genome-wide association studies of anxiety disorders." Otowa et al. (2016) (PMID: 26754954)
4. Inflammatory Bowel Disease Consortium (publications for CD and IBD found at: http://www.ibdgenetics.org/publications.html)
5. BrainSpan Database 
6. Human Protein Atlas 
7. "CellMix: a comprehensive toolbox for gene expression deconvolution." Gaujoux and Seoighe (2013) (PMID: 23825367)
8. "Deconvolution of Blood Microarray Data Identifies Cellular Activation Patterns in Systemic Lupus Erythematosus" Abbas et al. (2009) (PMID: 19568420)
9. Molecular Signatures Database (http://software.broadinstitute.org/gsea/msigdb)
10. geneAnnotation repo

## Items found in the repository

Filename: GeneAnnotationTool_data_version1.1.Rdata
Description: Gene ontological data that will be imported into R environment and accessed for plotting.

Filename: GeneAnnotationTool_version1.R
Description: Source code that will need to be loaded into R. Latest version of R software is highly recommended. 
Latest dependencies will be automatically installed (knock on wood).


Filename: test.R 
Description: Proceed to this file to set options for plotting (e.g., output plot name, genes of interest, brain regions, summary statistics for genome-wide assocation studies).
User-defined functions are limited at this time. I will update the software in due time to allow for more user control. 
You may choose to categorize genes, which will be reflected in the plot with row-wise annotation labels. Columns are automatically annotated based on data type.

*Advanced users*
You may wish to access and edit the data set that I have compiled to include your own ontologies/annotations. 
It is possible to do so by editing the object "expand" which is present in the environment after loading the source code. 
I don't recommend overwriting the .Rdata file for safety.

