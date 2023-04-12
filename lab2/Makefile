CC:=g++
FLAG:=-std=c++20 -Wextra -Werror -Wall -O3
LINKPATH:=../lib

all: scheduling.o
	$(CC) -o scheduling.elf scheduling.o

dep: scheduling.cpp
	$(CC) $(FLAG) -c scheduling.cpp

clean:
	-rm *.o
