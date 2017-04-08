//configure PWM
//make sure to change pwm.h as well
`define period  	400000          //number of clock cycles for a period, should be a power of 2
`define min_width   200000	        //min clock cycles to be high (50% duty)
`define max_width   360000	        //max clock cycles to be high (90% duty)
//configuration end


module pwm_gen(
        input clk,
        input [7:0] duty,
        output reg pwm
    );

    reg [$clog2(`period)-1:0] count;
    reg [$clog2(`period)-1:0] width;
    reg [$clog2(`period)-1:0] safe_width;
 
    //hardware safety net to make sure we don't go across our limited PWM duty
    always @* begin
        width = (duty * `period) >> 8;
        safe_width = width;
        if (width > `max_width) begin
            safe_width = `max_width;
        end
        if (width < `min_width) begin
            safe_width = `min_width;
        end
    end
 
    always @(posedge clk) begin
        if (count == `period) begin
            count <= 0;
        end else begin
            count <= count + 1;
        end
        if (count < safe_width) begin
            pwm <= 1;
        end else begin
            pwm <= 0;
        end
    end
endmodule