#!/bin/bash

#==============================================================================
# Benchmark entity zone (changes not recommended)
#==============================================================================

export MYSQL_BENCHMARK_ROOT_DIR=`dirname $(realpath ${BASH_SOURCE})`

cd $MYSQL_BENCHMARK_ROOT_DIR
source ../../config.sh


#If no pre build script, pass null
export PRE_BUILD_SCRIPT="NULL"

#This script will be called to process commandline arguments. 
#Please consult  ./testlibs/addExtraArgProcessor.py about how to write commandline parsing processor.
#This path have to be absolute path
export BUILD_ARG_PROCESS_SCRIPT="NULL"

#If no after build script, pass null
export AFTER_BUILD_SCRIPT="NULL"



export PRE_TEST_SCRIPT="NULL"

export AFTER_TEST_SCRIPT="NULL"

export BUILD_LOG_FOLDER="$MYSQL_BENCHMARK_ROOT_DIR/logs/build"

export TEST_RESULT_LOG_FOLDER="$MYSQL_BENCHMARK_ROOT_DIR/logs/testresult"

export BUILD_TIMESTAMP=`date "+%Y%m%d%H%M%S"`

export MYSQL_SERVER_IP=127.0.0.1

export MYSQL_SERVER_PORT=3306

#==============================================================================
# User entity zone (Please override settings here)
#==============================================================================


export AFTER_TEST_SCRIPT="$MYSQL_BENCHMARK_ROOT_DIR/myscripts/AfterTest_Printresult.sh"
