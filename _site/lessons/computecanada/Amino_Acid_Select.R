setwd("/home/path/to/working_directory")

library(seqinr, lib.loc = "/home/path/to/package")

nucleotides<- sample(1:4, 300, replace = TRUE)

nucleotides<- gsub("1","A", nucleotides)
nucleotides<- gsub("2","C", nucleotides)
nucleotides<- gsub("3","G", nucleotides)
nucleotides<- gsub("4","T", nucleotides)

amino_acids<- translate(nucleotides)
amino_acids<- paste(amino_acids, sep = "", collapse = "")

writeLines(amino_acids, "amino_acids.txt", sep = "")
