module alu (input logic [7:0]srca, logic [7:0]srcb, logic [2:0]alucontrol, logic [7:0]zero, output logic aluout);
	always @(posedge clk)
	begin
		case (alucontrol)
			3'b000 : aluout <= srca & srcb;	// A and B
			3'b001 : aluout <= srca | srcb;	// A or B
			3'b010 : aluout <= srca + srcb;	// A + B

			3'b100 : aluout <= srca & ~srcb; // A and ~B
			3'b101 : aluout <= srca | ~srcb; // A or ~B
			3'b110 : aluout <= srca - srcb;	// A - B
			3'b111 : // SLT

			begin 
				if (srca < srcb)
					aluout <= 1;
				else if (srca > srcb)
					aluout <= 0;
			end

			default: aluout <= zero;

		endcase
	end

endmodule