#
# Makefile
# uqcskenn, 2013-11-22 00:01
#
CC = gcc
CFLAGS = -g -O2 -Wall -pthread
HTSDIR = ./htslib
LIBS = -lz -lpthread -lm
EXECUTABLE = bamdepth
SOURCES = main.c bedidx.c $(HTSDIR)/libhts.a

all: $(EXECUTABLE)

include $(HTSDIR)/htslib.mk

install: $(EXECUTABLE)
	ln -s bam-depth/$(EXECUTABLE) ..

$(EXECUTABLE): $(SOURCES)
	$(CC) $(CFLAGS) -L$(HTSDIR) -I$(HTSDIR) -o $@ $^ $(LIBS)



# vim:ft=make
#

