#!/usr/bin/env bash

ARQ=$1
BIN="bin/${ARQ%.c}"

gcc -o $BIN $ARQ

./$BIN; rm $BIN
