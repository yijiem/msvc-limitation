#!/bin/bash

COUNTER=300
FILE=async_service.cpp

if test -f $FILE; then
  echo "$FILE exists."
fi

echo "class Service {" > $FILE
echo " public:" >> $FILE
for i in $(eval echo "{1..$COUNTER}")
do
  echo "  virtual void Method$i() = 0;" >> $FILE
done
echo "};" >> $FILE
echo >> $FILE

echo "// class list" >> $FILE
for i in $(eval echo "{1..$COUNTER}")
do
  echo "template <class Base>" >> $FILE
  echo "class Async_Method$i : public Base {" >> $FILE
  echo " public:" >> $FILE
  echo "  void Method$i() override {}" >> $FILE
  echo "};" >> $FILE
  echo >> $FILE
done

echo -n "typedef " >> $FILE
for i in $(eval echo "{1..$COUNTER}")
do
  echo -n "Async_Method$i<" >> $FILE
done

echo -n "Service" >> $FILE

for i in $(eval echo "{1..$COUNTER}")
do
  echo -n " >" >> $FILE
done

echo "AsyncService;" >> $FILE
echo >> $FILE

echo "AsyncService g_async_service;" >> $FILE
