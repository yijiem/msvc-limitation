#!/bin/bash

FILE=class500.cpp

if test -f $FILE; then
  echo "$FILE exists."
fi

echo "// class list" > $FILE
for i in {1..500}
do
  echo "template <class Base>" >> $FILE
  echo "class A$i : public Base {};" >> $FILE
  echo >> $FILE
done

echo "class Core {};" >> $FILE
echo >> $FILE

echo -n "typedef " >> $FILE
for i in {1..500}
do
  echo -n "A$i<" >> $FILE
done

echo -n "Core" >> $FILE

for i in {1..500}
do
  echo -n " >" >> $FILE
done

echo "A1000;" >> $FILE
