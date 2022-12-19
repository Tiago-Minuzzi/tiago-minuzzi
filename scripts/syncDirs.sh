#!/usr/bin/env bash

INDIR=$1
OUDIR=$2

rsync -avhP --delete ${INDIR}/* ${OUDIR}
