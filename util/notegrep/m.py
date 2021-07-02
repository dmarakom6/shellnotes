import sys

class Multi():

    def __init__(self, patterns, files):
        self.patterns = patterns
        self.files = files

    def print_matches(self, patterns, files):
        for pattern in patterns: print(pattern, end=", ")
        print()
        for file in files: print(file, end=", ")

try:    
    newMulti = Multi(sys.argv[1].split(','), sys.argv[2].split(','))
    newMulti.print_matches(sys.argv[1].split(','), sys.argv[2].split(','))
except IndexError:
    patterns = input("Enter patterns, separated by a comma: ")
    files = input("Enter files, separated by a comma: ")
    newMulti = Multi(patterns, files)
    newMulti.print_matches(patterns.split(','), files.split(','))
        