# geneAnnotation
Create an accessible and information-rich plot of gene ontologies.

## Disclaimer:
I made substantial use of publically available knowledgebases and summary statistics from published studies. Data are presented as is and without warranty. These data and software are intended for academic and educational purposes only. I took certain liberties when processing, curating, and combining ontologies and raw data in order to simplify visualization of dense information. This software is being released as a developmental version and may change drastically over time. 

## Link to download data formatted for plotGeneTracks()

https://www.synapse.org/#!Synapse:syn6192548



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
10. Exome Aggregation Consortium (http://exac.broadinstitute.org/)
11. Genotype-Tissue Expression Project. "Human genomics. The Genotype-Tissue Expression (GTEx) pilot analysis: multitissue gene regulation in humans." Ardlie et al. (2015) (PMID: 25954001)
12. geneAnnotation Github repository 

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

Filename: testPlot.PDF
Description: An example of output that can be constructed using plotGeneTracks function in the test.R script. A color scale is provided at the topright corner of the plot, along with row and column annotation names if applicable. The scale is logarithmic, though not all ontologies are continuous measures. Fetal brain expression data are log2(Reads Per Kilobase per Million mapped reads) RNA-sequencing data from postmortem fetal brain samples, originating from BrainSpan Database. GWAS summary statistics are presented as -log10(p-values). Gene-wide interolerance to loss-of-function mutations were obtained from Exome Aggregation Consortium, and presented as -log10(P-values). 

# Notices:

*Advanced users*
You may wish to access and edit the data set that I have compiled to include your own raw data or ontologies. 
It is possible to do so by editing the object "update.<version>" which is present in the environment after loading the source code. 
I don't recommend overwriting the .Rdata file for safety. 

## Updates:
version 1.2 - Druggable targets features the following disease categories: neuropsychiatric, neuroinflammation, neurodegenerative, autoimmune, cardiovascular, cancer, viral, pain, and inflammation

v1.2 June 1, 2016: plotGeneTracks now accepts choice of saving/not saving plot to file. fileWidth and fileHeight allow user to adjust dimensions of the heatmap (minimum recommended 12 x 10). 
```R
print(pDF) #returns a matrix of gene annotations.
```

version 1.3: plotGeneTracks now features gene expression data downloaded from GTEx across 48 tissues (RNA-seq v6). Read counts were normalized using limma's VOOM function (logCPM) followed by quantile normalization. 


