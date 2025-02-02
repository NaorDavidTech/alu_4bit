// 1-bit ALU module
module alu_1bit (
    input A, B, INVA, ENA, ENB,
    input F0, F1,
    input CIN,
    output reg Result,
    output COUT
);
    
    wire modified_A;
    wire modified_B;
    reg logic_out;
    wire [1:0] adder_out;
    
    assign modified_A = ENA ? (INVA ? ~A : A) : (INVA ? ~A : 1'b0);
    assign modified_B = ENB ? B : 1'b0;
    
    // Full Adder (dataflow)
    assign adder_out = modified_A + modified_B + CIN;
    assign COUT = adder_out[1];
    
    // Logical Unit
    always @(*) begin
        case ({F1, F0})
            2'b00: logic_out = modified_A & modified_B; 
            2'b01: logic_out = modified_A | modified_B;
            2'b10: logic_out = ~modified_B;
            default: logic_out = 1'b0;
        endcase
    end
    
    // Final output selection
    always @(*) begin
        case ({F1, F0})
            2'b00: Result = logic_out;        
            2'b01: Result = logic_out;       
            2'b10: Result = logic_out;     
            2'b11: Result = adder_out[0];    
            default: Result = 1'b0;
        endcase
    end
endmodule

// 4-bit ALU module
module bitalu_4 (
    input [3:0] A, B,
    input INVA, ENA, ENB,
    input F0, F1,
    input CIN,  
    output [3:0] Result,
    output COUT
);
    wire [3:0] carry_chain;

    assign carry_chain[0] = CIN;

    alu_1bit bit0 (
        .A(A[0]), 
        .B(B[0]), 
        .INVA(INVA), 
        .ENA(ENA), 
        .ENB(ENB),
        .F0(F0), 
        .F1(F1),
        .CIN(carry_chain[0]),
        .Result(Result[0]),
        .COUT(carry_chain[1])
    );
    
    alu_1bit bit1 (
        .A(A[1]), 
        .B(B[1]), 
        .INVA(INVA), 
        .ENA(ENA), 
        .ENB(ENB),
        .F0(F0), 
        .F1(F1),
        .CIN(carry_chain[1]),
        .Result(Result[1]),
        .COUT(carry_chain[2])
    );
    
    alu_1bit bit2 (
        .A(A[2]), 
        .B(B[2]), 
        .INVA(INVA), 
        .ENA(ENA), 
        .ENB(ENB),
        .F0(F0), 
        .F1(F1),
        .CIN(carry_chain[2]),
        .Result(Result[2]),
        .COUT(carry_chain[3])
    );
    
    alu_1bit bit3 (
        .A(A[3]), 
        .B(B[3]), 
        .INVA(INVA), 
        .ENA(ENA), 
        .ENB(ENB),
        .F0(F0), 
        .F1(F1),
        .CIN(carry_chain[3]),
        .Result(Result[3]),
        .COUT(COUT)
    );   
endmodule