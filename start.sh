#!/bin/bash
service apache2 start
service mysql start
nohup python /dns.py > /dev/null 2>&1 &
tail -f /dev/null
