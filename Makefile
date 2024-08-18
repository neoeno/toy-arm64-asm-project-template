AS = as
DBG = lldb
LD = ld

build-main: build-dir
	$(AS) -Wall -g -o build/main.o src/main.s
	$(LD) -o build/main build/main.o

check:
	@which $(AS) > /dev/null && echo "SUCCESS: $(AS) is installed" || echo "ERROR: $(AS) not found, please install clang"
	@which $(LD) > /dev/null && echo "SUCCESS: $(LD) is installed" || echo "ERROR: $(LD) not found, please install clang"
	@which $(DBG) > /dev/null && echo "SUCCESS: $(DBG) is installed" || echo "ERROR: $(DBG) not found, please install lldb"

build-dir:
	if [ ! -d build ]; then mkdir build; fi

run: build-main
	./build/main

debug: build-main
	$(DBG) ./build/main