#!/bin/bash

SPELL=`which aspell`
E_FILE=${PWD}/errors

if [ -s ${E_FILE} ]
then
  echo "Clearing errors file."
  rm ${E_FILE}
fi

if [ "${SPELL}" = "" ]
then
  echo "Package aspell is not installed.  Exitting..."
  exit 1
fi

for i in `find . -name "*.md" -not -path "*/vendor/*"`
do
  echo "File $i:" >> errors
  ${SPELL} --home-dir=${PWD} list < $i >> ${E_FILE}
done

if [ -s ${E_FILE} ]
then
  echo "There are errors to fix.  Exitting..."
  cat ${E_FILE}
  exit 256
fi

