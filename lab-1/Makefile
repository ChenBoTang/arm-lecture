CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o

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

QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &
CMD = yes 9 | $(call QEMU_CMD) && sleep 1
qemu: fibseq
	@yes 0xffffffff | $(call QEMU_CMD)
	@sleep 1
	@yes 0x0 | $(call QEMU_CMD)
	@sleep 1
	@yes 0x1 | $(call QEMU_CMD)
	@sleep 1
	@yes 0x2 | $(call QEMU_CMD)
	@sleep 1
	@yes 0x3 | $(call QEMU_CMD)
	@sleep 1
	@yes 0x4 | $(call QEMU_CMD)
	@sleep 1
	@yes 0x5 | $(call QEMU_CMD)
	@sleep 1
	@yes 0x6 | $(call QEMU_CMD)
	@sleep 1
	@yes 0x7 | $(call QEMU_CMD)
	@sleep 1
	@yes 0x8 | $(call QEMU_CMD)
	@sleep 1
