#!/bin/bash

norm=$1
hic=$2
odir=$3
gt=$4
gene=$5

for res in 25000 50000 100000; do
    makeEigen.sh Eigen $norm $odir $hic $res $gt $gene
done
