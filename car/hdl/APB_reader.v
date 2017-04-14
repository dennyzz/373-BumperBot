//number of cycles we store the value from APB
//if it exceeds this time, means that the PS controller stopped sending signal for too long
//reset the values in the register to zero so that the car stops
`define store_count  	50000000     //wait for 0.5 second

module APB_reader(
    /*** APB3 BUS INTERFACE ***/
    input PCLK,               // clock
    input PRESERN,            // system reset
    input PSEL,               // peripheral select
    input PENABLE,            // distinguishes access phase
    output wire PREADY,       // peripheral ready signal
    output wire PSLVERR,      // error signal
    input PWRITE,             // distinguishes read and write cycles
    input [31:0] PADDR,       // I/O address
    input wire [31:0] PWDATA, // data from processor to I/O device (32 bits)
    output reg [31:0] PRDATA, // data to processor from I/O device (32-bits)

    /*** I/O PORTS DECLARATION ***/	
    output reg [7:0] PWM_DUTY_R,
    output reg [7:0] PWM_DUTY_L,
    output reg  PWM_EN_R,
    output reg  PWM_EN_L,
    output reg  PWM_DIR_R,
    output reg  PWM_DIR_L
    ); 

    wire write;
    reg [$clog2(`store_count):0] count;

    assign PSLVERR = 0;
    assign PREADY  = 1;

    assign write = PWRITE && PSEL && PENABLE && PADDR[2];

    //////////////////////////////////
    // end of APB3 interface header //
    //////////////////////////////////

    //INSERT READING HERE (used to send XBEE stuff to processor


    always @(posedge PCLK) // register control for APB3 writes
    begin
        if(!PRESERN) begin
            PWM_DUTY_R <= 0; //default nothing
            PWM_DUTY_L <= 0;
            PWM_EN_R <= 0;
            PWM_EN_L <= 0;
            PWM_DIR_R <= 0;
            PWM_DIR_L <= 0;
            count <= 0;
        end else if(write) begin
            PWM_EN_R <= PWDATA[0];
            PWM_DIR_R <= PWDATA[1];
            PWM_EN_L <= PWDATA[2];
            PWM_DIR_L <= PWDATA[3];
            PWM_DUTY_R <= PWDATA[15:8]; 
            PWM_DUTY_L <= PWDATA[23:16];
            count <= 0;
        end 
        else if (count > `store_count) begin
            PWM_DUTY_R <= 0; //default nothing
            PWM_DUTY_L <= 0;
            PWM_EN_R <= 0;
            PWM_EN_L <= 0;
            PWM_DIR_R <= 0;
            PWM_DIR_L <= 0;
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end
endmodule