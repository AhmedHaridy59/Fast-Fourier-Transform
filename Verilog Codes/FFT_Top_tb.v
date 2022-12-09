
module FFT_Top_tb;

// Signal Declaration
    // Common Inputs 
    reg clock;
    reg clock1;
    reg reset;
        
    // Data Flow
    reg [2*16*16-1:0] Data_In;
    wire [2*16*16-1:0] Data_Out;
        
    // User Interface signals
    
    reg Start; // enable cct to start
    
    wire endop;   // end of operation 

    integer synch;
// instantiation
     FFT_Top FFTUT( 
    .clock(clock),
    .clock1(clock1),
    .reset(reset),
    .Data_In(Data_In),
    .Data_Out(Data_Out),
    .Start(Start),
    .endop(endop)
    );

   
       initial
        begin
        $dumpfile("FFT.vcd");
        $dumpvars;
        #1500  $stop ;
        end 
        ///////////initialize inputs 
        initial
        begin
            Start = 1;
            clock=0;
            reset=0;
            synch =0;
            Data_In=512'b00000111_10000001_00001100_00010000_00000100_00000101_00000111_00000001_10000011_10000010_00010000_10000111_00000100_10001001_00000100_10001110_10001111_00000001_10000100_00000010_10000011_00000110_00000001_00001100_00000110_00000100_10001011_10000001_10001111_10000011_00001000_00000011_10001010_10000010_00000010_00001000_00001001_00001011_10000100_00001101_10001000_00000101_00000010_10000100_00001001_10000100_00000010_10000010_00000001_10000100_00001001_00000001_10010000_10000101_00001010_10001000_00001000_10000001_00000011_10000100_10000110_00000101_00000001_10001000 ; 
            
        end
        ///Clock Generator - 50MHZ (20 ns Timeperiod)
        initial 
        begin
            clock1 = 1'b0;
            if(synch == 0)
              begin
                 #40;
              end
            forever #10 clock= ~clock ;
            synch = 1;
        end         
        
        ///Clock Generator - 10MHZ (100 ns Timeperiod)
        initial 
        begin
            clock1 = 1'b0;
            forever #50 clock1= ~clock1 ;
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

        
endmodule