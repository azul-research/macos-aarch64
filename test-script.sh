#!/bin/bash

export LANG="en_US"

JAVA_HOME=/pwd/build/linux-aarch64-server-release/images/jdk/ # bin/java 
TESTS=/pwd/test/hotspot/jtreg:tier1

cd pwd/

uname -a
$JAVA_HOME/bin/java -version

jtreg/bin/jtreg -jdk:$JAVA_HOME -verbose:all -XX:+UnlockExperimentalVMOptions -XX:+UseJVMCICompiler -Xcomp $TESTS

