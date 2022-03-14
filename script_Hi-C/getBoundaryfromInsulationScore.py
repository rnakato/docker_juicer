#! /usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
import pandas as pd
import os
import argparse
import subprocess

def scan_boundary(d, thre):
    d["Boundary"] = False
    for i, row in d.iterrows():
        if row['InsulationScore'] > 0 and row['InsulationScore'] < thre:
            d.loc[i, 'Boundary'] = True

    return d

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input", help="Input", type=str)
    parser.add_argument("output", help="Output", type=str)
    parser.add_argument("--thre", help="Threshold for boundaries (default: 0.7)", type=float, default=0.7)

    args = parser.parse_args()

    file = args.input
    df = pd.read_csv(file, header=None, sep="\t")
    df.columns = ["chromosome", "start", "end", "InsulationScore"]

    thre = args.thre
    df = scan_boundary(df, thre)

    output = args.output
    outputtemp = output + ".temp"
    bdry = df[df["Boundary"]]
    bdry[["chromosome", "start", "end"]].to_csv(outputtemp, sep="\t", header=False, index=False)

    subprocess.call(" bedtools merge -d 1 -i " + outputtemp + " > " + output, shell=True)
    os.remove(outputtemp)

if(__name__ == '__main__'):
    main()
