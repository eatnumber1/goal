
#include <stdlib.h>
#include <stdio.h>
#include <regex.h>
#include <string.h>

// We still need g()()()()("al") to pass initial compilation,
// so have it evaluate to either just "g" or "f". We then define
// these as constants so they serve as type placeholders. This way
// double x = g()()()("al") will appropriately complain.

const char * g;
const char * f;

#define g(X) f
#define f(X) g

// We'll define this after we're done with main.
const char * filename();

void exec(const char * cmd);
void compile(char * contents);
char * readContentsOfFile(const char * aPath);
void writeToFile(const char * aPath, const char * contents);
void stringLiteralify(char * string, int length);

// Pretty straight-forward
int main()
{
    char * source = readContentsOfFile(filename());

    compile(source);

    writeToFile("/tmp/modified.c", source);

    exec("gcc /tmp/modified.c -o /tmp/modified && /tmp/modified");

    return 0;
}

// This will turn their main into main2, thus not ever actuall executing.
// At the same time, we take this opportunity to note the name of the file.
#define main() x(){ return 0; }; const char * filename() { return __FILE__; }; int main2()

// Find all occurrences of g[()()...()]("al") and conver them to string literals: "g[oo..o]al".
// Also, get rid of the goal.h include.
// You probably want a real-deal parser here, but whatcha gonna do.
void compile(char * string)
{
    // Match g[()()...()]("al")
    regex_t regex;
    regcomp(&regex, "g(\\([[:space:]]*\\))*\\([[:space:]]*\"al[[:space:]]*\"[[:space:]]*\\)", REG_EXTENDED);

    size_t nmatch = 1;
    regmatch_t pmatch[1];
    char * match_buffer = string;

    while (0 == regexec(&regex, match_buffer, nmatch, pmatch, REG_EXTENDED))
    {
        stringLiteralify(match_buffer + pmatch[0].rm_so, pmatch[0].rm_eo - pmatch[0].rm_so);
        match_buffer += pmatch[0].rm_eo;
    }

    // Match #include [...] "goal.h"
    regcomp(&regex, "[[:space:]]*#include[[:space:]]*\"goal.h\"", REG_EXTENDED & REG_NOTBOL & REG_NEWLINE);
        
    match_buffer = string;

    while (0 == regexec(&regex, match_buffer, nmatch, pmatch, REG_EXTENDED & REG_NOTBOL & REG_NEWLINE))
    {
        memset(match_buffer + pmatch[0].rm_so, ' ', pmatch[0].rm_eo - pmatch[0].rm_so);    
        match_buffer += pmatch[0].rm_eo;
    }
}

// Precondition: string is of the form "g[()()...()]("al")"
// Postcondition: string will be of the form "g[oo...o]al", with whitespace for the extra characters.
void stringLiteralify(char * string, int length)
{
    int count = -1;
    int index = 0;

    for (; index < length; ++index)
        if (string[index] == '(')
            ++count;

    const char * prefix = "\"g";
    const char infix = 'o';
    const char * postfix = "al\"";

    const size_t prefixLength = strlen(prefix);
    const size_t postfixLength = strlen(postfix);
    const size_t whiteoutLength = length - prefixLength - count - postfixLength;

    strncpy(string, prefix, prefixLength);
    memset(string += prefixLength, infix, count);
    strncpy(string += count, postfix, postfixLength);
    memset(string + postfixLength, ' ', whiteoutLength);
}

// The ol' read-write
void writeToFile(const char * aPath, const char * contents)
{
    FILE * file = fopen(aPath, "w");

    if (file == NULL)
    {
        printf("Error opening file!\n");
        exit(1);
    }

    fprintf(file, "%s", contents);

    fclose(file);
}

char * readContentsOfFile(const char * aPath)
{
    char * buffer = 0;
    long length;
    FILE * f = fopen (aPath, "rb");

    if (f)
    {
        fseek (f, 0, SEEK_END);
        length = ftell (f);
        fseek (f, 0, SEEK_SET);
        buffer = malloc (length);

        if (buffer)
            fread (buffer, 1, length, f);

        fclose (f);
    }

    return buffer;
}

void exec(const char * cmd)
{
    FILE * pipe = popen(cmd, "r");

    if (!pipe)
        return;

    char buffer[128];
    char * result = malloc(500);
    char * writer = result;

    while (!feof(pipe))
    	if (fgets(buffer, 128, pipe) != NULL)
    	   printf("%s", buffer);

    pclose(pipe);
}
