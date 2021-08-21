#!/usr/bin/env python3

#shellnotes - m.py
#(C) Dimitris Marakomihelakis
#Released under the "All rights reserved" category. See the RIGHTS.txt file
#in /docs/github/ for its full text.

import sys
import os.path
from os import path
from os import listdir
import subprocess
from subprocess import check_output
import re

class Multi():

    def __init__(self, patterns, files):
        self.patterns = patterns
        self.files = files

    def check_empty(self):
        if "" in self.patterns: raise IndexError #asks for direct input

    def remove_duplicates(self):
        self.patterns, self.files = list(dict.fromkeys(self.patterns)), list(dict.fromkeys(self.files))

    def remove_dots(self):
        if len(self.files) >= 2:
            if '.' in self.files: self.files.remove('.')

    def remove_spaces(self):
        self.patterns, self.files = [elem.strip(' ') for elem in self.patterns], [elem.strip(' ') for elem in self.files]

    #def split_extras(self): #not using this for now
     #   if len(sys.argv) == 4:
      #      if "-i" in sys.argv[-1] or "--ignore" in sys.argv[-1]:
       #         re.sub(r'\s(--\ignore+|-\i)', '', sys.sys.argv[-1]) #remove everything from sys.argv[-1], except "-i" or "--ignore", if it exists.

    def print_matches(self):
        if self.files == ["."]:
            notes = os.path.expanduser('~') + '/Notes'
            self.files = [file for file in listdir(notes)]

        for file in self.files:
            try:
                if file == "": return 0
                print("\n"+file if path.exists('Notes/'+file) else f"\n{file} (not found):", flush=True)
                print("=" * len(file) if path.exists('Notes/'+file) else "-", flush=True)
        
                with open('Notes/'+file, 'r') as f:
                    text = f.read()
                    for pattern in self.patterns:
                        if re.search(pattern, text):
                            out = os.system(f"""echo -n "'\033[1;35;40m{pattern}\033[0;37;0m'": && grep -n --color=always {pattern} Notes/{file}""")
                        

            except FileNotFoundError: pass
        
        
def main():
    try:
        newMulti = Multi(sys.argv[1].split(','), sys.argv[2].split(','))
        newMulti.check_empty()
        newMulti.remove_spaces()
        newMulti.remove_duplicates()
        newMulti.remove_dots()
        newMulti.print_matches()
    except IndexError:
        patterns = input("Enter patterns, separated by a comma: ")
        files = input("Enter files, separated by a comma: ")
        newMulti = Multi(patterns.split(','), files.split(','))
        newMulti.remove_spaces()
        newMulti.remove_duplicates()
        newMulti.remove_dots()
        newMulti.print_matches()
        

if __name__ == "__main__":   
    main()
