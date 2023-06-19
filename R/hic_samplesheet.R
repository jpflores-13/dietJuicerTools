hic_samplesheet <- function(Project, nSamples, nReps, Cell_Type, Genotype, Bio_Rep,
                            Tech_Rep, Read1, Read2, Sequencing_Directory,
                            merged_nodups, inter, inter30){

  Project <- rep(as.character(Project), nSamples)
  Cell_Type <- rep(as.character(Cell_Type), nSamples)
  Genotype <- rep(as.character(Genotype, nReps))
  Bio_Rep <- length(unique(Genotype)) * nReps
  Tech_Rep <- as.numeric(Tech_Rep) # user-defined list
  Read1 <- rep("filename", nSamples) # user-defined paths
  Read2 <- rep("filename", nSamples)
  Sequencing_Directory <- rep("filepath", nSamples)
  merged_nodups <- paste(Project, Cell_Type, Genotype, Bio_Rep, Tech_Rep, "dedup_merged_nodups.txt.gz", sep = "_")
  inter <- paste(Project, Cell_Type, Genotype, Bio_Rep, Tech_Rep, "inter.txt", sep = "_")
  inter30 <- paste(Project, Cell_Type, Genotype, Bio_Rep, Tech_Rep, "inter30.txt", sep = "_")
  samplesheet <- data.frame(Project, Cell_Type, Genotype, Bio_Rep,
                            Tech_Rep, Read1, Read2, Sequencing_Directory, merged_nodups, inter, inter30) |>
    readr::write_tsv(paste0(here::here(), "/samplesheet.txt"))

}
