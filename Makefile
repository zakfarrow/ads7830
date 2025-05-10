# Simple Makefile for ADS7830 Library (System-wide installation)

CC = gcc
CFLAGS = -Wall -fPIC

LIBNAME = ads7830
LIBFILE = lib$(LIBNAME).so

BUILD_DIR = build
SRC_DIR = .

$(shell mkdir -p $(BUILD_DIR))

SRC = $(SRC_DIR)/ads7830.c
OBJ = $(BUILD_DIR)/ads7830.o

all: $(BUILD_DIR)/$(LIBFILE)

$(OBJ): $(SRC) ads7830.h
	$(CC) $(CFLAGS) -c $(SRC) -o $(OBJ)

$(BUILD_DIR)/$(LIBFILE): $(OBJ)
	$(CC) -shared -o $(BUILD_DIR)/$(LIBFILE) $(OBJ)

install: $(BUILD_DIR)/$(LIBFILE)
	sudo cp $(BUILD_DIR)/$(LIBFILE) /lib/
	sudo cp ads7830.h /usr/include/
	sudo ldconfig
	@echo "Library installed to /lib and header to /usr/include"

uninstall:
	sudo rm -f /lib/$(LIBFILE)
	sudo rm -f /usr/include/ads7830.h
	sudo ldconfig
	@echo "Library uninstalled"

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all install uninstall clean
