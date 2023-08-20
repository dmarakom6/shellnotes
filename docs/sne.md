# SnE - Shellnotes Notes Editor Documentation

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Integration with Shellnotes](#integration-with-shellnotes)
4. [Usage](#usage)
5. [Logging System](#logging-system)
6. [Tools](#tools)
7. [Pasting Notes](#pasting-notes)
8. [Conclusion](#conclusion)

## Introduction <a name="introduction"></a>

SnE (Shellnotes Notes Editor) is a text editor developed as part of the Shellnotes Project. Shellnotes is a terminal-based note-taking tool for Linux users. SnE provides users with a graphical interface to create, edit, and manage their notes efficiently via a user-friendly text editor. SnE is built using the Tkinter library and offers various features to enhance the note-taking experience.

## Features <a name="features"></a>

SnE comes equipped with several features to facilitate note-taking and editing:

- **Graphical User Interface:** SnE offers a graphical interface for creating and editing notes, making it user-friendly and accessible.

- **Text Editing:** Users can input and edit text using standard text editing functionalities such as copy, paste, undo, redo, and find.

- **Styling Options:** SnE allows users to customize the font family, font size, and font weight of their notes for better readability and personalization.

- **Themes:** Users can choose from a selection of themes to customize the appearance of the editor to their liking.

- **Character Count:** SnE displays a live character count at the bottom of the editor to help users keep track of their note length.

- **Spell Check:** The editor includes a spell check feature that highlights misspelled words and suggests corrections.

- **Text-to-Speech:** SnE can read selected text or the entire note aloud using a text-to-speech engine.

- **Integration:** SnE seamlessly integrates with Shellnotes, allowing users to create and manage notes directly from their terminal, using the `newnote` command.

## Integration with Shellnotes <a name="integration-with-shellnotes"></a>

Users can launch SnE from the terminal using the command `newnote`, but they can also use it as a regular text editor by typing `NOTES_EDITOR` into the terminal.

## Usage <a name="usage"></a>

To launch SnE and start creating/editing notes, follow these steps:

1. Open your terminal.

2. Navigate to the directory where you have Shellnotes installed.

3. Use the appropriate command to launch SnE:
`newnote`


4. The SnE window will appear, providing a text editor interface.

5. Use the available features (copy, paste, save, etc.) to create and edit your notes.

6. Customize the editor's font style, size, weight, and theme according to your preferences.

7. When you're done editing, save your note and close SnE.

## Logging System <a name="logging-system"></a>

SnE incorporates a logging system to track events and errors. The log files are stored in the user's home directory under `~/.shellnotes/logs/sne`. The logging system helps diagnose issues, monitor usage, and improve the overall stability of the application. This is achieved by the help of the python-loguru library.

## Tools <a name="tools"></a>

### Text-to-Speech (Read Aloud)

SnE provides a convenient Text-to-Speech (TTS) feature that allows you to have your notes read aloud. This feature is especially useful for proofreading, reviewing content, or simply listening to your notes. SnE uses the `pyttsx3` library to enable the TTS functionality.

**Usage:**

1. Select the text you want to hear read aloud within the editor.
2. Click on the "Tools" menu.
3. Choose the "Read Aloud" option.
4. The selected text will be converted into speech and played through your system's audio output.

### Search & Replace (Using `notegrep`)

SnE incorporates a powerful search and replace functionality using the `notegrep` tool. This tool allows you to search for specific patterns within your notes and replace them with new content. `notegrep` leverages regular expressions to perform advanced searches and replacements.

**Usage:**

1. Click on the "Tools" menu.
2. Select "Find" to search for specific text within the note. You can enter a keyword or phrase to search for.
3. Choose "Replace All..." to initiate a search and replace operation. This option lets you replace all occurrences of a particular text with a new value.
4. A separate window will appear, allowing you to specify the search pattern and the replacement text using regular expressions.
5. Once you've configured the search and replacement, click the "Replace" button to perform the operation.

### Spell Check

SnE includes a built-in spell check tool that helps you identify and correct spelling errors in your notes. It uses the `enchant` library to check the spelling of words against a dictionary. Misspelled words are highlighted, so that corrections can be made easily.

**Usage:**

1. Click on the "Tools" menu.
2. Choose the "Spell Check" option.
3. The spell check tool will scan the entire note for spelling errors.
4. Any misspelled words will be highlighted, usually with a red background.
5. To correct a misspelled word, right-click on it, and you'll be presented with suggested corrections. Select the appropriate correction to update the word.
6. Once the spell check is complete, your note will be free of spelling errors.

These additional tools enhance the usability and functionality of SnE by offering capabilities such as text-to-speech conversion, advanced search and replace using regular expressions, and an integrated spell check feature. These tools contribute to an improved note-taking experience, ensuring accurate and high-quality content creation.


## Pasting Notes <a name="pasting-notes"></a>

SnE offers the ability to paste your notes to external services for sharing or backup purposes. It provides integration with both Pastebin and GitHub Gists.

### Pasting on Pastebin
To paste your note on Pastebin:

1. Click on the "Tools" menu.

2. Select "Paste on Pastebin."

3. A link to the Pastebin page containing your note will be displayed.

4. Optionally, click the "Copy" button to copy the link to your clipboard.

### Pasting on GitHub Gists
To paste your note on GitHub Gists:

1. Click on the "Tools" menu.

2. Select "Paste on Github Gists."

3. If prompted, ensure that your GitHub token (GH_TOKEN) is set using the `shellnotes --set-github-token` command.

4. A link to the GitHub Gist containing your note will be displayed.

5. Optionally, click the "Copy" button to copy the link to your clipboard.

> By default, uploaded notes are private, but you can make them public on demand.

## Conclusion <a name="conclusion"></a>

SnE (Shellnotes Notes Editor) enhances the Shellnotes experience by providing a feature-rich graphical interface for creating, editing, and managing notes. With its user-friendly design and integration with Shellnotes, SnE offers a seamless note-taking solution for Linux users. Its versatile features, logging system, and options to paste notes to external services make it a powerful tool for efficient note management.

For any issues, inquiries, or suggestions, please refer to the official Shellnotes documentation or reach out to the developer Dimitris Marakomichelakis.
