AS = clang # We'll use clang as an assembler, simplifying a few things
DBG = lldb
LD = ld
XCRUN = xcrun

# We use .PHONY to tell make to always run these commands even if a file exists
# with the same name in this directory. For more information on .PHONY, see
# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: build-main
build-main: build-dir
	$(AS) -Wall -g -o build/main.o -c src/main.s
	$(LD) -o build/main build/main.o -lSystem -syslibroot `$(XCRUN) -sdk macosx --show-sdk-path`

.PHONY: check
check:
	@arch | grep -q arm64 && echo "SUCCESS: Running on arm64" || echo "ERROR: Running on non-arm64"
	@which $(AS) > /dev/null && echo "SUCCESS: $(AS) is installed" || echo "ERROR: $(AS) not found, please install clang"
	@which $(LD) > /dev/null && echo "SUCCESS: $(LD) is installed" || echo "ERROR: $(LD) not found, please install clang"
	@which $(DBG) > /dev/null && echo "SUCCESS: $(DBG) is installed" || echo "ERROR: $(DBG) not found, please install lldb"
	@which $(XCRUN) > /dev/null && echo "SUCCESS: $(XCRUN) is installed" || echo "ERROR: $(XCRUN) not found, please install Xcode Command Line Tools"

.PHONY: build-dir
build-dir:
	if [ ! -d build ]; then mkdir build; fi

.PHONY: run
run: build-main
	./build/main

.PHONY: debug
debug: build-main
	$(DBG) ./build/main
