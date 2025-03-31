#include <stdio.h>
#include <stdint.h>
#include "io.h"
#include "system.h"

int main() {
    uint32_t *hex0 = (uint32_t *)HEX_0_BASE;
    uint32_t *check = (uint32_t *)ARM_0_BASE;

    *hex0 = (uint32_t)check;
    printf("Address of check: %p\n", (void *)check);

    return 0;
}
