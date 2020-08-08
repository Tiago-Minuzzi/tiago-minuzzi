#!/usr/bin/bash

TMP3="id.mos3.txt"
TMP5="id.mos5.txt"
TMP32="id.mos32.txt"
TMP52="id.mos52.txt"
FMOS3="*_mos3_overlap.csv"
FMOS32="*_mos3_overlap2.csv"

for MOS3 in $FMOS3
do
    IDAM=${MOS3%_mos3_overlap.csv}
    MOS5=${MOS3%_mos3_overlap.csv}_mos5_overlap.csv
    MOS8=${MOS3%_mos3_overlap.csv}_moscat_ov.txt    
    if [ -f $MOS5 ]
        then
        cut -f8 $MOS3 -d" " | sed '1d;s/^\\"//;s/\\"\;//' | sort > "$IDAM"_$TMP3
        cut -f8 $MOS5 -d" " | sed '1d;s/^\\"//;s/\\"\;//' | sort > "$IDAM"_$TMP5
        cat "$IDAM"_$TMP3 "$IDAM"_$TMP5 | sort > $MOS8 && rm "$IDAM"_$TMP3 "$IDAM"_$TMP5
        uniq -c $MOS8 | sed 's/^[ \t]*//' | sort -rn > ${MOS8%_moscat_ov.txt}.count_ov.txt
        uniq -d $MOS8 > ${MOS8%_moscat_ov.txt}.repeated_ov.txt
        uniq -u $MOS8 > ${MOS8%_moscat_ov.txt}.single_ov.txt
        mkdir -p "$IDAM"_ov && mv "$IDAM"*_overlap.csv "$IDAM"*_ov.txt "$IDAM"_ov
    fi
done

for MOS32 in $FMOS32
do
    IDAM2=${MOS32%_mos3_overlap2.csv}
    MOS52=${MOS32%_mos3_overlap2.csv}_mos5_overlap2.csv
    MOS82=${MOS32%_mos3_overlap2.csv}_moscat_ov2.txt    
    if [ -f $MOS52 ]
        then
        cut -f8 $MOS32 -d" " | sed '1d;s/^\\"//;s/\\"\;//' | sort > "$IDAM2"_$TMP32
        cut -f8 $MOS52 -d" " | sed '1d;s/^\\"//;s/\\"\;//' | sort > "$IDAM2"_$TMP52
        cat "$IDAM2"_$TMP32 "$IDAM2"_$TMP52 | sort > $MOS82 && rm "$IDAM2"_$TMP32 "$IDAM2"_$TMP52
        uniq -c $MOS82 | sed 's/^[ \t]*//' | sort -rn > ${MOS82%_moscat_ov2.txt}.count_ov2.txt
        uniq -d $MOS82 > ${MOS82%_moscat_ov2.txt}.repeated_ov2.txt
        uniq -u $MOS82 > ${MOS82%_moscat_ov2.txt}.single_ov2.txt
        mkdir -p "$IDAM2"_ov2 && mv "$IDAM2"*_overlap2.csv "$IDAM2"*_ov2.txt "$IDAM2"_ov2
    fi
done