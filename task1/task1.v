 module task1(Z, clk, I);
  input clk;
  input [3:0] I;
  output reg [1:0] Z;  // Z2, and Z1
  reg [3:0] state=4'b0000;     

always @(posedge clk) /*state changes, Synchronous Reset*/
begin
    if ((state == 4'b1011)&(I==2'b00)) state = 0;
    else if ((state == 4'b0011) & (I == 2'b01)) state = 0;
    else if ((state == 4'b0101) & (I == 2'b10)) state = 0;
    else if ((state == 4'b0001) & (I == 2'b11)) state = 0;
    else state = state + 1;
end // always posedge clk

  always @(state)
  begin
    // Output logic
    case (I)
      2'b00: // I=0
        case (state)
          4'b0000: Z = 2'b11;
          4'b0001: Z = 2'b10;
          4'b0010: Z = 2'b00;
          4'b0011: Z = 2'b11;
          4'b0100: Z = 2'b11;
          4'b0101: Z = 2'b00;
          4'b0110: Z = 2'b10;
          4'b0111: Z = 2'b11;
          4'b1000: Z = 2'b01;
          4'b1001: Z = 2'b10;
          4'b1010: Z = 2'b10;
          4'b1011: Z = 2'b01;
          default: Z = 2'bxx;
        endcase

      2'b01: // I=1
        case (state)
          4'b0000: Z = 2'b01;
          4'b0001: Z = 2'b11;
          4'b0010: Z = 2'b10;
          4'b0011: Z = 2'b00;
          default: Z = 2'bxx;
        endcase

      2'b10: // I=2
        case (state)
          4'b0000: Z = 2'b10;
          4'b0001: Z = 2'b01;
          4'b0010: Z = 2'b10;
          4'b0011: Z = 2'b10;
          4'b0100: Z = 2'b11;
          4'b0101: Z = 2'b00;
          default: Z = 2'bxx;
        endcase

      2'b11: // I=3
        case (state)
          4'b0000: Z = 2'b01;
          4'b0001: Z = 2'b10;
          default: Z = 2'bxx;

        endcase
      default: Z = 2'bxx;  
endcase
end
endmodule