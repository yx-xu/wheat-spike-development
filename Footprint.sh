#Identify footprints within atac-seq peaks
rgt-hint footprinting --atac-seq --paired-end --output-location=./ --output-prefix=SampleName.footprint --organism=IWGSC_v1.1 SampleName.bam SampleName.narrowPeak

#Scan motif within footprint
rgt-motifanalysis matching --filter "database:jaspar_plants" --input-files SampleName.footprint.bed --organism IWGSC_v1.1 --motif-dbs ~/rgtdata/motifs/jaspar_plants
