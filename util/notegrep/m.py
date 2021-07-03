#!/usr/bin/env python3

#shellnotes - m.py
#(C) Dimitris Marakomihelakis
#Released under the "All rights reserved" category. See the RIGHTS.txt file
#in /docs/github/ for its full text.

import sys
import os.path
from os import path
import subprocess
from subprocess import check_output
import re

class Multi():

    def __init__(self, patterns, files):
        self.patterns = patterns
        self.files = files

    def remove_duplicates(self):
        self.patterns, self.files = list(dict.fromkeys(self.patterns)), list(dict.fromkeys(self.files))

    def remove_spaces(self):
        self.patterns, self.files = [elem.strip(' ') for elem in self.patterns], [elem.strip(' ') for elem in self.files]

    def print_matches(self):
        
        for file in self.files:
            try:
                if file == "": return 0
                print("\n"+file if path.exists('Notes/'+file) else f"\n{file} (not found):\n-", flush=True)
                print("=" * len(file) if path.exists('Notes/'+file) else "", flush=True)
        
                for pattern in self.patterns:
                    if pattern == "": return 0
                    with open('Notes/'+file, 'r') as f:
                        for line in f:
                            if re.search(pattern, line):
                                out = os.system(f"""echo -n "'\033[1;35;40m{pattern}\033[0;37;0m'": && grep -n --color=always {pattern} Notes/{file}""")
                                #bug: pattern is generated multiple times

            except FileNotFoundError: pass
        
        
def main():
    try:    
        newMulti = Multi(sys.argv[1].split(','), sys.argv[2].split(','))
        newMulti.remove_duplicates()
        newMulti.remove_spaces()
        newMulti.print_matches()
    except IndexError:
        patterns = input("Enter patterns, separated by a comma: ")
        files = input("Enter files, separated by a comma: ")
        newMulti = Multi(patterns.split(','), files.split(','))
        newMulti.remove_duplicates()
        newMulti.remove_spaces()
        newMulti.print_matches()
        

if __name__ == "__main__":    
    main()
