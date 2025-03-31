module switches
(
    input iClk,
    input iReset_n,
    input iChip_select_n,
    input iRead_n,
    input [9:0] iSwitches_data,   // Chỉ lấy 10 bit từ switch
    output reg [15:0] oSwitches_reg // Cập nhật ra 10 bit
);

always @(posedge iClk or negedge iReset_n) begin
    if (~iReset_n) begin
        oSwitches_reg <= 10'd0;   // Reset giá trị ra 10 bit 0
    end else begin
        if (~iChip_select_n && ~iRead_n) begin
            oSwitches_reg <= iSwitches_data; // Lưu giá trị 10 bit từ switch
        end
    end
end

endmodule
