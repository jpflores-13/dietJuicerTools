#' Create an ATAC-seq data samplesheet for bagPipes
#'
#' @param Project A character value specifying which project the data is for
#' 
#' @param nSamples A numeric specifying the number of samples
#' 
#' @param nReps A numeric specifying the number of biological replicates
#'
#' @param Cell_Type A character value specifying which cell type you are using
#' 
#' @param Genotype A character, list, or vector value specifying which cell type you are using
#' 
#' @param Treatment A character value specifying the type of treatment done on cells
#' 
#' @param Time A character value specifying the amount of type cells have undergone treatment
#' 
#' @param Bio_Rep A numeric specifying how many biological replicates per unique genotype
#' 
#' @param Tech_Rep A numeric specifying how many technical replicates per biological replicate
#' 
#' @param Read1 A character value specifying the file path with the first .fq.gz file extension
#' 
#' @param Read2 A character value specifying the file path with the second .fq.gz file extension
#' 
#' @param Sequencing_Directory A character value specifying the file path housing the .fq.gz files
#' 
#' @return data.frame, .txt file
#' 
#' @export

atac_samplesheet <- function(Project, Cell_Type, nSamples, nReps, Treatment, Time, Genotype, Bio_Rep,
                             Tech_Rep, Read1, Read2, Sequencing_Directory){

  Project <- rep(as.character(Project), nSamples)
  Cell_Type <- rep(as.character(Cell_Type), nSamples)
  Genotype <- rep(as.character(Genotype, nReps))
  Treatment <- rep(as.character(Treatment, nReps))
  Time <- rep(as.character(Time, nReps))
  Bio_Rep <- length(unique(Genotype)) * nReps
  Tech_Rep <- as.numeric(Tech_Rep) # user-defined list
  Read1 <- rep("filename", nSamples) # user-defined paths
  Read2 <- rep("filename", nSamples) # user-defined paths
  Sequencing_Directory <- rep("filepath", nSamples) # user-defined paths
  samplesheet <- data.frame(Project, Cell_Type, Genotype, Bio_Rep,
                            Tech_Rep, Read1, Read2, Sequencing_Directory) |>
    readr::write_tsv(paste0(here::here(), "/ATACsamplesheet.txt"))

}
