#! /bin/sh

gcc Traditional_DoS/Traditional_DoS.c Traditional_DoS/lib.c -o Traditional_DoS/traditional_DoS
gcc Random_DoS/Random_DoS.c Random_DoS/lib.c -o Random_DoS/random_DoS
gcc Targeted_DoS/Targeted_DoS.c Targeted_DoS/lib.c -o Targeted_DoS/targeted_DoS
