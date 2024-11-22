TARGET := sandsifterOS
ROOTPATH := ./$(TARGET)/airootfs/root
TMPPATH := /tmp/archiso-tmp
URL := https://github.com/jakiki6/sandsifter.git

.DEFAULT_GOAL := help

help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  help         Print this message"
	@echo "  prepare      Install required dependencies and clone the sandsifter repository"
	@echo "  build        Build the Arch Linux ISO with the included sandsifter tool"
	@echo "  all          Run both prepare and build targets in sequence"
	@echo "  clean        Remove temporary files and sandsifter repository from the project"
	@echo "  remove       Uninstall the archiso package"
	@echo "  prune        Perform both clean and remove operations"

prepare:
	sudo pacman -S archiso --needed --noconfirm
	git clone $(URL) $(ROOTPATH)/sandsifter

build:
	sudo mkarchiso -v -w $(TMPPATH) ./$(TARGET) -o ./

all: prepare build

clean:
	sudo rm -rf out $(ROOTPATH)/sandsifter $(TMPPATH)

remove:
	sudo pacman -Rs archiso --noconfirm

prune: clean remove

.PHONY: help prepare build all clean remove prune
