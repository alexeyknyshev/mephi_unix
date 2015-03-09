#!/bin/bash

export IAM=$(whoami)

echo $IAM

touch 3_help.sh

echo "echo \$IAM; export IAM='root'" > 3_help.sh

sh 3_help.sh

echo "Done"

echo $IAM

rm -f 3_help.sh
