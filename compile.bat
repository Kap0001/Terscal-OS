nasm -f bin Bootloader.asm -o TerscalOS.bin
pause>nul
copy /b TerscalOS.bin TerscalOS.img
pause>nul
qemu-system-x86_64 TerscalOS.img
