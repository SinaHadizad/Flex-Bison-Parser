# Sina Hadizad
# srh160630@utdallas.edu
# CS3377.002

CC = gcc
CXXFLAGS = 
CPPFLAGS = -Wall

LEX = /bin/flex
LFLAGS =

YACC = /bin/bison
YFLAGS = -dy

EXECFILE = Program4

OBJS = parser.o scanner.o main.o

all: $(EXECFILE)

clean:
	rm -f $(OBJS) $(EXECFILE) scanner parser y.tab.h *~ \#*

$(EXECFILE):	$(OBJS)
	$(CC) -o $@ $(OBJS)
	ln -fs ./$@ scanner 
	ln -fs ./$@ parser
