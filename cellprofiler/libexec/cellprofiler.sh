#!/bin/bash
export SINGULARITY_BINDPATH="$HOME/fileservers/chd"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="cellprofiler4.sif"
cmd=$(basename "$0")
arg="$@"
echo running: singularity exec "${dir}/${img}" $cmd $arg
singularity exec "${dir}/${img}" $cmd $arg