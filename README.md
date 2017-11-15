Name:     compactDirs.cmd
Type:     Windows Command script (aka Batch file)
Purpose:  Recursively compact/uncompact a number of directories 
Author:   Alaa Zeineldine   alaa@expertwell.com
Revision: November 2017 - initial version 
Remarks:  The motivation behind this wraper (and perhaps future ones) is to get around
          Window's lack of command line filename expansion. The wraper offers a crude
          approximation of handling filenames passed form the comand line in a way that
          is close to what the user expects.

          In the case of the Windows command compact, this wrapper overcomes the unpleasant
          unexpected results of passing, or expanding, filenames with spaces.

          This wraper calls compact /s [/u|/c] to process the arguments passed to it
                   
Usage: compactdirs [-u|-c] filenae...

Limitation: The wrapper expects directory names only as arguments. It will traverse each directory tree                 
	recursively and compress or uncompress each directory and all files present in the hierarchy.

This is is an initial prototype with little error checking. If things work well, perhaps a wrapper library
would be the goal that would eliminate some of the annoyances associated with passing filenames in the
Windows CLI.