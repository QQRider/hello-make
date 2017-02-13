DEPFILE=$(*D)/.$(*F).d
DEPFLAG=-MMD -MF $(DEPFILE)
CFLAGS=-Wall -g $(DEPFLAG)

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=)
all:$(OBJ)

% : %.c
	$(CC) $(CFLAGS) -o $@ $^
clean:
	rm -f $(OBJ)
	rm -f `find . -name ".*.d"`
print:$(SRC)
	@echo Changed files since last print:$? 
	@touch print
