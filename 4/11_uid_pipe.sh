#!/bin/bash

cat /etc/passwd | cut -f3 -d: | cut -f1 -d:
