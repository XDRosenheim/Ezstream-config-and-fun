#!/bin/bash
tail -1 screenlog.1 | awk '{ s = ""; for (i = 3; i <= NF; i++) s = s $i " "; print s }';
