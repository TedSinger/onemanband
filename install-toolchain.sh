#!/bin/sh
for installer in toolchain/*; do
    toolchain/"$installer"
done