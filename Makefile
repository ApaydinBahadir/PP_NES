CC = g++
CFLAGS = -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++17
SRCDIR = src
INCDIR = include
BINDIR = bin
SOURCES = $(wildcard $(SRCDIR)/*.cc)
OBJECTS = $(patsubst $(SRCDIR)/%.cc,$(BINDIR)/%.o,$(SOURCES))
EXECUTABLE = PP_NES
all: $(EXECUTABLE)
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^
$(BINDIR)/%.o: $(SRCDIR)/%.cc
	$(CC) $(CFLAGS) -I$(INCDIR) -c -o $@ $<
clean:
	rm -f $(EXECUTABLE) $(OBJECTS)

run:
	@./main
