#!/bin/bash

for ((x=$#; x>0; x--))
do
  echo ${!x}
done

