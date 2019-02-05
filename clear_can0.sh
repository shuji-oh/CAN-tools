#!/bin/sh

sudo ip link set can0 down
sudo ip link set can0 up type can bitrate 500000
