#!/bin/bash

find app/assets/components/  -type f -name "*"  | grep -v "\\."
bundle exec puma -e production -b unix:///tmp/my_app.sock



