#!/usr/bin/env bash

for f in `find . -name "Dockerfile" | grep -vE "9.0.4|9.0.1|10.0.0|10.0.1" `
do
  DIR=`dirname ${f}`
  echo ${DIR}
  cd ${DIR}
  > log
  docker build . 2>&1  > log || { cat log; echo $f; exit 1; }

  id=`grep "Successfully built" log | cut -f 3 -d \ `
  docker run $id java -version
  echo "-----"
  rm -f log
  cd -
  # exit 0
done
