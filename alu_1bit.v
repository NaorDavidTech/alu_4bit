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