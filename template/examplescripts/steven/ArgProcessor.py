#!/usr/bin/python3

#This script is an add $EXTRA_BUILD_ARGS to the end of build command.
#But the library added is specified by build script arguments

import sys
import os

#Reading inputs
buildCommand = []
for line in sys.stdin:
    if 'q' == line.rstrip():
        break
    buildCommand.append(line)

#Check input
if(len(buildCommand) != 1):
    print("The input should have only one line, got %d" %
          (len(buildCommand)), file=sys.stderr)
    sys.exit(-1)

buildCommand = buildCommand[0].strip()

#Split build arguments by space
argV = sys.argv

MY_ARTIFECTS_PATH = os.environ['TEST_ROOT_DIR']+'/myartifects'



#Make sure mallocperf is inserted in front of other libraries
insertLoc = buildCommand.find('-Wl,-rpath,')



buildCommand = buildCommand[0:insertLoc]+ '-Wl,-L,%s,-L,%s,-l:libprehook.so,-l:libtestlib.so'\
     % (os.environ['TEST_ROOT_DIR']+'/myartifects',\
         os.environ['TEST_ROOT_DIR']+'/src/build')


# Put final command to stdout. You shouldn't print anything else to stdout.
# Otherwide after I/O redirection you will get wrong result.
print(buildCommand)

