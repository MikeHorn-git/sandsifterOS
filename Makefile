TARGET := sandsifterOS
ROOTPATH := ./$(TARGET)/airootfs/root
TMPPATH := /tmp/archiso-tmp
URL := https://github.com/jakiki6/sandsifter.git

.DEFAULT_GOAL := all

prepare:
	sudo pacman -S archiso --needed --noconfirm
	git clone $(URL) $(ROOTPATH)/sandsifter

build:
	sudo mkarchiso -v -w $(TMPPATH) ./$(TARGET) -o ./

all: prepare build

clean:
	sudo rm -rf out $(ROOTPATH)/sandsifter $(TMPPATH)

.PHONY: prepare build all clean
