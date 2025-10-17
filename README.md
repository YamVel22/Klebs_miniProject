🧬 Klebsiella pneumoniae Genome Assembly & Variant Analysis — Mini Project
📖 Overview

This project focuses on the genomic analysis of Klebsiella pneumoniae using Illumina paired-end reads.
It demonstrates the complete workflow from raw read quality control to genome assembly, quality assessment, and variant calling, following clean, reproducible bioinformatics practices.

The aim was to apply core genomics tools and Linux-based bioinformatics skills to process bacterial genome data end-to-end.

🧫 Objectives

Perform read quality assessment using FastQC

Trim adapters and low-quality reads with Trim Galore

Assemble the genome using SPAdes

Assess assembly quality with QUAST

Align reads to a reference genome using BWA and Samtools

Call SNPs and small variants using bcftools

Document a reproducible pipeline version-controlled with Git

🧩 Dataset

Organism: Klebsiella pneumoniae

Sample: SRR35784662 (Illumina paired-end)

Reference Genome: Klebsiella pneumoniae subsp. pneumoniae MGH 78578

Accession: GCF_000009885.1

Source: NCBI RefSeq


⚙️ Tools & Dependencies
Tool	Purpose	Installation
FastQC	Quality check of raw reads	sudo apt install fastqc
Trim Galore	Adapter trimming	conda install -c bioconda trim-galore
SPAdes	Genome assembly	conda install -c bioconda spades
QUAST	Assembly evaluation	conda install -c bioconda quast
BWA	Read alignment	conda install -c bioconda bwa
Samtools	File manipulation and coverage analysis	conda install -c bioconda samtools
bcftools	Variant calling and filtering	conda install -c bioconda bcftools

🧠 Workflow Summary
1️⃣ Quality Control (FastQC)
mkdir -p 04_QC/fastqc
fastqc 01_rawdata/*.fastq -o 04_QC/fastqc

2️⃣ Read Trimming (Trim Galore)
trim_galore --paired \
  01_rawdata/SRR35784662_1.fastq 01_rawdata/SRR35784662_2.fastq \
  -o 02_trimmed/

3️⃣ Genome Assembly (SPAdes)
spades.py -1 02_trimmed/SRR35784662_1_val_1.fq \
          -2 02_trimmed/SRR35784662_2_val_2.fq \
          -o 03_assembly/

4️⃣ Assembly Quality Assessment (QUAST)
quast.py 03_assembly/contigs.fasta \
  -r reference/Klebsiella_reference.fasta \
  -o 04_QC/quast/

5️⃣ Alignment to Reference (BWA + Samtools)
bwa index reference/Klebsiella_reference.fasta
bwa mem reference/Klebsiella_reference.fasta \
  02_trimmed/SRR35784662_1_val_1.fq 02_trimmed/SRR35784662_2_val_2.fq \
  > 05_analysis/SRR35784662.sam

samtools view -bS 05_analysis/SRR35784662.sam > 05_analysis/SRR35784662.bam
samtools sort 05_analysis/SRR35784662.bam -o 05_analysis/SRR35784662_sorted.bam
samtools index 05_analysis/SRR35784662_sorted.bam

6️⃣ Variant Calling (bcftools)
samtools mpileup -f reference/Klebsiella_reference.fasta 05_analysis/SRR35784662_sorted.bam > 05_analysis/SRR35784662.mpileup

bcftools call -mv -Ov -o 05_analysis/SRR35784662.vcf 05_analysis/SRR35784662.mpileup

7️⃣ Variant Filtering
bcftools filter -s LowQual -e '%QUAL<20 || DP<10' \
  05_analysis/SRR35784662.vcf -o 05_analysis/SRR35784662_filtered.vcf

📊 Example QUAST & Variant Results
Metric	Result
Total contigs (>500 bp)	127
N50	134,672 bp
Total genome size	~5.2 Mb
GC content	57.4%
Total variants detected	412
Filtered high-quality SNPs	376

(Actual values depend on dataset and parameters.)

🧩 Key Insights

The genome of Klebsiella pneumoniae was successfully assembled and aligned to the MGH 78578 reference genome.

High-quality SNPs were identified, showing genomic differences that may relate to strain-specific traits.

The workflow illustrates a complete bacterial genomics analysis pipeline from raw reads to variant interpretation.

🔁 Reproducibility

To reproduce this analysis:

# Clone repository
git clone git@github.com:YamVel22/KlebsMiniProject.git
cd KlebsMiniProject

# Create environment
conda create -n klebs_env -c bioconda fastqc trim-galore spades quast bwa samtools bcftools

# Activate environment
conda activate klebs_env


Then follow the workflow commands in sequence inside the respective directories.

🧪 Future Improvements

Annotate the assembled genome using Prokka or Bakta

Perform functional analysis of variants

Integrate phylogenetic comparison with other Klebsiella isolates

👩🏽‍💻 Author

Yamkelani Velaphi
🧬 BSc Life Sciences (Genetics & Microbiology)
💻 Aspiring Bioinformatician | AWS Certified | Cloud & Genomics Enthusiast
📍 South Africa
🔗 GitHub: @YamVel22

