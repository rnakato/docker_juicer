Datadir=/work/Database
ncore=32


odir=$1
label=$(basename $odir)
build=$2
enzyme=$3
fastq_post=$4

jdir=/opt/juicer
gt=$Datadir/UCSC/$build/genome_table
bwaindex=$Datadir/bwa-indexes/UCSC-$build

bash $jdir/CPU/juicer.sh -t $ncore -g $build -d $odir \
     -s $enzyme -a $label -p $gt \
     -z $bwaindex -D $jdir -e $fastq_post -S map

bash $jdir/CPU/juicer.sh -t $ncore -g $build -d $odir \
     -s $enzyme -a $label -p $gt \
     -z $bwaindex -D $jdir -e $fastq_post -S aftermap
