chip_samplesheet <- function(Project, Cell_Type, Genotype, Bio_Rep,
                             Tech_Rep, Read1, Read2, Sequencing_Directory,
                             singleEnd = FALSE){

  Project <- rep(as.character(Project), nSamples)
  Cell_Type <- rep(as.character(Cell_Type), nSamples)
  Genotype <- rep(as.character(Genotype, nReps))
  Bio_Rep <- length(unique(Genotype)) * nReps
  Tech_Rep <- as.numeric(Tech_Rep) # user-defined list
  Read1 <- rep("filename", nSamples) # user-defined paths
  Read2 <- rep("filename", nSamples) # user-defined paths
  Sequencing_Directory <- rep("filepath", nSamples) # user-defined paths
  samplesheet <- data.frame(Project, Cell_Type, Genotype, Bio_Rep,
                            Tech_Rep, Read1, Read2, Sequencing_Directory)
  if(singleEnd == FALSE){
    readr::write_tsv(paste0(here::here(), "/ChIPsamplesheet.txt"))
  } else {
    readr::write_tsv(paste0(here::here(), "/ChIPsamplesheetSE.txt"))
  }
}
