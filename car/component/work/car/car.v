//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Apr 12 03:45:10 2017
// Version: v11.7 SP1 11.7.1.14
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// car
module car(
    // Inputs
    MSS_RESET_N,
    UART_0_RXD,
    UART_1_RXD,
    // Outputs
    EN_L,
    EN_R,
    UART_0_TXD,
    UART_1_TXD,
    h_bridge_in_1_L,
    h_bridge_in_1_R,
    h_bridge_in_2_L,
    h_bridge_in_2_R
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  MSS_RESET_N;
input  UART_0_RXD;
input  UART_1_RXD;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output EN_L;
output EN_R;
output UART_0_TXD;
output UART_1_TXD;
output h_bridge_in_1_L;
output h_bridge_in_1_R;
output h_bridge_in_2_L;
output h_bridge_in_2_R;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          APB_reader_0_PWM_DIR_L;
wire          APB_reader_0_PWM_DIR_R;
wire   [7:0]  APB_reader_0_PWM_DUTY_L_0;
wire   [7:0]  APB_reader_0_PWM_DUTY_R_0;
wire          car_MSS_0_FAB_CLK;
wire          car_MSS_0_M2F_RESET_N;
wire          car_MSS_0_MSS_MASTER_APB_PENABLE;
wire   [31:0] car_MSS_0_MSS_MASTER_APB_PRDATA;
wire          car_MSS_0_MSS_MASTER_APB_PREADY;
wire          car_MSS_0_MSS_MASTER_APB_PSELx;
wire          car_MSS_0_MSS_MASTER_APB_PSLVERR;
wire   [31:0] car_MSS_0_MSS_MASTER_APB_PWDATA;
wire          car_MSS_0_MSS_MASTER_APB_PWRITE;
wire   [31:0] CoreAPB3_0_APBmslave0_PADDR;
wire          CoreAPB3_0_APBmslave0_PENABLE;
wire   [31:0] CoreAPB3_0_APBmslave0_PRDATA;
wire          CoreAPB3_0_APBmslave0_PREADY;
wire          CoreAPB3_0_APBmslave0_PSELx;
wire          CoreAPB3_0_APBmslave0_PSLVERR;
wire   [31:0] CoreAPB3_0_APBmslave0_PWDATA;
wire          CoreAPB3_0_APBmslave0_PWRITE;
wire          EN_L_net_0;
wire          EN_R_net_0;
wire          h_bridge_in_1_L_net_0;
wire          h_bridge_in_1_R_net_0;
wire          h_bridge_in_2_L_net_0;
wire          h_bridge_in_2_R_net_0;
wire          MSS_RESET_N;
wire          pwm_gen_A_pwm;
wire          pwm_gen_B_pwm;
wire          UART_0_RXD;
wire          UART_0_TXD_1;
wire          UART_1_RXD;
wire          UART_1_TXD_0;
wire          EN_R_net_1;
wire          EN_L_net_1;
wire          h_bridge_in_1_R_net_1;
wire          h_bridge_in_2_R_net_1;
wire          h_bridge_in_2_L_net_1;
wire          h_bridge_in_1_L_net_1;
wire          UART_0_TXD_1_net_0;
wire          UART_1_TXD_0_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [31:0] IADDR_const_net_0;
wire   [31:0] PRDATAS1_const_net_0;
wire   [31:0] PRDATAS2_const_net_0;
wire   [31:0] PRDATAS3_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS5_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
wire   [31:0] PRDATAS16_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [19:0] car_MSS_0_MSS_MASTER_APB_PADDR;
wire   [31:20]car_MSS_0_MSS_MASTER_APB_PADDR_0_31to20;
wire   [19:0] car_MSS_0_MSS_MASTER_APB_PADDR_0_19to0;
wire   [31:0] car_MSS_0_MSS_MASTER_APB_PADDR_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net               = 1'b0;
assign VCC_net               = 1'b1;
assign IADDR_const_net_0     = 32'h00000000;
assign PRDATAS1_const_net_0  = 32'h00000000;
assign PRDATAS2_const_net_0  = 32'h00000000;
assign PRDATAS3_const_net_0  = 32'h00000000;
assign PRDATAS4_const_net_0  = 32'h00000000;
assign PRDATAS5_const_net_0  = 32'h00000000;
assign PRDATAS6_const_net_0  = 32'h00000000;
assign PRDATAS7_const_net_0  = 32'h00000000;
assign PRDATAS8_const_net_0  = 32'h00000000;
assign PRDATAS9_const_net_0  = 32'h00000000;
assign PRDATAS10_const_net_0 = 32'h00000000;
assign PRDATAS11_const_net_0 = 32'h00000000;
assign PRDATAS12_const_net_0 = 32'h00000000;
assign PRDATAS13_const_net_0 = 32'h00000000;
assign PRDATAS14_const_net_0 = 32'h00000000;
assign PRDATAS15_const_net_0 = 32'h00000000;
assign PRDATAS16_const_net_0 = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign EN_R_net_1            = EN_R_net_0;
assign EN_R                  = EN_R_net_1;
assign EN_L_net_1            = EN_L_net_0;
assign EN_L                  = EN_L_net_1;
assign h_bridge_in_1_R_net_1 = h_bridge_in_1_R_net_0;
assign h_bridge_in_1_R       = h_bridge_in_1_R_net_1;
assign h_bridge_in_2_R_net_1 = h_bridge_in_2_R_net_0;
assign h_bridge_in_2_R       = h_bridge_in_2_R_net_1;
assign h_bridge_in_2_L_net_1 = h_bridge_in_2_L_net_0;
assign h_bridge_in_2_L       = h_bridge_in_2_L_net_1;
assign h_bridge_in_1_L_net_1 = h_bridge_in_1_L_net_0;
assign h_bridge_in_1_L       = h_bridge_in_1_L_net_1;
assign UART_0_TXD_1_net_0    = UART_0_TXD_1;
assign UART_0_TXD            = UART_0_TXD_1_net_0;
assign UART_1_TXD_0_net_0    = UART_1_TXD_0;
assign UART_1_TXD            = UART_1_TXD_0_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign car_MSS_0_MSS_MASTER_APB_PADDR_0_31to20 = 12'h0;
assign car_MSS_0_MSS_MASTER_APB_PADDR_0_19to0 = car_MSS_0_MSS_MASTER_APB_PADDR[19:0];
assign car_MSS_0_MSS_MASTER_APB_PADDR_0 = { car_MSS_0_MSS_MASTER_APB_PADDR_0_31to20, car_MSS_0_MSS_MASTER_APB_PADDR_0_19to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------APB_reader
APB_reader APB_reader_0(
        // Inputs
        .PCLK       ( car_MSS_0_FAB_CLK ),
        .PRESERN    ( car_MSS_0_M2F_RESET_N ),
        .PSEL       ( CoreAPB3_0_APBmslave0_PSELx ),
        .PENABLE    ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE     ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PADDR      ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWDATA     ( CoreAPB3_0_APBmslave0_PWDATA ),
        // Outputs
        .PREADY     ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERR    ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PWM_EN_R   ( EN_R_net_0 ),
        .PWM_EN_L   ( EN_L_net_0 ),
        .PWM_DIR_R  ( APB_reader_0_PWM_DIR_R ),
        .PWM_DIR_L  ( APB_reader_0_PWM_DIR_L ),
        .PRDATA     ( CoreAPB3_0_APBmslave0_PRDATA ),
        .PWM_DUTY_R ( APB_reader_0_PWM_DUTY_R_0 ),
        .PWM_DUTY_L ( APB_reader_0_PWM_DUTY_L_0 ) 
        );

//--------car_MSS
car_MSS car_MSS_0(
        // Inputs
        .MSS_RESET_N ( MSS_RESET_N ),
        .MSSPREADY   ( car_MSS_0_MSS_MASTER_APB_PREADY ),
        .MSSPSLVERR  ( car_MSS_0_MSS_MASTER_APB_PSLVERR ),
        .UART_1_RXD  ( UART_1_RXD ),
        .UART_0_RXD  ( UART_0_RXD ),
        .MSSPRDATA   ( car_MSS_0_MSS_MASTER_APB_PRDATA ),
        // Outputs
        .MSSPSEL     ( car_MSS_0_MSS_MASTER_APB_PSELx ),
        .MSSPENABLE  ( car_MSS_0_MSS_MASTER_APB_PENABLE ),
        .MSSPWRITE   ( car_MSS_0_MSS_MASTER_APB_PWRITE ),
        .FAB_CLK     ( car_MSS_0_FAB_CLK ),
        .M2F_RESET_N ( car_MSS_0_M2F_RESET_N ),
        .UART_1_TXD  ( UART_1_TXD_0 ),
        .UART_0_TXD  ( UART_0_TXD_1 ),
        .MSSPADDR    ( car_MSS_0_MSS_MASTER_APB_PADDR ),
        .MSSPWDATA   ( car_MSS_0_MSS_MASTER_APB_PWDATA ) 
        );

//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3 #( 
        .APB_DWIDTH      ( 32 ),
        .APBSLOT0ENABLE  ( 1 ),
        .APBSLOT1ENABLE  ( 0 ),
        .APBSLOT2ENABLE  ( 0 ),
        .APBSLOT3ENABLE  ( 0 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 0 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .FAMILY          ( 18 ),
        .IADDR_OPTION    ( 0 ),
        .MADDR_BITS      ( 12 ),
        .SC_0            ( 0 ),
        .SC_1            ( 0 ),
        .SC_2            ( 0 ),
        .SC_3            ( 0 ),
        .SC_4            ( 0 ),
        .SC_5            ( 0 ),
        .SC_6            ( 0 ),
        .SC_7            ( 0 ),
        .SC_8            ( 0 ),
        .SC_9            ( 0 ),
        .SC_10           ( 0 ),
        .SC_11           ( 0 ),
        .SC_12           ( 0 ),
        .SC_13           ( 0 ),
        .SC_14           ( 0 ),
        .SC_15           ( 0 ),
        .UPR_NIBBLE_POSN ( 2 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PWRITE     ( car_MSS_0_MSS_MASTER_APB_PWRITE ),
        .PENABLE    ( car_MSS_0_MSS_MASTER_APB_PENABLE ),
        .PSEL       ( car_MSS_0_MSS_MASTER_APB_PSELx ),
        .PREADYS0   ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERRS0  ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PREADYS1   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS1  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS2   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS2  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS16  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS16 ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( car_MSS_0_MSS_MASTER_APB_PADDR_0 ),
        .PWDATA     ( car_MSS_0_MSS_MASTER_APB_PWDATA ),
        .PRDATAS0   ( CoreAPB3_0_APBmslave0_PRDATA ),
        .PRDATAS1   ( PRDATAS1_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS2   ( PRDATAS2_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS16  ( PRDATAS16_const_net_0 ), // tied to 32'h00000000 from definition
        .IADDR      ( IADDR_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PREADY     ( car_MSS_0_MSS_MASTER_APB_PREADY ),
        .PSLVERR    ( car_MSS_0_MSS_MASTER_APB_PSLVERR ),
        .PWRITES    ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PSELS0     ( CoreAPB3_0_APBmslave0_PSELx ),
        .PSELS1     (  ),
        .PSELS2     (  ),
        .PSELS3     (  ),
        .PSELS4     (  ),
        .PSELS5     (  ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PSELS16    (  ),
        .PRDATA     ( car_MSS_0_MSS_MASTER_APB_PRDATA ),
        .PADDRS     ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWDATAS    ( CoreAPB3_0_APBmslave0_PWDATA ) 
        );

//--------dir_sel
dir_sel dir_sel_L(
        // Inputs
        .clk           ( car_MSS_0_FAB_CLK ),
        .pwm           ( pwm_gen_B_pwm ),
        .dir           ( APB_reader_0_PWM_DIR_L ),
        .en            ( EN_L_net_0 ),
        // Outputs
        .h_bridge_in_1 ( h_bridge_in_1_L_net_0 ),
        .h_bridge_in_2 ( h_bridge_in_2_L_net_0 ) 
        );

//--------dir_sel
dir_sel dir_sel_R(
        // Inputs
        .clk           ( car_MSS_0_FAB_CLK ),
        .pwm           ( pwm_gen_A_pwm ),
        .dir           ( APB_reader_0_PWM_DIR_R ),
        .en            ( EN_R_net_0 ),
        // Outputs
        .h_bridge_in_1 ( h_bridge_in_1_R_net_0 ),
        .h_bridge_in_2 ( h_bridge_in_2_R_net_0 ) 
        );

//--------pwm_gen
pwm_gen pwm_gen_L(
        // Inputs
        .clk  ( car_MSS_0_FAB_CLK ),
        .duty ( APB_reader_0_PWM_DUTY_L_0 ),
        // Outputs
        .pwm  ( pwm_gen_B_pwm ) 
        );

//--------pwm_gen
pwm_gen pwm_gen_R(
        // Inputs
        .clk  ( car_MSS_0_FAB_CLK ),
        .duty ( APB_reader_0_PWM_DUTY_R_0 ),
        // Outputs
        .pwm  ( pwm_gen_A_pwm ) 
        );


endmodule
