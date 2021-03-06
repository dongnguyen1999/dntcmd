import sys
import subprocess

colors = {
    "DEFAULT-COLOR": "\e[0;39m",
    "BLACK": "\e[0;30m",
    "GREEN": "\e[0;32m",
    "RED": "\e[0;31m",
    "YELLOW": "\e[0;33m",
    "BLUE": "\e[0;34m",
    "MAGENTA": "\e[0;35m",
    "CYAN": "\e[0;36m",
    "LIGHT-GRAY": "\e[0;37m",
    "DARK-GRAY": "\e[0;90m",
    "LIGHT-RED": "\e[0;91m",
    "LIGHT-GREEN": "\e[0;92m",
    "LIGHT-YELLOW": "\e[0;93m",
    "LIGHT-BLUE": "\e[0;94m",
    "LIGHT-MAGENTA": "\e[0;95m",
    "LIGHT-CYAN": "\e[0;96m",
    "WHITE": "\e[0;97m",
}

def printColors():
    string = "\e[1;33mPossible colors:\n"
    for color in colors.keys():
        string += "\t" + colors.get(color) + color + "\n\e[0m"
    subprocess.call("echo '" + string + "'", shell=True)

backgrounds = {
    "DEFAULT-COLOR-BG": "\e[49m",
    "BLACK-BG": "\e[40m",
    "GREEN-BG": "\e[42m",
    "RED-BG": "\e[41m",
    "YELLOW-BG": "\e[43m",
    "BLUE-BG": "\e[44m",
    "MAGENTA-BG": "\e[45m",
    "CYAN-BG": "\e[46m",
    "LIGHT-GRAY-BG": "\e[47m",
    "DARK-GRAY-BG": "\e[100m",
    "LIGHT-RED-BG": "\e[101m",
    "LIGHT-GREEN-BG": "\e[102m",
    "LIGHT-YELLOW-BG": "\e[103m",
    "LIGHT-BLUE-BG": "\e[104m",
    "LIGHT-MAGENTA-BG": "\e[105m",
    "LIGHT-CYAN-BG": "\e[106m",
    "WHITE-BG": "\e[107m",
}

def printBackgrounds():
    string = "\e[1;33mPossible background colors:\n"
    for color in backgrounds.keys():
        print (color)
        string += "\t" + colors.get(color[:color.rfind("-")]) + color + "\n\e[0m"
    subprocess.call("echo '" + string + "'", shell=True)

styles = {
    "DEFAULT": "\e[0m",
    "BOLD": "\e[1m",
    "DIM": "\e[2m",
    "UNDERLINED": "\e[4m",
    "BLINK": "\e[5m",
    "INVERTED": "\e[7m",
    "HIDDEN": "\e[8m",
}

def printStyles():
    string = "\e[1;33mPossible text styles:\n\e[0m"
    for style in styles.keys():
        if style == "HIDDEN": string += "\t" + style + "\n\e[0m"
        else: string += "\t" + styles.get(style) + style + "\n\e[0m"
    subprocess.call("echo '" + string + "'", shell=True)

whitespaces = {
    "TAB": "\t",
    "NEWLINE": "\n",
    "INLINE": ""
}

def printWhitespaces():
    string = "\e[1;33mPossible whitespace characters:\n\e[0m"
    for char in whitespaces.keys():
        string += "\t" + char + "\n"
    subprocess.call("echo '" + string + "'", shell=True)

tagnames = {
    "DEFAULT-COLOR": "\e[0;39m",
    "BLACK": "\e[0;30m",
    "GREEN": "\e[0;32m",
    "RED": "\e[0;31m",
    "YELLOW": "\e[0;33m",
    "BLUE": "\e[0;34m",
    "MAGENTA": "\e[0;35m",
    "CYAN": "\e[0;36m",
    "LIGHT-GRAY": "\e[0;37m",
    "DARK-GRAY": "\e[0;90m",
    "LIGHT-RED": "\e[0;91m",
    "LIGHT-GREEN": "\e[0;92m",
    "LIGHT-YELLOW": "\e[0;93m",
    "LIGHT-BLUE": "\e[0;94m",
    "LIGHT-MAGENTA": "\e[0;95m",
    "LIGHT-CYAN": "\e[0;96m",
    "WHITE": "\e[0;97m",

    "DEFAULT-COLOR-BG": "\e[49m",
    "BLACK-BG": "\e[40m",
    "GREEN-BG": "\e[42m",
    "RED-BG": "\e[41m",
    "YELLOW-BG": "\e[43m",
    "BLUE-BG": "\e[44m",
    "MAGENTA-BG": "\e[45m",
    "CYAN-BG": "\e[46m",
    "LIGHT-GRAY-BG": "\e[47m",
    "DARK-GRAY-BG": "\e[100m",
    "LIGHT-RED-BG": "\e[101m",
    "LIGHT-GREEN-BG": "\e[102m",
    "LIGHT-YELLOW-BG": "\e[103m",
    "LIGHT-BLUE-BG": "\e[104m",
    "LIGHT-MAGENTA-BG": "\e[105m",
    "LIGHT-CYAN-BG": "\e[106m",
    "WHITE-BG": "\e[107m",

    "DEFAULT": "\e[0m",
    "BOLD": "\e[1m",
    "DIM": "\e[2m",
    "UNDERLINED": "\e[4m",
    "BLINK": "\e[5m",
    "INVERTED": "\e[7m",
    "HIDDEN": "\e[8m",

    "TAB": "    ",
    "NEWLINE": "\n",
    "INLINE": ""
}

            



if len(sys.argv) > 1:
    sys.argv[0] = "span"
    option = sys.argv[1]
    if option == "colors":
        printColors()
    elif option == "backgrounds":
        printBackgrounds()
    elif option == "styles":
        printStyles()
    elif option == "whitespaces":
        printWhitespaces()
    else: print("Invalid option!")
        
