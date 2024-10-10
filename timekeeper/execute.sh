#!/usr/bin/env bash

echo "System uptime: $(awk '{print int($1 + 0.5)}' /proc/uptime)"
