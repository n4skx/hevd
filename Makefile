KERNEL ?= $(shell uname -r)
KERNELDIR ?= /lib/modules/$(KERNEL)/build/

.PHONY: default
default: modules

HackSysExtremeVulnerableDriver-y := src/ArbitraryWrite.o  src/BufferOverflowStack.o  src/HackSysExtremeVulnerableDriver.o src/IntegerOverflow.o  src/UninitializedMemoryStack.o 
obj-m = HackSysExtremeVulnerableDriver.o

.PHONY: modules
modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

.PHONY: modules_install
modules_install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
