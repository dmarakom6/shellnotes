"""
SnE - Shellnotes Notes Editor
Developed by Dimitris Marakomichelakis
"""

import tkinter as tk
from tkinter import ttk
from tkinter import *
from functools import partial
from tkinter import messagebox
from tkinter import filedialog
from tkinter import simpledialog
import tkinter.font as tkFont
from pathlib import Path
import sys
import os
import time
import pyttsx3
import enchant
from ttkthemes import ThemedTk
import pastebin
from dotenv import load_dotenv
from gist import create_gist
from loguru import logger

load_dotenv() #.env must contain the GH_TOKEN variable, set via shellnotes --set-github-token
default_path = os.environ.get("DEFAULT_PATH")

def _log(level, message):
    log_dir = os.path.expanduser("~/.shellnotes/logs/sne")  # Use a valid path for the log directory
    os.makedirs(log_dir, exist_ok=True)  # Create the directory if it doesn't exist
    log_path = os.path.join(log_dir, f"logfile_{time}.log")
    logger.add(log_path)
    # print(log_path)

    if level == "TRACE":
        logger.trace(message)
    elif level == "DEBUG":
        logger.debug(message)
    elif level == "INFO":
        logger.info(message)
    elif level == "SUCCESS":
        logger.success(message)
    elif level == "WARNING":
        logger.warning(message)
    elif level == "ERROR":
        logger.error(message)
    elif level == "CRITICAL":
        logger.info(message)
    else:
        return "Failed to log"



class Container(Text):
    """
    A TextWidget with horizontal and vertical scrollbars
    """

    def __init__(self, master=None, **kw):
        self.frame = ttk.Frame(master)
        self.vbar = ttk.Scrollbar(self.frame, command=self.yview)
        self.vbar.pack(side=RIGHT, fill=Y)
        self.hbar = ttk.Scrollbar(
            self.frame, orient="horizontal", command=self.xview)
        self.hbar.pack(side=BOTTOM, fill=X)
        kw.update({'yscrollcommand': self.vbar.set})
        kw.update({'xscrollcommand': self.hbar.set})
        Text.__init__(self, self.frame, **kw)
        self.pack(side=LEFT, fill=BOTH, expand=True)
        text_meths = vars(Text).keys()
        methods = vars(Pack).keys() | vars(Grid).keys() | vars(Place).keys()
        methods = methods.difference(text_meths)

        for m in methods:
            if m[0] != '_' and m != 'config' and m != 'configure':
                setattr(self, m, getattr(self.frame, m))

    def __str__(self):
        return str(self.frame)


class Editor:
    """
    Base Class of Editor
    """
    window = ThemedTk()
    style = ttk.Style()
    window.title("SnE")
    # window.geometry(
    #     "{0}x{1}+0+0".format(window.winfo_screenwidth(),
    #                          window.winfo_screenheight()))
    window.geometry("500x500")
    menuBar = Menu(window)
    #The text and entry frames column
    window.grid_columnconfigure(1, weight=1)
    window.grid_rowconfigure(0, weight=1)
    #Menu bar
    window.config(menu=menuBar)
    fileMenu = Menu(menuBar, tearoff=0)
    editMenu = Menu(menuBar, tearoff=0)
    viewMenu = Menu(menuBar, tearoff=0)
    toolMenu = Menu(menuBar, tearoff=0)
    helpMenu = Menu(menuBar, tearoff=0)
    txt = Container(window, undo=True)
    txt.grid(row=0, column=1, sticky="NSEW")
    lineNumber = Canvas(window, width="30", height="500")
    lineNumber.grid(row=0, column=0, sticky='NS', pady=1, rowspan=3)
    charCount = StringVar()
    charCount.set("Characters: 0")
    statusBar = ttk.Label(window, textvariable=charCount)
    statusBar.grid(row=2, column=1, columnspan=2, sticky="EW")
    txt['wrap'] = 'none'
    fontType = "Helvetica"
    fontSize = "15"
    fontColor = "black"
    fontWeight = "normal"
    txt.configure(font=(fontType, fontSize, fontWeight))
    currentFile = "No File"

    def __init__(self):
      # Disable default bindings for Ctrl+C and Ctrl+V
        self.txt.unbind("<Control-c>")
        self.txt.unbind("<Control-v>")

        self.fileMenu.add_command(
            label="New", command=self.new_file, accelerator="Ctrl+N")
        self.window.bind_all('<Control-n>', self.new_file)
        # self.fileMenu.add_command(
        #     label="Open", command=self.open_file, accelerator="Ctrl+O")
        # self.window.bind_all('<Control-o>', self.open_file)
        self.fileMenu.add_command(
            label="Save", command=self.save_file,  accelerator="Ctrl+S")
        self.window.bind_all('<Control-s>', self.save_file)
        self.fileMenu.add_command(
            label="Save As", command=self.save_file_as,
            accelerator="Ctrl+Shift+S")
        self.window.bind_all('<Control-S>', self.save_file_as)
        self.fileMenu.add_command(label="Exit", command=self.exit)
        self.menuBar.add_cascade(label="File", menu=self.fileMenu)
        self.editMenu = Menu(self.menuBar, tearoff=0)
        self.editMenu.add_command(label="Cut", command=self.cut)
        self.editMenu.add_command(
            label="Copy", command=self.copy, accelerator="Ctrl+C")
        self.window.bind_all('<Control-c>', self.copy)
        self.editMenu.add_command(
            label="Paste", command=self.paste, accelerator="Ctrl+V")
        self.window.bind_all('<Control-v>', self.paste)
        self.editMenu.add_command(
            label="Undo", command=self.undo, accelerator="Ctrl+Z")
        self.window.bind_all('<Control-z>', self.undo)
        self.editMenu.add_command(
            label="Redo", command=self.redo, accelerator="Ctrl+R")
        self.window.bind_all('<Control-r>', self.redo)
        
        
        self.toolMenu = Menu(self.menuBar, tearoff=0)
        self.toolMenu.add_command(
            label="Find", command=self.find, accelerator="Ctrl+F")
        self.window.bind_all('<Control-f>', self.find)
        self.toolMenu.add_command(
            label="Replace All...", command=self.replace,
            accelerator="Ctrl+Shift+R")
        self.window.bind_all('<Control-R>', self.replace)
        self.toolMenu.add_command(
            label="Paste on Pastebin", command=self.paste_on)
        self.toolMenu.add_command(
            label="Paste on Github Gists", command=self.gist)
        self.toolMenu.add_command(label="Read Aloud", command=self.speak)
        self.toolMenu.add_command(
            label="Spell Check", command=self.spell_check)

        self.menuBar.add_cascade(label="Edit", menu=self.editMenu)
        self.menuBar.add_cascade(label="View", menu=self.viewMenu)
        self.menuBar.add_cascade(label="Tools", menu=self.toolMenu)
        self.helpMenu.add_command(label="About", command=self.about)
        self.menuBar.add_cascade(label="Help", menu=self.helpMenu)
        self.window.bind_all('<Return>', self.redraw)
        self.window.bind_all('<BackSpace>', self.redraw)
        self.window.bind_all('<Key>', self.redraw)
        self.window.bind_all('<Button-4>', self.redraw)
        self.window.bind_all('<Button-5>', self.redraw)
        self.window.bind_all('<Configure>', self.redraw)
        self.window.bind_all('<Motion>', self.redraw)
        self.editMenu.add_command(
            label="Select All", command=self.selectall, accelerator="Ctrl+A")
        self.window.bind_all('<Control-a>', self.selectall)
        
        fontFamily = Menu(self.viewMenu)
        fontFamily.add_command(label="Helvetica (Default)", command=partial(
            self.change_font_family, "Helvetica"))
        fontFamily.add_command(label="Ubuntu", command=partial(
            self.change_font_family, "Ubuntu"))
        fontFamily.add_command(label="Times New Roman", command=partial(
            self.change_font_family, "Times New Roman"))
        fontFamily.add_command(label="Comic Sans MS", command=partial(
            self.change_font_family, "Comic Sans MS"))
        fontFamily.add_command(label="Terminal", command=partial(
            self.change_font_family, "Terminal"))
        self.viewMenu.add_cascade(label="Font Family", menu=fontFamily)

        self.viewMenu.add_command(label="Font Size", command=self.change_font_size)

        # self.viewMenu.add_command(label="Font Weight", command=self.change_font_weight)
        fontWeightMenu = Menu(self.viewMenu)
        fontWeightMenu.add_command(label="Normal", command=lambda: self.change_font_weight("normal"))
        fontWeightMenu.add_command(label="Bold", command=lambda: self.change_font_weight("bold"))
        self.viewMenu.add_cascade(label="Font Weight", menu=fontWeightMenu)


        themeBar = Menu(self.viewMenu)
        themeBar.add_command(label="Black", command=partial(
            self.change_theme, "black"))
        themeBar.add_command(label="White", command=partial(
            self.change_theme, "white"))
        themeBar.add_command(label="Aqua", command=partial(
            self.change_theme, "aqua"))
        themeBar.add_command(label="Matrix", command=partial(
            self.change_theme, "matrix"))
        themeBar.add_command(label="SnE Original", command=partial(
            self.change_theme, "sne"))
        self.viewMenu.add_cascade(label="Themes", menu=themeBar)

        if len(sys.argv) > 1:
            self.open_specific_file(f"{default_path}/{sys.argv[1]}")  # Open the specified file


        self.window.mainloop()

    def new_file(self, event=None):
        if(messagebox.askyesno("Save?", "Do you wish to save current file?")):
            self.save_file()
            self.txt.delete('1.0', END)
            self.window.title("SnE - New File")
            self.currentFile = "No File"
        else:
            self.txt.delete('1.0', END)
            self.window.title("SnE")
            self.currentFile = "No File"

    def open_file(self, event=None):
        # print("Opening file")
        myFile = filedialog.askopenfile(
            parent=self.window, mode="rb", title="Open a Note")
        if myFile is not None:
            self.window.title(os.path.basename(myFile.name))
            content = myFile.read()
            self.txt.delete('1.0', END)
            self.txt.insert(1.0, content)
            self.currentFile = myFile.name
            _log("SUCCESS", f"Opened Note {self.currentFile}")
            myFile.close()
            self.redraw(event)
        else:
            _log("ERROR", f"Note filename is empty ({self.currentFile=})")

    def open_specific_file(self, file_path):
        try:
            with open(file_path, "rb") as myFile:
                self.window.title(os.path.basename(myFile.name))
                content = myFile.read()
                self.txt.delete('1.0', END)
                self.txt.insert(1.0, content)
                self.currentFile = myFile.name
                _log("SUCCESS", f"Opened Note {self.currentFile}")
                self.redraw(event)
        except Exception as e:
            _log("ERROR", f"Failed to open (specific) file: {str(e)}")


    # def save_file_as(self, event=None):
    #     # print("Saving file")
    #     myFile = filedialog.asksaveasfile(mode="w")
    #     if myFile is not None:
    #         myFile.write(self.txt.get('1.0', END))
    #         self.currentFile = myFile.name
    #         _log("SUCCESS", f"Saved New Note {self.currentFile}")
    #         myFile.close()
    #         self.window.title(os.path.basename(myFile.name))


    def save_file_as(self, event=None):
        try:
            # Read initial_directory from sd-input3.txt
            with open(os.path.expanduser("~/.shellnotes/util/shellnotes/sd/sd-input3.txt")) as f:
                initial_directory = f.read().strip()

            # Prompt the user for a file name
            file_name = simpledialog.askstring("Save As", "Enter a file name:")
            if not file_name:
                _log("ERROR", f"No note name specified ({file_name=})")
                return

            # Construct the full file path using initial_directory and file_name
            full_directory = os.path.expanduser(initial_directory)
            file_path = os.path.join(full_directory, file_name)

            # Open and write to the file
            with open(file_path, "w+") as myFile:
                myFile.write(self.txt.get('1.0', END))
                self.currentFile = file_path
                _log("SUCCESS", f"Saved New Note {self.currentFile}")
                self.window.title(os.path.basename(self.currentFile))
        except Exception as e:
            # Handle any errors that might occur while saving
            _log("ERROR", f"Failed to save: {str(e)}")


    def save_file(self, event=None):
        # print(self.currentFile)
        if (self.currentFile == "No File"):
            self.save_file_as(event)
        else:
            myFile = open(self.currentFile, "w")
            myFile.write(self.txt.get('1.0', END))
            _log("SUCCESS", f"Saved Note {self.currentFile}")
            myFile.close()
 

    
    def copy(self, event=None):
        # print("copying")
        self.txt.clipboard_clear()
        self.txt.clipboard_append(self.txt.selection_get())
        _log("INFO", f"Copied: {self.txt.selection_get()}")

    def cut(self, event=None):
        self.copy()
        self.txt.delete(SEL_FIRST, SEL_LAST)

    def paste(self, event=None):
        try:
            # Delete the selected text, if any
            sel_start = self.txt.index("sel.first")
            sel_end = self.txt.index("sel.last")
            if sel_start and sel_end:
                self.txt.delete(sel_start, sel_end)

            # Paste the clipboard content at the cursor position
            self.txt.insert(INSERT, self.txt.clipboard_get())
            self.redraw(event)
        except:
            pass

    def undo(self, event=None):
        self.txt.edit_undo()

    def redo(self, event=None):
        self.txt.edit_redo()

    def find(self, event=None):
        root = Toplevel(self.window)
        root.title("notegrep")
        root.transient(self.window)
        root.focus_force()
        root.grid_columnconfigure(0, weight=1)
        root.grid_rowconfigure(0, weight=1)
        e1 = ttk.Entry(root)
        e1.grid(row=0, column=0, pady="10",
                padx="10", columnspan=2, sticky="EW")

        def sub():
            findString = e1.get()
            self.set_mark(findString)

        def on_closing():
            self.txt.tag_delete('highlight')
            root.destroy()

        findBtn = ttk.Button(root, text="Find...", command=sub)
        findBtn.grid(row=1, column=0, pady="10", padx="10", sticky="EWS")
        closeBtn = ttk.Button(root, text="Close", command=on_closing)
        closeBtn.grid(row=1, column=1, pady="10", padx="10", sticky="EWS")
        root.protocol("WM_DELETE_WINDOW", on_closing)

    def paste_on(self, event=None):
        def copy_link(self, link):
            self.txt.clipboard_clear()
            self.txt.clipboard_append(link)
        root = Toplevel(self.window)
        root.title("PasteBin Link")
        root.transient(self.window)
        root.focus_force()
        root.grid_columnconfigure(0, weight=1)
        root.grid_rowconfigure(0, weight=1)
        link = pastebin.pastebin(self.txt.get('1.0', END))
        _log("SUCCESS", f"Uploaded Note to pastebin ({link})")
        lb = ttk.Label(root, text=link)
        lb.grid(row=0, column=0, padx="50", pady="20")
        bt = ttk.Button(root, text="Copy", command=copy_link(self, link))
        bt.grid(row=1, column=0, padx="50", pady="20")


    def gist(self, event=None):
        def copy_link(link):
            self.txt.clipboard_clear()
            self.txt.clipboard_append(link)
        try:
            text = self.txt.get('1.0', END)
            token = os.getenv("GH_TOKEN")
            if not token:
                messagebox.showerror("Error", "GH_TOKEN not set. You can set it using the shellnotes --set-github-token")
                _log("ERROR", "No github token.")

        except:
            raise RuntimeError("GH_TOKEN not set")



        try:
            link = create_gist(text, token)
            _log("SUCCESS", f"Uploaded Note to Github Gists ({link})")
            root = Toplevel(self.window)
            root.title("Github Gists Link")
            root.transient(self.window)
            root.focus_force()
            root.grid_columnconfigure(0, weight=1)
            root.grid_rowconfigure(0, weight=1)

            lb = ttk.Label(root, text=link)
            lb.grid(row=0, column=0, padx="50", pady="20")
            bt = ttk.Button(root, text="Copy", command=lambda: copy_link(link))
            bt.grid(row=1, column=0, padx="50", pady="20")

        except Exception as e:
            messagebox.showerror("Error", str(e))
            _log("ERROR", f"Couldn't upload to Github Gists ({str(e)})")
            

    def selectall(self, event=None):
        self.txt.tag_add('sel', '1.0', 'end')
        return "break"

    def set_mark(self, findString):
        print("Coming to set mark")
        self.find_string(findString)
        self.txt.tag_config('highlight', foreground='red')
        self.txt.focus_force()

    def find_string(self, findString):
        startInd = '1.0'
        while(startInd):
            startInd = self.txt.search(findString, startInd, stopindex=END)
            if startInd:
                startInd = str(startInd)
                lastInd = startInd+f'+{len(findString)}c'
                print(startInd, lastInd)
                self.txt.tag_add('highlight', startInd, lastInd)
                startInd = lastInd

    def replace(self, event=None):
        # print("About to replace using notegrep")
        root = Toplevel(self.window)
        root.title("Find and Replace")
        root.transient(self.window)
        root.focus_force()
        root.grid_columnconfigure(0, weight=1)
        root.grid_rowconfigure(0, weight=1)
        e1 = ttk.Entry(root)
        e1.grid(row=0, column=0, pady=5, columnspan=2, padx=10)
        e2 = ttk.Entry(root)
        e2.grid(row=1, column=0, pady=5, columnspan=2, padx=10)

        def find():
            findString = e1.get()
            self.set_mark(findString)

        def replace():
            findString = e1.get()
            replaceString = e2.get()
            myText = self.txt.get('1.0', END)
            myText = myText.replace(findString, replaceString)
            self.txt.delete('1.0', END)
            self.txt.insert('1.0', myText)
            root.destroy()

        def on_closing():
            self.txt.tag_delete('highlight')
            root.destroy()

        findButton = ttk.Button(root, text="Find", command=find)
        replaceButton = ttk.Button(root, text="Replace", command=replace)
        findButton.grid(row=2, column=0, padx=10, pady=5)
        replaceButton.grid(row=2, column=1, padx=10, pady=5)
        root.protocol("WM_DELETE_WINDOW", on_closing)

    def redraw(self, event=NONE):
        self.update_count(event)
        self.lineNumber.delete("all")
        self.objectIds = []
        si = self.txt.index("@0,0")
        while True:
            dline = self.txt.dlineinfo(si)
            if dline is None:
                break
            y = dline[1]
            liNum = str(si).split(".")[0]
            self.lineNumber.create_text(
                2, y, anchor="nw", text=liNum, fill=self.fontColor)
            si = self.txt.index(f"{si}+1line")

    def update_count(self, event):
        count = self.txt.get('1.0', END)
        self.charCount.set(f"Characters: {len(count)-1}")



    def speak(self):
        """Read selected text aloud. Reads the whole note if nothing is selected."""
        engine = pyttsx3.init()
        try:
            selected_text = self.txt.selection_get()
            engine.say(selected_text)
        except tk.TclError:
            # If no text is selected, read the entire content of the text widget
            engine.say(self.txt.get("1.0", END))
        engine.runAndWait()

    def spell_err(self, findString):
        """Check for Spelling Errors"""
        startInd = '1.0'
        while True:
            startInd = self.txt.search(findString, startInd, stopindex=END, nocase=True)
            if not startInd:
                break
            endInd = f"{startInd}+{len(findString)}c"
            self.txt.tag_add('misspelled', startInd, endInd)
            startInd = endInd

    def spell_check(self, event=NONE):
        print("Running Spell check")
        self.txt.tag_delete('misspelled')
        words = set(self.txt.get('1.0', "end-1c").split())  # Use a set to store unique words
        for word in words:
            if not self.word_exist(word):
                self.spell_err(word)

        self.txt.tag_config('misspelled', background="red", foreground="white")


    def word_exist(self, word):
        d = enchant.Dict("en_US")
        return d.check(word)

    def change_theme(self, theme):
        if (theme == "black"):
            self.fontColor = "white"
            self.window['theme'] = 'black'
            self.txt.config(bg="black", fg="white", insertbackground="white")
            self.txt['fg'] = 'white'
            self.lineNumber.config(bg="black")
            self.menuBar.config(bg="black", fg="white")
            pass
        elif (theme == "white"):
            self.fontColor = "black"
            self.window['theme'] = 'aquativo'
            self.lineNumber.config(bg="white")
            self.txt.config(bg="white", fg="black", insertbackground="black")
            self.menuBar.config(bg="white", fg="black")
            pass
        elif (theme == "matrix"):
            self.fontColor = "black"
            self.window['theme'] = 'black'
            self.lineNumber.config(bg="green")
            self.txt.config(bg="black", fg="green", insertbackground="white")
            self.menuBar.config(bg="green", fg="black", relief=RAISED)
        elif (theme == "aqua"):
            self.fontColor = "green"
            self.window['theme'] = 'arc'
            self.lineNumber.config(bg="#9de1fd")
            self.txt.config(bg="white", fg="black", insertbackground="black")
            self.menuBar.config(bg="#9de1fd", fg="black", relief=RAISED)
        elif (theme == "sne"):
            self.fontColor = "black"
            self.window['theme'] = 'kroc'
            self.lineNumber.config(bg="#eaddca")
            self.txt.config(bg="#997950", fg="black", insertbackground="black")
            self.menuBar.config(bg="black", fg="#eaddca", relief=RAISED)

    def change_font_size(self):
        """Adjust Font Size"""
        new_font_size = simpledialog.askstring(
            "Size", "Enter font size", parent=self.window)
        if new_font_size is not None:
            self.fontSize = new_font_size
            self.update_font()

    def change_font_family(self, fontType):
        """Change Font Family"""
        self.fontType = fontType
        self.update_font()

    def change_font_weight(self, fontWeight):
        """Adjust Font Weight"""
        self.fontWeight = fontWeight
        self.update_font()


    def update_font(self):
        self.txt.configure(font=(self.fontType, self.fontSize, self.fontWeight))
        

    def about(self):
        # print("Showing About Page")
        messagebox.showinfo("Shellnotes Note Editor (SNE)", "An editor used for viewing and editing your notes.\nVersion: 1.0")

    def exit(self):
        if(messagebox.askyesno('Quit', 'Are you sure you want to quit?')):
            self.window.destroy()


a = Editor()
