`timescale 1ns/1ps
module bitalu_4_tb;
   reg [3:0] A, B;
   reg INVA, ENA, ENB, F0, F1, CIN;
   wire [3:0] Result;
   wire COUT;
   
   bitalu_4 uut (
       .A(A), .B(B),
       .INVA(INVA), .ENA(ENA), .ENB(ENB),
       .F0(F0), .F1(F1),
       .CIN(CIN),
       .Result(Result), .COUT(COUT)
   );
   
   initial begin
       // Initialize inputs
       A = 4'b0000; B = 4'b0000;
       INVA = 0; ENA = 1; ENB = 1;
       F0 = 0; F1 = 0; CIN = 0;

       // Test Case 1: A
       #10 A = 4'b1010; B = 4'b0101; 
           INVA = 0; ENA = 1; ENB = 0; 
           F1 = 0; F0 = 1;CIN = 0;

       // Test Case 2: B
       #10 A = 4'b1010; B = 4'b0101; 
           INVA = 0;ENA = 0; ENB = 1; 
           F1 = 0; F0 = 1;CIN = 0;

       // Test Case 3: A'
       #10 A = 4'b1010; B = 4'b0101; 
           INVA = 1; ENA = 1; ENB = 0; 
           F1 = 0; F0 = 1;CIN = 0;

       // Test Case 4: B'
       #10 A = 4'b1010; B = 4'b0101; 
           INVA = 0;ENA = 0; ENB = 1; 
           F1 = 1; F0 = 0;CIN = 0;

       // Test Case 5: A + B
       #10 A = 4'b0011; B = 4'b0101; 
           INVA = 0; ENA = 1; ENB = 1; 
           F1 = 1; F0 = 1; CIN = 0;

       // Test Case 6: A + B + 1
       #10 A = 4'b0011; B = 4'b0101; 
           INVA = 0; ENA = 1; ENB = 1; 
           F1 = 1; F0 = 1; CIN = 1;

       // Test Case 7: A + 1
       #10 A = 4'b0011; B = 4'b0000; 
           INVA = 0; ENA = 1; ENB = 0; 
           F1 = 1; F0 = 1; CIN = 1;

       // Test Case 8: B + 1
       #10 A = 4'b0000; B = 4'b0101; 
           INVA = 0; ENA = 0; ENB = 1; 
           F1 = 1; F0 = 1; CIN = 1;

       // Test Case 9: B - A
       #10 A = 4'b0011; B = 4'b0101; 
           INVA = 1; ENA = 1; ENB = 1; 
           F1 = 1; F0 = 1; CIN = 1;

       // Test Case 10: B - 1
       #10 A = 4'b0000; B = 4'b0101; 
           INVA = 1; ENA = 0; ENB = 1; 
           F1 = 1; F0 = 1; CIN = 0;

       // Test Case 11: -A
       #10 A = 4'b1010; B = 4'b0000; 
           INVA = 1; ENA = 1; ENB = 0; 
           F1 = 1; F0 = 1;CIN = 1;

       // Test Case 12: A AND B
       #10 A = 4'b1010; B = 4'b0101; 
           INVA = 0; ENA = 1; ENB = 1; 
           F1 = 0; F0 = 0;CIN = 0;

       // Test Case 13: A OR B
       #10 A = 4'b1010; B = 4'b0101; 
           INVA = 0; ENA = 1; ENB = 1; 
           F1 = 0; F0 = 1;CIN = 0;

       // Test Case 14: 0
       #10 A = 4'b1010; B = 4'b0101; 
           INVA = 0; ENA = 0; ENB = 0; 
           F1 = 1; F0 = 1;CIN = 0;

       // Test Case 15: 1
       #10 A = 4'b1010; B = 4'b0101; 
           INVA = 0; ENA = 0; ENB = 0; 
           F1 = 1; F0 = 1; CIN = 1;

       // Test Case 16: -1
       #10 A = 4'b0000; B = 4'b0000; 
           INVA = 1; ENA = 0; ENB = 0; 
           F1 = 1; F0 = 1; CIN = 0;
       #10
       $finish;
   end
endmodule