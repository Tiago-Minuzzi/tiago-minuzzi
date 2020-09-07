#!/usr/bin/python
# -*- coding: utf-8 -*-
# Written by Tiago Minuzzi
# List directories and files

import os

# os.chdir(('/home/minuzzi/desktop'))
# print os.getcwd()

def ls(path = '.'):
    for dirf in os.listdir(path):
        if not dirf.startswith('.'):
            # print os.listdir(path)
            print dirf
ls()
ls('/home/minuzzi/Dropbox')
