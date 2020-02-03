#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    char* key;
    char* value;
} KeyValue;

#define NB_TAGS 44
KeyValue tagnames[] = {
    {"DEFAULT-COLOR", "\e[0;39m"},
    {"BLACK", "\e[0;30m"},
    {"GREEN", "\e[0;32m"},
    {"RED", "\e[0;31m"},
    {"YELLOW", "\e[0;33m"},
    {"BLUE", "\e[0;34m"},
    {"MAGENTA", "\e[0;35m"},
    {"CYAN", "\e[0;36m"},
    {"LIGHT-GRAY", "\e[0;37m"},
    {"DARK-GRAY", "\e[0;90m"},
    {"LIGHT-RED", "\e[0;91m"},
    {"LIGHT-GREEN", "\e[0;92m"},
    {"LIGHT-YELLOW", "\e[0;93m"},
    {"LIGHT-BLUE", "\e[0;94m"},
    {"LIGHT-MAGENTA", "\e[0;95m"},
    {"LIGHT-CYAN", "\e[0;96m"},
    {"WHITE", "\e[0;97m"},

    {"DEFAULT-COLOR-BG", "\e[49m"},
    {"BLACK-BG", "\e[40m"},
    {"GREEN-BG", "\e[42m"},
    {"RED-BG", "\e[41m"},
    {"YELLOW-BG", "\e[43m"},
    {"BLUE-BG", "\e[44m"},
    {"MAGENTA-BG", "\e[45m"},
    {"CYAN-BG", "\e[46m"},
    {"LIGHT-GRAY-BG", "\e[47m"},
    {"DARK-GRAY-BG", "\e[100m"},
    {"LIGHT-RED-BG", "\e[101m"},
    {"LIGHT-GREEN-BG", "\e[102m"},
    {"LIGHT-YELLOW-BG", "\e[103m"},
    {"LIGHT-BLUE-BG", "\e[104m"},
    {"LIGHT-MAGENTA-BG", "\e[105m"},
    {"LIGHT-CYAN-BG", "\e[106m"},
    {"WHITE-BG", "\e[107m"},

    {"DEFAULT", "\e[0m"},
    {"BOLD", "\e[1m"},
    {"DIm" , "\e[2m"},
    {"UNDERLINED", "\e[4m"},
    {"BLINK", "\e[5m"},
    {"INVERTED", "\e[7m"},
    {"HIDDEN", "\e[8m"},

    {"TAB", "    "},
    {"NEWLINE", "\n"},
    {"INLINE", ""},
};


int isTagname(char* text){
    int i;
    for (i = 0; i < NB_TAGS; i++){
        // printf("%s\n", tagnames[i].key);
        if (strcmp(tagnames[i].key, text) == 0) return i;
    }
    return -1;
}

char* span(char** words, int wordsLength){
    int index = 0;
    int isInline = 0;
    words[0] = "span";
    char* result = (char*)malloc(sizeof(char)*255);
    while(index < wordsLength){
        int wc = 1;
        if (strcmp(words[index], "span") == 0){
            int tagIndex;
            while (index+wc < wordsLength && (tagIndex=isTagname(words[index+wc])) != -1){
                if (strcmp(words[index+wc], "INLINE") == 0 && !isInline) isInline = 1;
                strcat(result, tagnames[tagIndex].value);
                wc++;
            }
            if (wc == 1 && index != 0) strcat(result, "span ");
        } else if (strcmp(words[index], ".span") == 0){
            strcat(result, "span");
            if (index != wordsLength-1) strcat(result, " ");
        } else {
            strcat(result, words[index]);
            if (index != wordsLength-1) strcat(result, " ");
        }
        index += wc;
    }
    char temp[255];
    strcat(result, "\e[0m");
    if (!isInline) strcat(result, "\n");
    return result;
    //     wc = 1
    //     if words[index] == "span",
    //         while index+wc < len(words) and words[index+wc] in tagnames.keys(),
    //             if words[index+wc] == "INLINE" and result[0] == "'",
    //                 result.pop(0)
    //                 result = "-n '" + result
    //             result += tagnames[words[index+wc]]
    //             wc += 1
    //         if wc == 1 and index != 0, result += "span "
    //     else,
    //         result += words[index] + " "
    //     index += wc
    // return result.strip() + closeTag + "'"

}
    

int main(int argc, char** argv){
    printf("%s",span(argv, argc));
    // isTagname("");
}
