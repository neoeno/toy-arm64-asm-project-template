.global _main // Declare the entry point of the program
.align 4      // Align the next instruction to a 4-byte boundary

_main:
  adr X1, message // Load the address of the message into register X1
  mov X2, 14      // Load the length of the message into register X2
  bl print        // Call the print function

  mov X0, #0      // Load the exit code into register X0
  b exit          // Call the exit function

print:        // Pass in: X1 = message, X2 = length
  mov X16, #4 // 4 = specify the 'write' syscall
  mov X0, #1  // 1 = specify to write to stdout
  svc #0x80   // Execute the syscall
  ret         // Return to the caller (address in register X30)

exit:         // Pass in: X0 = exit code
  mov X16, #1 // 1 = specify the 'exit' syscall
  svc #0x80   // Execute the syscall

// Note we're not using the .data section to simplify a few things in this
// example. If you want to use it, consult this stackoverflow answer:
// https://stackoverflow.com/a/65354324

// Otherwise, you can use labels and the .ascii directive to define strings
// And `adr` to load the address of the string into a register
message: .ascii "Hello, world!\n"

