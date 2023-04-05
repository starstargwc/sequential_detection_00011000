`timescale 1ns / 1ps

module sequential_detection_00011000_mealy(
    x,
    z,
    clk
    );
    input x,clk;
    output z;
    reg z;
    reg [2:0] state,D;
    parameter [2:0] 
    s0=4'b000,
    s1=4'b001,
    s2=4'b010,
    s3=4'b011,
    s4=4'b100,
    s5=4'b101,
    s6=4'b110,
    s7=4'b111;
    
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
        s7:if(x)D=s0;else D=s3;
        default:D=s0;
        endcase
    end
    
    always@(posedge clk)
    begin
    state<=D;
    end
    
    always@(state or x)
    begin 
        case(state)
        s0,s1,s2,s3,s4,s5,s6,s7&x:z=0;
        s7&~x:z=1;
        default:z=0;
        endcase
    end
    
endmodule
