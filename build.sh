#!/bin/bash
set -e

echo "Building WAR..."

WORKDIR=$(pwd)

rm -rf build
mkdir -p build/WEB-INF/classes

javac \
  -d build/WEB-INF/classes \
  -cp /usr/share/tomcat10/lib/servlet-api.jar \
  src/HelloServlet.java

cp -r WEB-INF build/

jar -cvf mywebapp.war -C build/ .

echo "WAR created"
