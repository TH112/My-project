module hex
(
    input iClk,
    input iReset_n,
    input iChip_select_n,
    input iWrite_n,
    input [31:0] iHex_data,
    output reg [0:6] HEX
);
    always@(posedge iClk, negedge iReset_n)
    begin
        if (~iReset_n)
        begin
            HEX <= 7'b0000001;  // Hiển thị số 0 khi reset
        end
        else
        begin
            if (~iChip_select_n & ~iWrite_n)
            begin
                case(iHex_data[0])  // Dùng chỉ bit 0 của iHex_data (giả sử chỉ có 0 hoặc 1)
                    1'b0: HEX <= 7'b0000001;  // Hiển thị 0
                    1'b1: HEX <= 7'b1001111;  // Hiển thị 1
                    default: HEX <= 7'b1111111;  // Tắt LED nếu không phải 0 hoặc 1
                endcase
            end
        end
    end
endmodule
