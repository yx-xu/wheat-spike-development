##For RNA-seq data
#quality control
fastp -i SampleName_R1.fq.gz -I SampleName_R2.fq.gz -o clean.SampleName_R1.fq.gz -O clean.SampleName_R2.fq.gz --detect_adapter_for_pe -w 4 --compression 9 -h SampleName.html -j SampleName.json

#mapping using hisat2
hisat2 -x cs.hisat -p 4 -1 SampleName.R1.clean.fq.gz -2 SampleName.R2.clean.fq.gz -S SampleName.sam
samtools view -@ 4 -bS SampleName.sam | samtools sort -@ 4 - -o SampleName.sorted.bam


#count using featureCount
featureCounts -T 4 -t exon -p -P -B -C -g gene_id -a IWGSC.gtf -o SampleName.feacount.txt SampleName.sorted.bam
