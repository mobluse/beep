CC=gcc
FLAGS=-Wall -O2
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    EXEC_NAME=beep
else
    EXEC_NAME=beep.exe
endif
INSTALL_DIR=/usr/bin
MAN_FILE=beep.1.gz
MAN_DIR=/usr/share/man/man1

default : beep

clean :
	rm ${EXEC_NAME}

beep : beep.c
	${CC} ${FLAGS} -o ${EXEC_NAME} beep.c

install :
	cp ${EXEC_NAME} ${INSTALL_DIR}
	chmod a+rx ${INSTALL_DIR}/${EXEC_NAME}
	# rm -f /usr/share/man/man1/beep.1.bz2
	cp ${MAN_FILE} ${MAN_DIR}
	chmod a+r ${MAN_DIR}/${MAN_FILE}
	# openSUSE:
	# unalias beep
	# export PATH=$$PATH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0
