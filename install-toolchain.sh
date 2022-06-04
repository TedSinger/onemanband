#!/bin/sh
for installer in `ls toolchain`; do
    toolchain/$installer
done