#!/usr/bin/env python3
import sys

"""
Mock script to exemplify how to read the stdout from a linux pipe using python.
"""
argument: str = sys.stdin.read()

print(argument)
