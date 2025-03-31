#include <stdio.h>
#include "io.h"
#include "system.h"
#include <unistd.h>
#include <stdint.h>

// Định nghĩa các địa chỉ cơ sở
uint32_t *switch_base = (uint32_t*)SWITCH_0_BASE;  // Đọc giá trị từ switch
uint32_t *hex0 = (uint32_t*)HEX_0_BASE;           // Ghi giá trị ra HEX

int main() {
    while(1) {
        // Đọc giá trị từ switch
        int y = IORD(SWITCH_0_BASE, 0);  // Đọc giá trị từ switch
        printf("Switch Value: %d\n", y);

        // Gửi giá trị đọc được vào ARM (nếu cần thiết)
        IOWR(ARM_0_BASE, 0, y);  // Gửi giá trị y từ switch vào ARM

        // Đợi một khoảng thời gian để mô-đun xử lý giá trị
        usleep(1000);  // 1ms

        // Đọc kết quả từ ARM
        int kq = IORD(ARM_0_BASE, 0);
        printf("ARM Result: %d\n", kq);


        // Ghi giá trị vào HEX để hiển thị
        *hex0 = kq;

        // Delay 100ms
        usleep(100000);  // 100ms
    }

    return 0;
}
