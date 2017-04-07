module dir_sel (
        input clk,
        input wire pwm,
        input wire dir,
        input wire en,
        
        output reg h_bridge_in_1,
        output reg h_bridge_in_2
    );
    
    wire next_bridge_en[1:0];
    reg  bridge_en[1:0];
    //buffer bridge_en just to make sure we don't set both h_bridge_in high at same time
    assign next_bridge_en[0] = dir & en;
    assign next_bridge_en[1] = ~dir & en;

    always @(posedge clk) begin
        bridge_en[0] <= next_bridge_en[0];
        bridge_en[1] <= next_bridge_en[1];
    end

    always @* begin
        if(bridge_en[0]) begin
            h_bridge_in_1 = pwm;
            h_bridge_in_2 = 0;
        end else if (bridge_en[1]) begin
            h_bridge_in_1 = 0;
            h_bridge_in_2 = pwm;
        end else begin
            h_bridge_in_1 = 0;
            h_bridge_in_2 = 0;
        end
    end
endmodule