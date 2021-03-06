


## Beta version of tool to visualize annotations across gene sets
## Author: Jonathan L. Hess, SUNY Upstate Medical University, 2016
## Contact: hessjo@upstate.edu



if("pheatmap" %in% rownames(installed.packages()) == FALSE) {install.packages("pheatmap")}
if("pheatmap" %in% rownames(installed.packages()) == TRUE) {require(pheatmap)}


plotGeneTracks <- function(geneSet = geneSet, brainRegions = brainRegions, gwasSet = gwasSet, saveFile = TRUE, fileWidth = fileWidth, fileHeight = fileHeight) {
  
  if(length(geneSet) > 1000){stop("It is not recommended to input >1000 genes at once. Please trim the list and try again...")}
 
  select.list = list()

  
  for( i in 1:length(update.1.4)){
    
    temp = update.1.4[[i]]
    
    matches = which(rownames(temp) %in% geneSet)
    
    if(ncol(temp) == 1){temp$gene_symbol = rownames(temp)}
    
    temp = temp[matches, ]
    
    select.list[[i]] = temp
    
  }
  
  lapply(select.list, head)
  
  
  
  early = paste(brainRegions, "_early", sep = "")
  mid = paste(brainRegions, "_mid", sep = "")
  late = paste(brainRegions, "_late", sep = "")
  
  regionNames = c(early, mid,late)
  
  temp = select.list[[2]]
  
  temp = temp[,colnames(temp) %in% regionNames]
  
  select.list[[2]] = temp
  
  
  
  
  
  ## bind all data into one matrix
  
  names = lapply(select.list, rownames)
  select.list = Map(cbind, select.list, gene_symbol = names)
  
  lapply(select.list, dim)
  
  ## choose GWAS data sets of interest 
  
  gwasSet = paste(gwasSet, "_logP", sep = "")
  temp = select.list[[3]]
  temp
  
  temp = temp[,colnames(temp) %in% c("gene_symbol", gwasSet)]
  select.list[[3]] = temp
  
  ###
  
  select.list[[4]] = select.list[[4]][,-3]
  
  plot.list = Reduce(function(x,y) merge(x,y, all = T), select.list)
  plot.list = plot.list[,!colnames(plot.list) %in% "y"]
  
  plot.list = plot.list[!duplicated(plot.list),]
  
  annot_col = c(rep("GTEx Tissue Expression", ncol(select.list[[1]])-1),
                rep("Fetal brain expression", ncol(select.list[[2]])-1), 
                rep("GWAS", ncol(select.list[[3]])-1), 
                rep("ExAC", 1), 
                rep("Human-Mouse disease connections", 4), 
                rep("Cell Markers", ncol(select.list[[6]])-1),
                rep("Subcellular localization", ncol(select.list[[7]])-1),
                rep("Druggable targets", ncol(select.list[[8]])-1))
  
  annot_col = as.matrix(annot_col)
  rownames(annot_col) = colnames(plot.list)[-1]
  annot_col = as.data.frame(annot_col)
  colnames(annot_col) = "Annotation tracks"
  
  annot_row=geneSet
  ar =  cbind(annot_row, geneClass)
  groups = as.data.frame(ar)
  nm = groups[,1]
  groups = groups[,2]
  groups = as.data.frame(groups)
  rownames(groups) = nm
  annot_row = groups
  plot.list = plot.list[match(rownames(groups), plot.list[,1]), ]
  
  rownames(plot.list) = plot.list$gene_symbol
  plot.list = plot.list[,-1]
  
  plot.list[plot.list == 0]  <- NA
  
  seq.gaps = lapply(select.list, ncol)
  seq.gaps = lapply(seq.gaps, function(x) x - 1)
  seq.gaps = cumsum(seq.gaps)
  seq.gaps = seq.gaps[-which(seq.gaps %in% max(seq.gaps))]
    
    
  annot_colors = c("darkred", "darkgreen","navy", "orange",
                  "purple", "chartreuse", "cadetblue3", "deeppink1")
  
  
  names(annot_colors) = unique(annot_col[,1])
  annot_colors = list("Annotation tracks" = annot_colors)
  
   hidden = "s"
  
  
  
  if(saveFile == TRUE){
    
    pdf(width = fileWidth, height = fileHeight)
  
  if(length(geneClass) > 0){
    pheatmap(plot.list, file = saveFileExtension, annotation_colors = annot_colors, col = colorRampPalette(c("white", "dodgerblue", "yellow", "firebrick"))(25), gaps_col = seq.gaps, annotation_names_row = FALSE, annotation_names_col = FALSE, annotation_col = annot_col, annotation_row = annot_row, cluster_col = FALSE, cluster_row = FALSE)
  }
  
  if(length(geneClass) == 0){
    pheatmap(plot.list, file = saveFileExtension, annotation_colors = annot_colors, col = colorRampPalette(c("white", "dodgerblue", "yellow", "firebrick"))(25), gaps_col = seq.gaps, annotation_names_row = FALSE, annotation_names_col = FALSE, annotation_col = annot_col, cluster_col = FALSE, cluster_row = FALSE)
  }
  
     dev.off()
  }
  
  if(saveFile == FALSE){
    
    
    if(length(geneClass) > 0){
      pheatmap(plot.list, col = colorRampPalette(c("white", "dodgerblue", "yellow", "firebrick"))(25), annotation_colors = annot_colors,  gaps_col = seq.gaps, annotation_names_row = FALSE, annotation_names_col = FALSE, annotation_col = annot_col, annotation_row = annot_row, cluster_col = FALSE, cluster_row = FALSE)
    }
    
    if(length(geneClass) == 0){
      pheatmap(plot.list,col = colorRampPalette(c("white", "dodgerblue", "yellow", "firebrick"))(25), annotation_colors = annot_colors, gaps_col = seq.gaps, annotation_names_row = FALSE, annotation_names_col = FALSE, annotation_col = annot_col, cluster_col = FALSE, cluster_row = FALSE)
    }
    
  }
  
  pDF <<- plot.list
  
}

