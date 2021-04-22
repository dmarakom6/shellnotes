#!/usr/bin/env python3

#shellnotes - d.py
#(C) Dimitris Marakomihelakis
#Released under the "All rights reserved" category. See the RIGHTS.txt file
#in /docs/github/ for its full text.

import display
import subprocess
import sys
import os	
import time
from os import listdir
from os.path import isfile, join
from pathlib import Path


class cd:
    """Context manager for changing the current working directory"""
    
    def __init__(self, newPath):
        self.newPath = os.path.expanduser(newPath)

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)


folder = "cat ~/.shellnotes/util/sd/sd-input3.txt"
files = "eval echo $(cat ~/.shellnotes/util/sd/sd-input3.txt) | xargs ls | wc -l"


os.system(folder + "> ~/.shellnotes/util/listnotes/output/dir.txt 2> ~/.shellnotes/util/listnotes/output/direrr.txt")
os.system(files + "> ~/.shellnotes/util/listnotes/output/files.txt 2> ~/.shellnotes/util/listnotes/output/fileserr.txt" )

with cd("~/.shellnotes/util/listnotes/output"):
    with open("files.txt", 'r') as f:
        files = f.read()
    with open("dir.txt", 'r') as d:
        folder = d.read()

files = files.strip()
folder = folder.strip()

home = str(Path.home())
folder = folder.replace('~', home)

#print(f"\nFound {files} notes in {folder}:\n")
print("All notes in", folder + ":")

onlyfiles = [f for f in listdir(folder) if isfile(join(folder, f))]
for file in onlyfiles:
    display.underlined(file)
    path = folder + '/' + file
    listnotes = "head" + " -n" + " 5" +  " " + path + "\n"
    str(os.system(listnotes + "> ~/.shellnotes/util/listnotes/output/listnotes.txt"))
    print()
print("If your note is not shown, try 'findmisplacednote <notename>' to locate it.")

