module sbox (
    input wire [127:0] s_in,
    input wire clk,
    input wire rst,
    output reg [127:0] s_o
);
    reg [4:0] bytecounter=5'b0000;
	reg [1:0] state, next_state=2'b00;
    reg [7:0] sub;
    reg [127:0] temp, temp2=128'h0;

     localparam IDLE = 2'b00;
    localparam SUB_BYTE = 2'b01;
    localparam DONE = 2'b10;

    always @(posedge clk ) begin
        if (!rst&&s_in) begin
            bytecounter <= 5'b00000;
            state <=IDLE;
             temp<=s_in;
        end else begin
           bytecounter <= bytecounter + 1;

           state <= SUB_BYTE;
        
        case (state)

            IDLE: begin
				//  temp<=s_in;
                // if(s_in)begin
				// 	 temp<=s_in;
            
                 next_state <= SUB_BYTE;
				//end
              //  else begin
                  
                
                
                //             next_state <= SUB_BYTE;
                // end
            end

            SUB_BYTE: begin
                   
				if(bytecounter)begin
                case (temp[7:0])
                        8'h00: sub = 8'h63; 8'h01: sub = 8'h7c; 8'h02: sub = 8'h77; 8'h03: sub = 8'h7b;
                        8'h04: sub = 8'hf2; 8'h05: sub = 8'h6b; 8'h06: sub = 8'h6f; 8'h07: sub = 8'hc5;
                        8'h08: sub = 8'h30; 8'h09: sub = 8'h01; 8'h0a: sub = 8'h67; 8'h0b: sub = 8'h2b;
                        8'h0c: sub = 8'hfe; 8'h0d: sub = 8'hd7; 8'h0e: sub = 8'hab; 8'h0f: sub = 8'h76;
                        8'h10: sub = 8'hca; 8'h11: sub = 8'h82; 8'h12: sub = 8'hc9; 8'h13: sub = 8'h7d;
                        8'h14: sub = 8'hfa; 8'h15: sub = 8'h59; 8'h16: sub = 8'h47; 8'h17: sub = 8'hf0;
                        8'h18: sub = 8'had; 8'h19: sub = 8'hd4; 8'h1a: sub = 8'ha2; 8'h1b: sub = 8'haf;
                        8'h1c: sub = 8'h9c; 8'h1d: sub = 8'ha4; 8'h1e: sub = 8'h72; 8'h1f: sub = 8'hc0;
                        8'h20: sub = 8'hb7; 8'h21: sub = 8'hfd; 8'h22: sub = 8'h93; 8'h23: sub = 8'h26;
                        8'h24: sub = 8'h36; 8'h25: sub = 8'h3f; 8'h26: sub = 8'hf7; 8'h27: sub = 8'hcc;
                        8'h28: sub = 8'h34; 8'h29: sub = 8'ha5; 8'h2a: sub = 8'he5; 8'h2b: sub = 8'hf1;
                        8'h2c: sub = 8'h71; 8'h2d: sub = 8'hd8; 8'h2e: sub = 8'h31; 8'h2f: sub = 8'h15;
                        8'h30: sub = 8'h04; 8'h31: sub = 8'hc7; 8'h32: sub = 8'h23; 8'h33: sub = 8'hc3;
                        8'h34: sub = 8'h18; 8'h35: sub = 8'h96; 8'h36: sub = 8'h05; 8'h37: sub = 8'h9a;
                        8'h38: sub = 8'h07; 8'h39: sub = 8'h12; 8'h3a: sub = 8'h80; 8'h3b: sub = 8'he2;
                        8'h3c: sub = 8'heb; 8'h3d: sub = 8'h27; 8'h3e: sub = 8'hb2; 8'h3f: sub = 8'h75;
                        8'h40: sub = 8'h09; 8'h41: sub = 8'h83; 8'h42: sub = 8'h2c; 8'h43: sub = 8'h1a;
                        8'h44: sub = 8'h1b; 8'h45: sub = 8'h6e; 8'h46: sub = 8'h5a; 8'h47: sub = 8'ha0;
                        8'h48: sub = 8'h52; 8'h49: sub = 8'h3b; 8'h4a: sub = 8'hd6; 8'h4b: sub = 8'hb3;
                        8'h4c: sub = 8'h29; 8'h4d: sub = 8'he3; 8'h4e: sub = 8'h2f; 8'h4f: sub = 8'h84;
                        8'h50: sub = 8'h53; 8'h51: sub = 8'hd1; 8'h52: sub = 8'h00; 8'h53: sub = 8'hed;
                        8'h54: sub = 8'h20; 8'h55: sub = 8'hfc; 8'h56: sub = 8'hb1; 8'h57: sub = 8'h5b;
                        8'h58: sub = 8'h6a; 8'h59: sub = 8'hcb; 8'h5a: sub = 8'hbe; 8'h5b: sub = 8'h39;
                        8'h5c: sub = 8'h4a; 8'h5d: sub = 8'h4c; 8'h5e: sub = 8'h58; 8'h5f: sub = 8'hcf;
                        8'h60: sub = 8'hd0; 8'h61: sub = 8'hef; 8'h62: sub = 8'haa; 8'h63: sub = 8'hfb;
                        8'h64: sub = 8'h43; 8'h65: sub = 8'h4d; 8'h66: sub = 8'h33; 8'h67: sub = 8'h85;
                        8'h68: sub = 8'h45; 8'h69: sub = 8'hf9; 8'h6a: sub = 8'h02; 8'h6b: sub = 8'h7f;
                        8'h6c: sub = 8'h50; 8'h6d: sub = 8'h3c; 8'h6e: sub = 8'h9f; 8'h6f: sub = 8'ha8;
                        8'h70: sub = 8'h51; 8'h71: sub = 8'ha3; 8'h72: sub = 8'h40; 8'h73: sub = 8'h8f;
                        8'h74: sub = 8'h92; 8'h75: sub = 8'h9d; 8'h76: sub = 8'h38; 8'h77: sub = 8'hf5;
                        8'h78: sub = 8'hbc; 8'h79: sub = 8'hb6; 8'h7a: sub = 8'hda; 8'h7b: sub = 8'h21;
                        8'h7c: sub = 8'h10; 8'h7d: sub = 8'hff; 8'h7e: sub = 8'hf3; 8'h7f: sub = 8'hd2;
                        8'h80: sub = 8'hcd; 8'h81: sub = 8'h0c; 8'h82: sub = 8'h13; 8'h83: sub = 8'hec;
                        8'h84: sub = 8'h5f; 8'h85: sub = 8'h97; 8'h86: sub = 8'h44; 8'h87: sub = 8'h17;
                        8'h88: sub = 8'hc4; 8'h89: sub = 8'ha7; 8'h8a: sub = 8'h7e; 8'h8b: sub = 8'h3d;
                        8'h8c: sub = 8'h64; 8'h8d: sub = 8'h5d; 8'h8e: sub = 8'h19; 8'h8f: sub = 8'h73;
                        8'h90: sub = 8'h60; 8'h91: sub = 8'h81; 8'h92: sub = 8'h4f; 8'h93: sub = 8'hdc;
                        8'h94: sub = 8'h22; 8'h95: sub = 8'h2a; 8'h96: sub = 8'h90; 8'h97: sub = 8'h88;
                        8'h98: sub = 8'h46; 8'h99: sub = 8'hee; 8'h9a: sub = 8'hb8; 8'h9b: sub = 8'h14;
                        8'h9c: sub = 8'hde; 8'h9d: sub = 8'h5e; 8'h9e: sub = 8'h0b; 8'h9f: sub = 8'hdb;
                        8'ha0: sub = 8'he0; 8'ha1: sub = 8'h32; 8'ha2: sub = 8'h3a; 8'ha3: sub = 8'h0a;
                        8'ha4: sub = 8'h49; 8'ha5: sub = 8'h06; 8'ha6: sub = 8'h24; 8'ha7: sub = 8'h5c;
                        8'ha8: sub = 8'hc2; 8'ha9: sub = 8'hd3; 8'haa: sub = 8'hac; 8'hab: sub = 8'h62;
                        8'hac: sub = 8'h91; 8'had: sub = 8'h95; 8'hae: sub = 8'he4; 8'haf: sub = 8'h79;
                        8'hb0: sub = 8'he7; 8'hb1: sub = 8'hc8; 8'hb2: sub = 8'h37; 8'hb3: sub = 8'h6d;
                        8'hb4: sub = 8'h8d; 8'hb5: sub = 8'hd5; 8'hb6: sub = 8'h4e; 8'hb7: sub = 8'ha9;
                        8'hb8: sub = 8'h6c; 8'hb9: sub = 8'h56; 8'hba: sub = 8'hf4; 8'hbb: sub = 8'hea;
                        8'hbc: sub = 8'h65; 8'hbd: sub = 8'h7a; 8'hbe: sub = 8'hae; 8'hbf: sub = 8'h08;
                        8'hc0: sub = 8'hba; 8'hc1: sub = 8'h78; 8'hc2: sub = 8'h25; 8'hc3: sub = 8'h2e;
                        8'hc4: sub = 8'h1c; 8'hc5: sub = 8'ha6; 8'hc6: sub = 8'hb4; 8'hc7: sub = 8'hc6;
                        8'hc8: sub = 8'he8; 8'hc9: sub = 8'hdd; 8'hca: sub = 8'h74; 8'hcb: sub = 8'h1f;
                        8'hcc: sub = 8'h4b; 8'hcd: sub = 8'hbd; 8'hce: sub = 8'h8b; 8'hcf: sub = 8'h8a;
                        8'hd0: sub = 8'h70; 8'hd1: sub = 8'h3e; 8'hd2: sub = 8'hb5; 8'hd3: sub = 8'h66;
                        8'hd4: sub = 8'h48; 8'hd5: sub = 8'h03; 8'hd6: sub = 8'hf6; 8'hd7: sub = 8'h0e;
                        8'hd8: sub = 8'h61; 8'hd9: sub = 8'h35; 8'hda: sub = 8'h57; 8'hdb: sub = 8'hb9;
                        8'hdc: sub = 8'h86; 8'hdd: sub = 8'hc1; 8'hde: sub = 8'h1d; 8'hdf: sub = 8'h9e;
                        8'he0: sub = 8'he1; 8'he1: sub = 8'hf8; 8'he2: sub = 8'h98; 8'he3: sub = 8'h11;
                        8'he4: sub = 8'h69; 8'he5: sub = 8'hd9; 8'he6: sub = 8'h8e; 8'he7: sub = 8'h94;
                        8'he8: sub = 8'h9b; 8'he9: sub = 8'h1e; 8'hea: sub = 8'h87; 8'heb: sub = 8'he9;
                        8'hec: sub = 8'hce; 8'hed: sub = 8'h55; 8'hee: sub = 8'h28; 8'hef: sub = 8'hdf;
                        8'hf0: sub = 8'h8c; 8'hf1: sub = 8'ha1; 8'hf2: sub = 8'h89; 8'hf3: sub = 8'h0d;
                        8'hf4: sub = 8'hbf; 8'hf5: sub = 8'he6; 8'hf6: sub = 8'h42; 8'hf7: sub = 8'h68;
                        8'hf8: sub = 8'h41; 8'hf9: sub = 8'h99; 8'hfa: sub = 8'h2d; 8'hfb: sub = 8'h0f;
                        8'hfc: sub = 8'hb0; 8'hfd: sub = 8'h54; 8'hfe: sub = 8'hbb; 8'hff: sub = 8'h16;
                    endcase
 
                temp2 <= {sub[7:0], temp2[127:8]};
                temp <= temp >> 8;
			end
                  if (bytecounter == 5'h11) begin
                     s_o <= temp2;
                      next_state<=DONE;
                  end
                
            end
            DONE:begin
                
                 s_o <= temp2;
            next_state<=IDLE;
            
            end
            default:begin
            next_state<=IDLE;
            end
             
        endcase
        
        end
    end

    always @(*) begin
		
        // case (state)

        //     IDLE: begin
				
        //         if(s_in)begin
		// 			 temp=s_in;
            
                
		// 		end
        //         else begin
                  
                
                
        //                     next_state = SUB_BYTE;
        //         end
        //     end

        //     SUB_BYTE: begin
                   
		// 		if(bytecounter)begin
        //         case (temp[7:0])
        //                 8'h00: sub = 8'h63; 8'h01: sub = 8'h7c; 8'h02: sub = 8'h77; 8'h03: sub = 8'h7b;
        //                 8'h04: sub = 8'hf2; 8'h05: sub = 8'h6b; 8'h06: sub = 8'h6f; 8'h07: sub = 8'hc5;
        //                 8'h08: sub = 8'h30; 8'h09: sub = 8'h01; 8'h0a: sub = 8'h67; 8'h0b: sub = 8'h2b;
        //                 8'h0c: sub = 8'hfe; 8'h0d: sub = 8'hd7; 8'h0e: sub = 8'hab; 8'h0f: sub = 8'h76;
        //                 8'h10: sub = 8'hca; 8'h11: sub = 8'h82; 8'h12: sub = 8'hc9; 8'h13: sub = 8'h7d;
        //                 8'h14: sub = 8'hfa; 8'h15: sub = 8'h59; 8'h16: sub = 8'h47; 8'h17: sub = 8'hf0;
        //                 8'h18: sub = 8'had; 8'h19: sub = 8'hd4; 8'h1a: sub = 8'ha2; 8'h1b: sub = 8'haf;
        //                 8'h1c: sub = 8'h9c; 8'h1d: sub = 8'ha4; 8'h1e: sub = 8'h72; 8'h1f: sub = 8'hc0;
        //                 8'h20: sub = 8'hb7; 8'h21: sub = 8'hfd; 8'h22: sub = 8'h93; 8'h23: sub = 8'h26;
        //                 8'h24: sub = 8'h36; 8'h25: sub = 8'h3f; 8'h26: sub = 8'hf7; 8'h27: sub = 8'hcc;
        //                 8'h28: sub = 8'h34; 8'h29: sub = 8'ha5; 8'h2a: sub = 8'he5; 8'h2b: sub = 8'hf1;
        //                 8'h2c: sub = 8'h71; 8'h2d: sub = 8'hd8; 8'h2e: sub = 8'h31; 8'h2f: sub = 8'h15;
        //                 8'h30: sub = 8'h04; 8'h31: sub = 8'hc7; 8'h32: sub = 8'h23; 8'h33: sub = 8'hc3;
        //                 8'h34: sub = 8'h18; 8'h35: sub = 8'h96; 8'h36: sub = 8'h05; 8'h37: sub = 8'h9a;
        //                 8'h38: sub = 8'h07; 8'h39: sub = 8'h12; 8'h3a: sub = 8'h80; 8'h3b: sub = 8'he2;
        //                 8'h3c: sub = 8'heb; 8'h3d: sub = 8'h27; 8'h3e: sub = 8'hb2; 8'h3f: sub = 8'h75;
        //                 8'h40: sub = 8'h09; 8'h41: sub = 8'h83; 8'h42: sub = 8'h2c; 8'h43: sub = 8'h1a;
        //                 8'h44: sub = 8'h1b; 8'h45: sub = 8'h6e; 8'h46: sub = 8'h5a; 8'h47: sub = 8'ha0;
        //                 8'h48: sub = 8'h52; 8'h49: sub = 8'h3b; 8'h4a: sub = 8'hd6; 8'h4b: sub = 8'hb3;
        //                 8'h4c: sub = 8'h29; 8'h4d: sub = 8'he3; 8'h4e: sub = 8'h2f; 8'h4f: sub = 8'h84;
        //                 8'h50: sub = 8'h53; 8'h51: sub = 8'hd1; 8'h52: sub = 8'h00; 8'h53: sub = 8'hed;
        //                 8'h54: sub = 8'h20; 8'h55: sub = 8'hfc; 8'h56: sub = 8'hb1; 8'h57: sub = 8'h5b;
        //                 8'h58: sub = 8'h6a; 8'h59: sub = 8'hcb; 8'h5a: sub = 8'hbe; 8'h5b: sub = 8'h39;
        //                 8'h5c: sub = 8'h4a; 8'h5d: sub = 8'h4c; 8'h5e: sub = 8'h58; 8'h5f: sub = 8'hcf;
        //                 8'h60: sub = 8'hd0; 8'h61: sub = 8'hef; 8'h62: sub = 8'haa; 8'h63: sub = 8'hfb;
        //                 8'h64: sub = 8'h43; 8'h65: sub = 8'h4d; 8'h66: sub = 8'h33; 8'h67: sub = 8'h85;
        //                 8'h68: sub = 8'h45; 8'h69: sub = 8'hf9; 8'h6a: sub = 8'h02; 8'h6b: sub = 8'h7f;
        //                 8'h6c: sub = 8'h50; 8'h6d: sub = 8'h3c; 8'h6e: sub = 8'h9f; 8'h6f: sub = 8'ha8;
        //                 8'h70: sub = 8'h51; 8'h71: sub = 8'ha3; 8'h72: sub = 8'h40; 8'h73: sub = 8'h8f;
        //                 8'h74: sub = 8'h92; 8'h75: sub = 8'h9d; 8'h76: sub = 8'h38; 8'h77: sub = 8'hf5;
        //                 8'h78: sub = 8'hbc; 8'h79: sub = 8'hb6; 8'h7a: sub = 8'hda; 8'h7b: sub = 8'h21;
        //                 8'h7c: sub = 8'h10; 8'h7d: sub = 8'hff; 8'h7e: sub = 8'hf3; 8'h7f: sub = 8'hd2;
        //                 8'h80: sub = 8'hcd; 8'h81: sub = 8'h0c; 8'h82: sub = 8'h13; 8'h83: sub = 8'hec;
        //                 8'h84: sub = 8'h5f; 8'h85: sub = 8'h97; 8'h86: sub = 8'h44; 8'h87: sub = 8'h17;
        //                 8'h88: sub = 8'hc4; 8'h89: sub = 8'ha7; 8'h8a: sub = 8'h7e; 8'h8b: sub = 8'h3d;
        //                 8'h8c: sub = 8'h64; 8'h8d: sub = 8'h5d; 8'h8e: sub = 8'h19; 8'h8f: sub = 8'h73;
        //                 8'h90: sub = 8'h60; 8'h91: sub = 8'h81; 8'h92: sub = 8'h4f; 8'h93: sub = 8'hdc;
        //                 8'h94: sub = 8'h22; 8'h95: sub = 8'h2a; 8'h96: sub = 8'h90; 8'h97: sub = 8'h88;
        //                 8'h98: sub = 8'h46; 8'h99: sub = 8'hee; 8'h9a: sub = 8'hb8; 8'h9b: sub = 8'h14;
        //                 8'h9c: sub = 8'hde; 8'h9d: sub = 8'h5e; 8'h9e: sub = 8'h0b; 8'h9f: sub = 8'hdb;
        //                 8'ha0: sub = 8'he0; 8'ha1: sub = 8'h32; 8'ha2: sub = 8'h3a; 8'ha3: sub = 8'h0a;
        //                 8'ha4: sub = 8'h49; 8'ha5: sub = 8'h06; 8'ha6: sub = 8'h24; 8'ha7: sub = 8'h5c;
        //                 8'ha8: sub = 8'hc2; 8'ha9: sub = 8'hd3; 8'haa: sub = 8'hac; 8'hab: sub = 8'h62;
        //                 8'hac: sub = 8'h91; 8'had: sub = 8'h95; 8'hae: sub = 8'he4; 8'haf: sub = 8'h79;
        //                 8'hb0: sub = 8'he7; 8'hb1: sub = 8'hc8; 8'hb2: sub = 8'h37; 8'hb3: sub = 8'h6d;
        //                 8'hb4: sub = 8'h8d; 8'hb5: sub = 8'hd5; 8'hb6: sub = 8'h4e; 8'hb7: sub = 8'ha9;
        //                 8'hb8: sub = 8'h6c; 8'hb9: sub = 8'h56; 8'hba: sub = 8'hf4; 8'hbb: sub = 8'hea;
        //                 8'hbc: sub = 8'h65; 8'hbd: sub = 8'h7a; 8'hbe: sub = 8'hae; 8'hbf: sub = 8'h08;
        //                 8'hc0: sub = 8'hba; 8'hc1: sub = 8'h78; 8'hc2: sub = 8'h25; 8'hc3: sub = 8'h2e;
        //                 8'hc4: sub = 8'h1c; 8'hc5: sub = 8'ha6; 8'hc6: sub = 8'hb4; 8'hc7: sub = 8'hc6;
        //                 8'hc8: sub = 8'he8; 8'hc9: sub = 8'hdd; 8'hca: sub = 8'h74; 8'hcb: sub = 8'h1f;
        //                 8'hcc: sub = 8'h4b; 8'hcd: sub = 8'hbd; 8'hce: sub = 8'h8b; 8'hcf: sub = 8'h8a;
        //                 8'hd0: sub = 8'h70; 8'hd1: sub = 8'h3e; 8'hd2: sub = 8'hb5; 8'hd3: sub = 8'h66;
        //                 8'hd4: sub = 8'h48; 8'hd5: sub = 8'h03; 8'hd6: sub = 8'hf6; 8'hd7: sub = 8'h0e;
        //                 8'hd8: sub = 8'h61; 8'hd9: sub = 8'h35; 8'hda: sub = 8'h57; 8'hdb: sub = 8'hb9;
        //                 8'hdc: sub = 8'h86; 8'hdd: sub = 8'hc1; 8'hde: sub = 8'h1d; 8'hdf: sub = 8'h9e;
        //                 8'he0: sub = 8'he1; 8'he1: sub = 8'hf8; 8'he2: sub = 8'h98; 8'he3: sub = 8'h11;
        //                 8'he4: sub = 8'h69; 8'he5: sub = 8'hd9; 8'he6: sub = 8'h8e; 8'he7: sub = 8'h94;
        //                 8'he8: sub = 8'h9b; 8'he9: sub = 8'h1e; 8'hea: sub = 8'h87; 8'heb: sub = 8'he9;
        //                 8'hec: sub = 8'hce; 8'hed: sub = 8'h55; 8'hee: sub = 8'h28; 8'hef: sub = 8'hdf;
        //                 8'hf0: sub = 8'h8c; 8'hf1: sub = 8'ha1; 8'hf2: sub = 8'h89; 8'hf3: sub = 8'h0d;
        //                 8'hf4: sub = 8'hbf; 8'hf5: sub = 8'he6; 8'hf6: sub = 8'h42; 8'hf7: sub = 8'h68;
        //                 8'hf8: sub = 8'h41; 8'hf9: sub = 8'h99; 8'hfa: sub = 8'h2d; 8'hfb: sub = 8'h0f;
        //                 8'hfc: sub = 8'hb0; 8'hfd: sub = 8'h54; 8'hfe: sub = 8'hbb; 8'hff: sub = 8'h16;
        //             endcase
 
        //         temp2 = {sub[7:0], temp2[127:8]};
        //         temp = temp >> 8;
		// 	end
        //           if (bytecounter == 5'h10) begin
        //              s_o <= temp2;
        //               next_state=DONE;
        //           end
                
        //     end
        //     DONE:begin
                
        //          s_o = temp2;
        //     next_state=IDLE;
            
        //     end
        //     default:begin
        //     next_state=IDLE;
        //     end
             
        // endcase
    end
endmodule
