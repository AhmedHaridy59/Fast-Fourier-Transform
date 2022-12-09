//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  
// 
// Create Date: 06/02/2021 04:49:28 AM
// Design Name: 
// Module Name: Control_Unit_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// this Controller is a Moore FSM which has the states that control the flow of data
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Control_Unit_Top(

// Common Inputs
input clock,
input reset, 

// Status Signals
input Start, // Comes to enable Circuit for working
input Overflow,

// Controller Signals Output

output reg Local_reset,
    
output reg Wr_En_x, Wr_En_A, Wr_En_B, Wr_En_C, Wr_En_D, Wr_En_X,  
output reg Rd_En_x, Rd_En_A, Rd_En_B, Rd_En_C, Rd_En_D, Rd_En_X,

output reg [2:0] MAC_IN_Sel,

output reg [2:0] ROMW_add,
    
output reg [2:0] Sel_Mapping,

output reg endop
    );
    
    parameter Loadx_State = 3'b001,
              LoadA_State = 3'b010,
              LoadB_State = 3'b011,
              LoadC_State = 3'b100,
              LoadD_State = 3'b101,
              LoadXout_State = 3'b110;

              
    reg [2:0] current_state, next_state; // current state and next state
    // sequential memory of the Moore FSM
    always @(posedge clock or posedge reset)
    begin
     if(reset==1) 
     current_state <= Loadx_State;// when reset=1, reset the state of the FSM to Reset State
     else
     current_state <= next_state; // otherwise, next state
    end 
               
    // Combinational logic of the Moore FSM
    // to determine next state 
    always @(*)
    begin
     case(current_state) 
         Loadx_State:
         begin
              if(Start==1)
               next_state = LoadA_State;
              else
               next_state = Loadx_State;
         end
               
         LoadA_State:
         begin
              if(Overflow==0)
               next_state = LoadB_State;
              else
               next_state = Loadx_State;
         end 
         
         LoadB_State:
         begin
              if(Overflow==0)
               next_state = LoadC_State;
              else
               next_state = Loadx_State;
         end
               
         LoadC_State:
         begin
              if(Overflow==0)
               next_state = LoadD_State;
              else
               next_state = Loadx_State;
         end
         
         LoadD_State:
         begin
              if(Overflow==0)
               next_state = LoadXout_State;
              else
               next_state = Loadx_State;
         end
         
         LoadXout_State:
         begin
              if(Overflow==0)
               next_state = Loadx_State;
              else
               next_state = Loadx_State;
         end       
         
         default:
         begin
              next_state = Loadx_State;
         end
         
     endcase
    end

    // combinational logic to determine the output
    // of the Moore FSM, output only depends on current state
    always @(*)
    begin 
     case(current_state) 
     Loadx_State: // Current state = 001
     begin
            Local_reset = 1'b0;
            Wr_En_x = 1'b1;
            Wr_En_A = 1'b0; 
            Wr_En_B = 1'b0; 
            Wr_En_C = 1'b0;
            Wr_En_D = 1'b0; 
            Wr_En_X = 1'b0; 
            Rd_En_x = 1'b0; 
            Rd_En_A = 1'b0;
            Rd_En_B = 1'b0;
            Rd_En_C = 1'b0;
            Rd_En_D = 1'b0;
            Rd_En_X = 1'b0;
            MAC_IN_Sel  = 3'b000;
            ROMW_add    = 3'b000;       
            Sel_Mapping = 3'b000;
            endop = 1'b0;
     end  
          
     LoadA_State: // Current state = 010
     begin
            Local_reset = 1'b0;
            Wr_En_x = 1'b0;
            Wr_En_A = 1'b1; 
            Wr_En_B = 1'b0; 
            Wr_En_C = 1'b0;
            Wr_En_D = 1'b0; 
            Wr_En_X = 1'b0; 
            Rd_En_x = 1'b1; 
            Rd_En_A = 1'b0;
            Rd_En_B = 1'b0;
            Rd_En_C = 1'b0;
            Rd_En_D = 1'b0;
            Rd_En_X = 1'b0;
            MAC_IN_Sel  = 3'b000;
            ROMW_add    = 3'b001;       
            Sel_Mapping = 3'b001;
        endop = 1'b0;
     end    
     LoadB_State:  // Counter = 3
     begin
            Local_reset = 1'b0;
            Wr_En_x = 1'b0;
            Wr_En_A = 1'b0; 
            Wr_En_B = 1'b1; 
            Wr_En_C = 1'b0;
            Wr_En_D = 1'b0; 
            Wr_En_X = 1'b0; 
            Rd_En_x = 1'b0; 
            Rd_En_A = 1'b1;
            Rd_En_B = 1'b0;
            Rd_En_C = 1'b0;
            Rd_En_D = 1'b0;
            Rd_En_X = 1'b0;
            MAC_IN_Sel  = 3'b001;
            ROMW_add    = 3'b010;       
            Sel_Mapping = 3'b010;
        endop = 1'b0;
     end  
     LoadC_State: // Counter = 4
        begin
            Local_reset = 1'b0;
            Wr_En_x = 1'b0;
            Wr_En_A = 1'b0; 
            Wr_En_B = 1'b0; 
            Wr_En_C = 1'b1;
            Wr_En_D = 1'b0; 
            Wr_En_X = 1'b0; 
            Rd_En_x = 1'b0; 
            Rd_En_A = 1'b0;
            Rd_En_B = 1'b1;
            Rd_En_C = 1'b0;
            Rd_En_D = 1'b0;
            Rd_En_X = 1'b0;
            MAC_IN_Sel  = 3'b010;
            ROMW_add    = 3'b011;       
            Sel_Mapping = 3'b011;
        endop = 1'b0;
     end  
     LoadD_State: // Counter =5
     begin
            Local_reset = 1'b0;
            Wr_En_x = 1'b0;
            Wr_En_A = 1'b0; 
            Wr_En_B = 1'b0; 
            Wr_En_C = 1'b0;
            Wr_En_D = 1'b1; 
            Wr_En_X = 1'b0; 
            Rd_En_x = 1'b0; 
            Rd_En_A = 1'b0;
            Rd_En_B = 1'b0;
            Rd_En_C = 1'b1;
            Rd_En_D = 1'b0;
            Rd_En_X = 1'b0;
            MAC_IN_Sel  = 3'b011;
            ROMW_add    = 3'b100;       
            Sel_Mapping = 3'b100;
        endop = 1'b1;
     end  
     LoadXout_State: // Counter = 6
     begin
            Local_reset = 1'b0;
            Wr_En_x = 1'b0;
            Wr_En_A = 1'b0; 
            Wr_En_B = 1'b0; 
            Wr_En_C = 1'b0;
            Wr_En_D = 1'b0; 
            Wr_En_X = 1'b1; 
            Rd_En_x = 1'b0; 
            Rd_En_A = 1'b0;
            Rd_En_B = 1'b0;
            Rd_En_C = 1'b0;
            Rd_En_D = 1'b1;
            Rd_En_X = 1'b0;
            MAC_IN_Sel  = 3'b100;
            ROMW_add    = 3'b101;       
            Sel_Mapping = 3'b101;
        endop = 1'b0;
     end  
     default:
     begin
        Local_reset = 1'b1;
        Wr_En_x = 1'b0;
        Wr_En_A = 1'b0; 
        Wr_En_B = 1'b0; 
        Wr_En_C = 1'b0;
        Wr_En_D = 1'b0; 
        Wr_En_X = 1'b0; 
        Rd_En_x = 1'b0; 
        Rd_En_A = 1'b0;
        Rd_En_B = 1'b0;
        Rd_En_C = 1'b0;
        Rd_En_D = 1'b0;
        Rd_En_X = 1'b0;
        MAC_IN_Sel  = 3'bx;
        ROMW_add    = 3'bx;       
        Sel_Mapping = 3'bx;
        endop = 1'b0;
     end
     endcase
    end 
endmodule
