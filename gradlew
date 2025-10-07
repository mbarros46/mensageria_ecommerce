#!/usr/bin/env sh
##############################################################################
# Gradle start up script for UN*X
#
# SPDX-FileCopyrightText: 2012 the original author or authors.
# SPDX-License-Identifier: Apache-2.0
##############################################################################

CATALINA_OPTS=""
DEFAULT_JVM_OPTS="-Xmx1g"

PRG="$0"
while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`"/"`expr "$link" : '\(.*\)$'`
  fi
done

PRGDIR=`dirname "$PRG"`

CLASSPATH="$PRGDIR/gradle/wrapper/gradle-wrapper.jar"
exec java -cp "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
