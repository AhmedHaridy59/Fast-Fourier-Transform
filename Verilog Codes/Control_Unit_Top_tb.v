module Control_Unit_Top_tb;

// Signal Declaration

// Common Inputs
reg clock;
reg reset; 

// Status Signals
reg Start; // Comes to enable Circuit for working
reg Overflow;

// Controller Signals Output

wire Local_reset;
    
wire Wr_En_x, Wr_En_A, Wr_En_B, Wr_En_C, Wr_En_D, Wr_En_X;  
wire Rd_En_x, Rd_En_A, Rd_En_B, Rd_En_C, Rd_En_D, Rd_En_X;

wire[2:0] MAC_IN_Sel;

wire[2:0] ROMW_add;
    
wire [2:0] Sel_Mapping;

// Instantiation

Control_Unit_Top CU(
.clock(clock),
.reset(reset), 
.Start(Start), 
.Overflow(Overflow),
.Local_reset(Local_reset),
.Wr_En_x(Wr_En_x), .Wr_En_A(Wr_En_A), .Wr_En_B(Wr_En_B),
.Wr_En_C(Wr_En_C), .Wr_En_D(Wr_En_D), .Wr_En_X(Wr_En_X),
.Rd_En_x(Rd_En_x), .Rd_En_A(Rd_En_A), .Rd_En_B(Rd_En_B), 
.Rd_En_C(Rd_En_C), .Rd_En_D(Rd_En_D), .Rd_En_X(Rd_En_X),
.MAC_IN_Sel(MAC_IN_Sel),
.ROMW_add(ROMW_add),
.Sel_Mapping(Sel_Mapping)
    );
    
   
        initial
        begin
        $dumpfile("CU.vcd");
        $dumpvars;
        #1500  $stop ;
        end 
        ///////////initialize inputs 
        initial
        begin
            Overflow = 0;
            Start = 0;

        end
        ///Clock Generator - 100MHZ (10ns Timeperiod)
        initial 
        begin
            clock = 1'b0;
            forever #5 clock= ~clock ;
        end 
        //apply RST to block
        initial
        begin 
        reset = 1'b0;
        #1
        reset = 1'b1;
        #1
        reset = 1'b0;
        #10 ;
        Start = 1;
        end
        ///////////////////////

endmodule