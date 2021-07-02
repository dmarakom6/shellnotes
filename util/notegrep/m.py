import sys

class Multi():

    def __init__(self, patterns, files):
        self.patterns = patterns
        self.files = files

    def print_matches(self, patterns, files):
        error = "Invalid input.\nExample: shellnotes -m pattern1,pattern2,pattern3 file1,file2,file3"
        for pattern in patterns:
            if pattern == "": return error
            print(pattern, end=", ")
        print()
        for file in files:
            if file == "": return error
            print(file, end=", ")

try:    
    newMulti = Multi(sys.argv[1].split(','), sys.argv[2].split(','))
    newMulti.print_matches(sys.argv[1].split(','), sys.argv[2].split(','))
except IndexError:
    patterns = input("Enter patterns, separated by a comma: ")
    files = input("Enter files, separated by a comma: ")
    newMulti = Multi(patterns.split(','), files.split(','))
    newMulti.print_matches(patterns.split(','), files.split(','))
        