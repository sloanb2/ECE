/*
 * Author: Bennet Sloan
 * Date: 4/29/2017
 * Description: Carry Look Ahead Adder, variable bit size (WIDTH)
 */

module full_adder 
    (
    i_bit1,
    i_bit2,
    i_carry,
    o_sum,
    o_carry
    );
 
    input  i_bit1;
    input  i_bit2;
    input  i_carry;
    output o_sum;
    output o_carry;

    assign o_sum   = i_bit1 ^ i_bit2 ^ i_carry;
    assign o_carry = ((i_bit1 ^ i_bit2) & i_carry) | (i_bit1 & i_bit2);
   
endmodule // full_adder
 
module carry_lookahead_adder #(parameter WIDTH=4)
    (
    input [WIDTH-1:0] i_add1,
    input [WIDTH-1:0] i_add2,
    output [WIDTH:0]  o_result
    );
     
  wire [WIDTH:0]    w_C;
  wire [WIDTH-1:0]  w_G, w_P, w_SUM;
 
    genvar ii;
    generate
        for (ii=0; ii<WIDTH; ii=ii+1) 
            begin
                full_adder full_adder_inst
                    ( 
                    .i_bit1(i_add1[ii]),
                    .i_bit2(i_add2[ii]),
                    .i_carry(w_C[ii]),
                    .o_sum(w_SUM[ii]),
                    .o_carry()
                    );
            end
    endgenerate
 
    genvar jj;
    generate
        for (jj=0; jj<WIDTH; jj=jj+1) 
            begin
                assign w_G[jj]   = i_add1[jj] & i_add2[jj];
                assign w_P[jj]   = i_add1[jj] | i_add2[jj];
                assign w_C[jj+1] = w_G[jj] | (w_P[jj] & w_C[jj]);
            end
    endgenerate
   
    assign w_C[0] = 1'b0;
    assign o_result = {w_C[WIDTH], w_SUM};

endmodule //carry_lookahead_adder

 
module carry_lookahead_adder_tb ();
 
    parameter WIDTH = 3;
    reg [WIDTH-1:0] r_ADD_1 = 0;
    reg [WIDTH-1:0] r_ADD_2 = 0;
    wire [WIDTH:0]  w_RESULT;
   
    carry_lookahead_adder #(.WIDTH(WIDTH)) carry_lookahead_inst
        (
        .i_add1(r_ADD_1),
        .i_add2(r_ADD_2),
        .o_result(w_RESULT)
        );
 
    initial
        begin
            #10;
            r_ADD_1 = 3'b000;
            r_ADD_2 = 3'b001;
            #10;
            r_ADD_1 = 3'b010;
             r_ADD_2 = 3'b010;
            #10;
            r_ADD_1 = 3'b101;
            r_ADD_2 = 3'b110;
            #10;
            r_ADD_1 = 3'b111;
            r_ADD_2 = 3'b111;
            #10;
        end
 
endmodule 