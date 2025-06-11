#!/bin/bash -x

export PROJECT_SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

nypatchy  - taumin_good.f taumin_good.cra .go

/usr/bin/gfortran  -g -O0 -fPIC -finit-local-zero -fno-second-underscore -fno-backslash -fno-automatic -fno-f2c -std=legacy \
	-fno-align-commons -Wno-conversion -Wline-truncation -Warray-bounds -Wno-align-commons -Wno-argument-mismatch \
	-no-pie -fcommon -fno-aggressive-loop-optimizations -fstack-protector  -mfpmath=387 -fallow-invalid-boz -fallow-argument-mismatch -Wno-tabs \
	$(dellib dstanaxx pxdstxx vdclapxx dstanaxx ufield phdst) \
        $(cernlib jetset74 mathlib packlib) \
	-c taumin_good.f -o taumin_good.exe
