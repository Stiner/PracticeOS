TOOLPATH = ../z_tools/
INCPATH  = ../z_tools/haribote/

MAKE     = $(TOOLPATH)make -r
NASK     = $(TOOLPATH)nask
CC1      = $(TOOLPATH)gocc1 -I$(INCPATH) -Os -Wall -quiet
GAS2NASK = $(TOOLPATH)gas2nask -a
OBJ2BIM  = $(TOOLPATH)obj2bim
BIM2HRB  = $(TOOLPATH)bim2hrb
RULEFILE = $(TOOLPATH)haribote/haribote.rul
EDIMG    = $(TOOLPATH)edimg
IMGTOL   = $(TOOLPATH)imgtol

ifeq ($(OS),Windows_NT)
    COPY = copy
    DEL  = del
else
    COPY = cp
    DEL  = rm
endif

# 디폴트 동작

default :
	$(MAKE) test.bin

# 파일 생성 규칙

test.bin : test.nas Makefile
	$(NASK) test.nas test.bin test.lst

clean :
	-$(DEL) *.bin
	-$(DEL) *.lst
