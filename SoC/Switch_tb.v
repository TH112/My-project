`timescale 1ns / 1ps

module switches_tb;

    reg iClk;
    reg iReset_n;
    reg iChip_select_n;
    reg iRead_n;
    reg [31:0] iSwitches_data;
    wire [31:0] oSwitches_reg;

    // Instance c?a module switches
    switches uut (
        .iClk(iClk),
        .iReset_n(iReset_n),
        .iChip_select_n(iChip_select_n),
        .iRead_n(iRead_n),
        .iSwitches_data(iSwitches_data),
        .oSwitches_reg(oSwitches_reg)
    );

    // T?o xung clock 50 MHz
    initial begin
        iClk = 0;
        forever #10 iClk = ~iClk;  // Xung clock 50 MHz (chu k? 20ns)
    end

    // T?o c�c t�nh hu?ng ki?m tra
    initial begin
        // Reset h? th?ng
        iReset_n = 0;
        iChip_select_n = 1;
        iRead_n = 1;
        iSwitches_data = 32'd0;
        #20;

        // B? reset
        iReset_n = 1;
        #20;

        // T�nh hu?ng 1: Ghi gi� tr? m?i v�o oSwitches_reg
        iChip_select_n = 0;
        iRead_n = 0;
        iSwitches_data = 32'd12345;
        #20;
        iChip_select_n = 1;
        iRead_n = 1;
        #20;

        // T�nh hu?ng 2: Ki?m tra n?u kh�ng c� ghi gi� tr?
        iSwitches_data = 32'd54321;
        #20;

        // K?t th�c ki?m tra
        $stop;
    end
endmodule

