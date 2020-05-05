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
  echo "File $i:"
  ${SPELL} --encoding=UTF-8 --home-dir=${PWD} list < $i
done



