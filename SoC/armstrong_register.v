module armstrong_register (
    input wire clk,             // Clock signal
    input wire reset,           // Reset signal
    input wire iChip_select_n,  // Chip select signal (active low)
    input wire iWrite_n,        // Write enable (active low)
    input wire iRead_n,         // Read enable (active low)
    input wire [15:0] data_in,  // Input data bus (16-bit)
    output reg [15:0] data_out  // Output data bus (16-bit)
);
    // Internal registers
    reg [9:0] stored_number;    // 10-bit number input
    reg armstrong_result;       // 1 = Armstrong, 0 = Not Armstrong
    reg [3:0] hundreds;         // Hàng trăm
    reg [3:0] tens;             // Hàng chục
    reg [3:0] ones;             // Hàng đơn vị
    reg [31:0] sum;             // Tổng lũy thừa bậc 3

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            stored_number <= 10'b0;
            armstrong_result <= 1'b0;
            data_out <= 16'b0;
            hundreds <= 4'b0;
            tens <= 4'b0;
            ones <= 4'b0;
            sum <= 32'b0;
        end else begin
            if (~iChip_select_n && ~iWrite_n) begin
                // Lưu giá trị đầu vào
                stored_number <= data_in[9:0];
                $display("Stored Number: %d", stored_number);
            end else if (~iChip_select_n) begin
                // Tách các chữ số hàng trăm, chục và đơn vị
                hundreds  <= (stored_number / 100) % 10;
                tens      <= (stored_number / 10) % 10;
                ones      <= stored_number % 10;

                // Tính tổng lũy thừa bậc 3 của từng chữ số
                sum <= (hundreds * hundreds * hundreds) +
                       (tens * tens * tens) +
                       (ones * ones * ones);

                $display("Sum: %d", sum);

                // Kiểm tra điều kiện Armstrong
                armstrong_result <= (sum == stored_number) ? 1'b1 : 1'b0;
                $display("Armstrong Result: %d", armstrong_result);
            end

            if (~iRead_n) begin
                // Gửi kết quả ra data_out
                data_out <= {15'b0, armstrong_result};
                $display("Output Data: %d", data_out);
            end
        end
    end
endmodule
