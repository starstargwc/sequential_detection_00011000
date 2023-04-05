`timescale 1ns / 1ps
//时钟周期为25ns
module sequential_detection_00011000_tb();

    reg [31:0] data;
    reg s_clk;
    wire s_x,s_zmoore,s_zmealy;

    assign s_x=data[31];
    sequential_detection_00011000_moore tb1(
        .x(s_x),
        .z(s_zmoore),
       .clk(s_clk)
        );
    sequential_detection_00011000_mealy tb2(
        .x(s_x),
        .z(s_zmealy),
        .clk(s_clk)
    );    
    initial 
    begin
    s_clk=0;
    data=32'b0001_0110_0001_1000_0001_1000_1000_0111;
    end
  
    always begin  s_clk=~s_clk; #12.5;  end
    always@(posedge s_clk)   data={data[30:0],data[31]};
    
endmodule

