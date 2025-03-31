module armstrong_number_checker(
    input clk,           // Clock
    input reset_n,       // Reset active low
    input [7:0] sw,      // Input from 8-bit switches in binary
    output reg is_armstrong // Output to indicate if it's an Armstrong number
);
    // Registers to store digits
    reg [3:0] digit1, digit2, digit3;
    reg [15:0] cube_sum;

    // Synchronous logic block with clock and reset
    always @(posedge clk or negedge reset_n) begin
        // Check reset
        if (!reset_n) begin
            // Reset all states
            is_armstrong <= 1'b0;
            digit1 <= 4'b0;
            digit2 <= 4'b0;
            digit3 <= 4'b0;
            cube_sum <= 16'b0;
        end
        else begin
            // Extract digits from the input
            digit1 <= sw % 10;          // Units digit
            digit2 <= (sw / 10) % 10;   // Tens digit
            digit3 <= sw / 100;         // Hundreds digit
            
            // Calculate sum of cubes of digits
            cube_sum <= (digit1 * digit1 * digit1) + 
                        (digit2 * digit2 * digit2) + 
                        (digit3 * digit3 * digit3);
            
            // Check if sum of cubes equals the original number
            is_armstrong <= (cube_sum == sw);
        end
    end
endmodule