#!/bin/sh
groupadd prior
for u in `ls services/`; do
    useradd $u -g prior -m
done