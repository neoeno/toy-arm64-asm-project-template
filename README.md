# Toy ARM64/AArch64 (Apple Silicon) Assembly Project Template

This is a very simple template for an assembly project suitable for running on
Apple Silicon based architectures.

It prioritises having the fewest elements and easiest setup. As a result, it cuts
a few corners that you probably wouldn't want to cut in a professional project.

But if you're using assembly as a learning or hobby tool, this should suit you well.

Expect this template to evolve in the next couple weeks.

## Quickstart

You will need `make`, `clang`, and `lldb` installed. These are typically present
on any dev-ready mac.

```shell
# Clone the repo, download a zip, or run...
; mkdir my-asm-project && cd my-asm-project
; npx degit neoeno/toy-arm64-asm-project-template

# Check everything is installed
; make check

# To build and run `src/main.c`
; make run

# To start `src/main.c` in the debugger
; make debug
```

Note that a professional project would probably not use `make` for all of these tasks.

## How to write code

There is one code file, `main.s` which contains some example assembly code.

I suggest building on this foundation.

## A note about syscalls

This project uses the syscalls directly rather than via the Apple-provided
library. This is so that we can see how syscalls work behind the scenes and work
as close to 'pure assembly' as possible.

Typically you should not do this in a production project, because these
interfaces are considered private and could well change — breaking your program
without notice.
