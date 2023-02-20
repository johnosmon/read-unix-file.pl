#  A template to read "unix-style" files
#
o

This is a simple perl script that reads a "unix-style" file, and returns
the "interesting" lines.  Excplicitly, it:
    - ignores comment lines (starting with "#")
    - ignores whitespace only lines
    - concatinates lines if the previous line ended with a "\"


