#!/bin/bash

cat /etc/passwd | grep $(users) | cut -f3 -d: | cut -f1 -d:
