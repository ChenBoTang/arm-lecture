CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o

OUTPUT_FILE = output.txt
ANSWER_FILE = fib.answer
GNUPLOT_FILE = iterative_fib_time
TEMP_FILE = temp.txt

default: fibseq

.PHONY: default clean qemu

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq
	rm -rf $(OUTPUT_FILE) $(GNUPLOT_FILE) $(TEMP_FILE)

QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &
CMD = yes 9 | $(call QEMU_CMD) && sleep 1
qemu: fibseq
	@bash ./unittest.sh ${OUTPUT_FILE} ${ANSWER_FILE} ${GNUPLOT_FILE} ${TEMP_FILE}
