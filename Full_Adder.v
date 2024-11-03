`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 16:43:04
// Design Name: 
// Module Name: Full_Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module  Full_Adder (
       input a,b,carry_in,
       output reg sum,carry_out
    );
    
    always @(*) begin
      case ({a, b, carry_in}) 
            3'b000: begin
                sum = 1'b0;
                carry_out = 1'b0;
            end
            3'b001: begin
                sum = 1'b1;
                carry_out = 1'b0;
            end
            3'b010: begin
                sum = 1'b1;
                carry_out = 1'b0;
            end
            3'b011: begin
                sum = 1'b0;
                carry_out = 1'b1;
            end
            3'b100: begin
                sum = 1'b1;
                carry_out = 1'b0;
            end
            3'b101: begin
                sum = 1'b0;
                carry_out = 1'b1;
            end
            3'b110: begin
                sum = 1'b0;
                carry_out = 1'b1;
            end
            3'b111: begin
                sum = 1'b1;
                carry_out = 1'b1;
            end
            default: begin
                sum = 1'b0;       
                carry_out = 1'b0; 
            end
        endcase
     end 
endmodule


module n_bit_adder #(parameter N=2)(
    input [N-1:0] a,b,
    output [N:0] sum
);
    generate 
    genvar i;
    wire [N-1:0] helper_carry;
    for (i=0;i<N;i=i+1) begin :Full_Adder_Create
        if(i==0) begin 
            Full_Adder adder(a[0],b[0],1'b0,sum[0],helper_carry[i]);
        end
        else begin 
            Full_Adder adder(a[i],b[i],helper_carry[i-1],sum[i],helper_carry[i]);
        end
    end
    assign sum[N]=helper_carry[N-1];
    endgenerate 


endmodule