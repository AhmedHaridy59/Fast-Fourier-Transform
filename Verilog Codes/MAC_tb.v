module MAC_tb;

// Signal Declaration	

	
	// Inputs as each Input = InReal + j * InImg
    reg [15:0] In1;
    reg [15:0] In2;
    reg [15:0] In3;
    
    reg clock;
    reg reset;    
    // Outputs 
    wire [15:0] AddOut;

    
    wire [15:0] SubOut;

    
    // Feedback signals
    wire Overflow;
    
// instantiation 
    MAC MAC0(
	.In1(In1),
    .In2(In2),
    .In3(In3),
    .AddOut(AddOut),
    .SubOut(SubOut),
    .Overflow(Overflow)
    );    
    
        initial
        begin
        $dumpfile("MAC.vcd");
        $dumpvars;
        #1500  $stop ;
        end 
        ///////////initialize inputs 
        initial
        begin
            In1 = 16'b0;
            In2 = 16'b0;
            In3 = 16'b0;

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
        #1 ;
        end
        ///////////////////////
        always @(posedge clock)
        begin     
        #2;            
                In1= In1 + 16'd4;
                In2= In2 + 16'd3;
                In3= In3 + 16'd3;
               
        end
            
endmodule
