#!/usr/bin/env python3

#shellnotes - m.py
#(C) Dimitris Marakomihelakis
#Released under the "All rights reserved" category. See the RIGHTS.txt file
#in /docs/github/ for its full text.

import sys
import os.path
from os import path
import subprocess

class Multi():

    def __init__(self, patterns, files):
        self.patterns = patterns
        self.files = files

    def print_matches(self):
        
        for file in self.files:
            if file == "": return 0
            print(file if path.exists('Notes/'+file) else f"{file} (not found):\n-")
            print("=" * len(file) if path.exists('Notes/'+file) else "")
        
        for pattern in self.patterns:
            if pattern == "": return 0
            #run grep...
        
        
def main():
    try:    
        newMulti = Multi(sys.argv[1].split(','), sys.argv[2].split(','))
        newMulti.print_matches()
    except IndexError:
        patterns = input("Enter patterns, separated by a comma: ")
        files = input("Enter files, separated by a comma: ")
        newMulti = Multi(patterns.split(','), files.split(','))
        newMulti.print_matches()
        

if __name__ == "__main__":
    main()
