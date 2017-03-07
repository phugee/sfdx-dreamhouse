#!/usr/bin/env bash

OUTPUT_DIR=$1

SELENIUM_MAJOR_VERSION=2.53
SELENIUM_VERSION=$SELENIUM_MAJOR_VERSION.1

SELENIUM_NAME=selenium-java-$SELENIUM_VERSION
SELENIUM_FILE_NAME=$SELENIUM_NAME.zip

#The location of the selenium client zip file after downloading
SELENIUM_CLIENT_ZIP=$OUTPUT_DIR/$SELENIUM_FILE_NAME

#The URL of the selenium client libraries
SELENIUM_CLIENT_URL=http://selenium-release.storage.googleapis.com/$SELENIUM_MAJOR_VERSION/$SELENIUM_FILE_NAME

# The internal folder in the selenium zip that we need to use when extracted
SELENIUM_EXTRACTED_PATH=$OUTPUT_DIR/selenium-$SELENIUM_VERSION

#The location of the selenium client jar
SELENIUM_CLIENT_JAR=$SELENIUM_EXTRACTED_PATH/$SELENIUM_NAME.jar

COMMONS_IO_FILE_NAME=commons-io-2.5-bin.zip
COMMONS_IO_ZIP=$OUTPUT_DIR/$COMMONS_IO_FILE_NAME
COMMONS_IO_URL=http://apache.cs.utah.edu/commons/io/binaries/$COMMONS_IO_FILE_NAME
COMMONS_IO_EXTRACTED_PATH=$OUTPUT_DIR/commons-io-2.5
COMMONS_IO_JAR=COMMONS_IO_EXTRACTED_PATH/commons-io-2.5.jar

#The location of the selenium client libraries
SELENIUM_CLIENT_LIBS=$SELENIUM_EXTRACTED_PATH/libs/*

if [ ! -d "$SELENIUM_EXTRACTED_PATH" ]; then
    if [ ! -f "$SELENIUM_CLIENT_ZIP" ]; then
        curl -o $SELENIUM_CLIENT_ZIP $SELENIUM_CLIENT_URL
    else echo "Using cached selenium client zip"; fi

    unzip -o $SELENIUM_CLIENT_ZIP -d $OUTPUT_DIR
else echo "Using cached selenium jars"; fi

if [ ! -d "$COMMONS_IO_EXTRACTED_PATH" ]; then
    if [ ! -f "$COMMONS_IO_ZIP" ]; then
        curl -o $COMMONS_IO_ZIP $COMMONS_IO_URL
    else echo "Using cached apache commons.io zip"; fi

    unzip -o $COMMONS_IO_ZIP -d $OUTPUT_DIR
else echo "Using cached commons.io jars"; fi

javac -cp .:$SELENIUM_CLIENT_JAR:$SELENIUM_CLIENT_LIBS:$COMMONS_IO_JAR -d $OUTPUT_DIR test/integration/*
