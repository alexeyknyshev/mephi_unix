#!/bin/bash

ls -l --color| awk '{print $1, $9}'
