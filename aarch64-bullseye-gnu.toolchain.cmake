set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(GCC_COMPILER_VERSION "" CACHE STRING "GCC Compiler version")
set(GNU_MACHINE "aarch64-bullseye-linux-gnu" CACHE STRING "GNU compiler triple")
set(ARM_LINUX_SYSROOT /usr/local/aarch64-linux-gnu/sysroot)
include("${CMAKE_CURRENT_LIST_DIR}/opencv/platforms/linux/arm.toolchain.cmake")
