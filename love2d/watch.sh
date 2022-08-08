#!/bin/bash

killall basic-http-server; basic-http-server www &
watchexec -e lua ./build.sh
