#! /bin/sh

as canDoSattack.s -o canDoSattack.o
gcc canDoSattack.o lib.o -o canDoSattack
