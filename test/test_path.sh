#!/bin/sh

#
# 'basic' test.
#
shellpath testadd basic_dir
if [ $? -ne 0 ]
then
  echo "error: 'shellpath' testadd 'basic' failed"
  exit 1
fi

. export_vars test

basic_test.sh
if [ $? -ne 0 ]
then
  echo "error: run test 'basic' failed"
  exit 1
fi

shellpath testrm basic_dir
if [ $? -ne 0 ]
then
  echo "error: 'shellpath' testrm 'basic' failed"
  exit 1
fi


#
# 'cvrčak' test.
#
shellpath testadd --\ cvrči,\ cvrči\ cvrčak\ -na\ čvoru\ crne\ smrče\ --
if [ $? -ne 0 ]
then
  echo "error: 'shellpath' testadd 'cvrčak' failed"
  exit 1
fi

. export_vars test

test\ cvrči,\ cvrči\ cvrčak\ na\ čvoru\ crne\ smrče.sh
if [ $? -ne 0 ]
then
  echo "error: run test 'cvrčak' failed"
  exit 1
fi

shellpath testrm --\ cvrči,\ cvrči\ cvrčak\ -na\ čvoru\ crne\ smrče\ --
if [ $? -ne 0 ]
then
  echo "error: 'shellpath' testrm 'cvrčak' failed"
  exit 1
fi

echo "Listing contents of test configuration file, expecting empty file:"
shellpath testls


