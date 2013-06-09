#!/bin/bash
ps -u $USER -o pid,rss,command | awk '{print $0}{sum+=$2} END {print "Total", sum}'
