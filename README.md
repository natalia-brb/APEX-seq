# Proximity-Dependent Transcriptomic Profiling in Yeast

This repository provides an **RNA-Seq analysis pipeline** for **APEX-labeled** yeast samples, enabling **partially restricted and subcellular transcriptome mapping** through a **GFP pulldown** approach. Libraries are prepared using **Illumina TruSeq® Stranded Total RNA** protocols, followed by **differential expression** and **enrichment analysis** to reveal localized mRNA populations.

---

## **Key Highlights**
- **Subcellular Transcriptome Mapping**: Focus on partially restricted transcriptome profiling in yeast using proximity-dependent labeling.  
- **GFP Pulldown Strategy**: APEX-labeled proteins tagged with GFP enable specific capture and isolation of transcripts in close proximity to the tagged protein.  
- **Comprehensive RNA-Seq Pipeline**: Includes data preprocessing, alignment, quantification, differential expression, and pathway enrichment analyses.

---

## **Repository Structure**
├── data/ # (Optional) Example or test data 
├── scripts/ # Bash and R scripts for processing & analysis 
├── results/ # Output files, figures, and logs 
├── docs/ # Additional documentation or references 
└── README.md # Project description and usage instructions


---

## **Usage Instructions**
1. **Clone this repository**:
   ```bash
   git clone https://github.com/YourUsername/yeast-apex-transcriptome.git
   cd yeast-apex-transcriptome
2. Install Dependencies (e.g., FastQC, Trimmomatic/Cutadapt, HISAT2/STAR, DESeq2, etc.).
3. Run Scripts in scripts/ directory to:
Perform QC (FastQC)
Trim reads (Trimmomatic or Cutadapt)
Align reads (HISAT2 or STAR)
Quantify and analyze differentially expressed genes (DESeq2)


## Project Goals

Map the Subcellular Transcriptome in Yeast: Identify mRNAs enriched in specific subcellular niches through proximity labeling.
Partially Restricted Transcriptome Profiling: Capture a subset of transcripts closely associated with GFP-tagged proteins.
Differential Expression & Enrichment Analysis: Uncover biological functions and pathways linked to spatially enriched RNAs.

## Dependencies & Tools

FastQC, Trimmomatic/Cutadapt (for QC and adapter trimming)
HISAT2/STAR (read alignment)
SAMtools (alignment manipulation)
FeatureCounts/HTSeq (quantification)
DESeq2 (differential expression analysis in R)
ggplot2, pheatmap (visualizations)


## License

You are free to use and modify this pipeline as permitted under the MIT License (or another license if preferred).

Maintainer: Natalia Barbosa – natalia.brbsa@gmail.com
Feel free to submit issues or pull requests to contribute to this project.
