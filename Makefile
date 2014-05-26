CC = gcc
CCLINK = -lprotobuf-c
DEBUG?= -g -ggdb
BASICOPTS = -W -Wall -Wpointer-arith -Wno-unused-parameter -Werror -m64 
CCFLAGS = $(BASICOPTS) $(CCLINK) 

BINSERVER = p-server
BINCLIENT = p-client


OBJBASE = ./person.pb-c.c
OBJCLIENT = ./person-client.c
OBJSERVER = ./person-server.c

all:$(BINSERVER) $(BINCLIENT)


$(BINCLIENT): $(OBJBASE) $(OBJSERVER)
	$(CC) -o $(BINCLIENT) $(CCFLAGS) $(DEBUG) $(OBJBASE) $(OBJCLIENT)

$(BINSERVER): $(OBJBASE) $(OBJCLIENT)
	$(CC) -o $(BINSERVER) $(CCFLAGS) $(DEBUG) $(OBJBASE) $(OBJSERVER)


clean:
	rm -rf $(BINCLIENT) $(BINSERVER)







