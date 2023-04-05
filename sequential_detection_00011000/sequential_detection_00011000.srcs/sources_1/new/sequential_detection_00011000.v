`timescale 1ns / 1ps

module sequential_detection_00011000_moore(
    x,
    z,
    clk
    );
    input x,clk;
    output z;
    reg z;
    reg [3:0] state,D;
    parameter [3:0] 
    s0=4'b0000,
    s1=4'b0001,
    s2=4'b0010,
    s3=4'b0011,
    s4=4'b0100,
    s5=4'b0101,
    s6=4'b0110,
    s7=4'b0111,
    s8=4'b1000;
    
    always@(x or state)
    begin
        case(state)
        s0:if(x)D=s0;else D=s1;
        s1:if(x)D=s0;else D=s2;
        s2:if(x)D=s0;else D=s3;
        s3:if(x)D=s4;else D=s3;
        s4:if(x)D=s5;else D=s1;
        s5:if(x)D=s0;else D=s6;
        s6:if(x)D=s0;else D=s7;
        s7:if(x)D=s0;else D=s8;
        s8:if(x)D=s4;else D=s3;
        default:D=s0;
        endcase
    end
    
    always@(posedge clk)
    begin
    state<=D;
    end
    
    always@(state)
    begin 
        case(state)
        s0,s1,s2,s3,s4,s5,s6,s7:z=0;
        s8:z=1;
        default:z=0;
        endcase
    end
endmodule
