for build in galGal5 #ce10 #hg19 hg38 mm10
do
    genome=/home/Database/UCSC/$build/genome.fa
    for enzyme in HindIII DpnII MboI; do
	python ../misc/generate_site_positions.py $enzyme $build $genome &
    done
done
