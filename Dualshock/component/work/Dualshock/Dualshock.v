//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Apr 06 00:02:04 2017
// Version: v11.7 SP3 11.7.3.8
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Dualshock
module Dualshock(
    // Inputs
    MAINXIN,
    MSS_RESET_N,
    SPISDI,
    UART_0_RXD,
    // Outputs
    GPIO_13_OUT,
    GPIO_14_OUT,
    GPIO_15_OUT,
    SPISCLKO,
    SPISDO,
    UART_0_TXD
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  MAINXIN;
input  MSS_RESET_N;
input  SPISDI;
input  UART_0_RXD;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output GPIO_13_OUT;
output GPIO_14_OUT;
output GPIO_15_OUT;
output SPISCLKO;
output SPISDO;
output UART_0_TXD;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CoreAPB3_0_APBmslave0_PENABLE;
wire   [31:0] CoreAPB3_0_APBmslave0_PRDATA;
wire          CoreAPB3_0_APBmslave0_PREADY;
wire          CoreAPB3_0_APBmslave0_PSELx;
wire          CoreAPB3_0_APBmslave0_PSLVERR;
wire   [31:0] CoreAPB3_0_APBmslave0_PWDATA;
wire          CoreAPB3_0_APBmslave0_PWRITE;
wire          Dualshock_MSS_0_FAB_CLK;
wire          Dualshock_MSS_0_M2F_RESET_N;
wire          Dualshock_MSS_0_MSS_MASTER_APB_PENABLE;
wire   [31:0] Dualshock_MSS_0_MSS_MASTER_APB_PRDATA;
wire          Dualshock_MSS_0_MSS_MASTER_APB_PREADY;
wire          Dualshock_MSS_0_MSS_MASTER_APB_PSELx;
wire          Dualshock_MSS_0_MSS_MASTER_APB_PSLVERR;
wire   [31:0] Dualshock_MSS_0_MSS_MASTER_APB_PWDATA;
wire          Dualshock_MSS_0_MSS_MASTER_APB_PWRITE;
wire          GPIO_13_OUT_net_0;
wire          GPIO_14_OUT_net_0;
wire          GPIO_15_OUT_net_0;
wire          MAINXIN;
wire          MSS_RESET_N;
wire          SPISCLKO_net_0;
wire          SPISDI;
wire          SPISDO_net_0;
wire          UART_0_RXD;
wire          UART_0_TXD_net_0;
wire          UART_0_TXD_net_1;
wire          GPIO_15_OUT_net_1;
wire          GPIO_14_OUT_net_1;
wire          GPIO_13_OUT_net_1;
wire          SPISDO_net_1;
wire          SPISCLKO_net_1;
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
wire   [31:0] CoreAPB3_0_APBmslave0_PADDR;
wire   [6:0]  CoreAPB3_0_APBmslave0_PADDR_0_6to0;
wire   [6:0]  CoreAPB3_0_APBmslave0_PADDR_0;
wire   [31:20]Dualshock_MSS_0_MSS_MASTER_APB_PADDR_0_31to20;
wire   [19:0] Dualshock_MSS_0_MSS_MASTER_APB_PADDR_0_19to0;
wire   [31:0] Dualshock_MSS_0_MSS_MASTER_APB_PADDR_0;
wire   [19:0] Dualshock_MSS_0_MSS_MASTER_APB_PADDR;
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
assign UART_0_TXD_net_1  = UART_0_TXD_net_0;
assign UART_0_TXD        = UART_0_TXD_net_1;
assign GPIO_15_OUT_net_1 = GPIO_15_OUT_net_0;
assign GPIO_15_OUT       = GPIO_15_OUT_net_1;
assign GPIO_14_OUT_net_1 = GPIO_14_OUT_net_0;
assign GPIO_14_OUT       = GPIO_14_OUT_net_1;
assign GPIO_13_OUT_net_1 = GPIO_13_OUT_net_0;
assign GPIO_13_OUT       = GPIO_13_OUT_net_1;
assign SPISDO_net_1      = SPISDO_net_0;
assign SPISDO            = SPISDO_net_1;
assign SPISCLKO_net_1    = SPISCLKO_net_0;
assign SPISCLKO          = SPISCLKO_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign CoreAPB3_0_APBmslave0_PADDR_0_6to0 = CoreAPB3_0_APBmslave0_PADDR[6:0];
assign CoreAPB3_0_APBmslave0_PADDR_0 = { CoreAPB3_0_APBmslave0_PADDR_0_6to0 };

assign Dualshock_MSS_0_MSS_MASTER_APB_PADDR_0_31to20 = 12'h0;
assign Dualshock_MSS_0_MSS_MASTER_APB_PADDR_0_19to0 = Dualshock_MSS_0_MSS_MASTER_APB_PADDR[19:0];
assign Dualshock_MSS_0_MSS_MASTER_APB_PADDR_0 = { Dualshock_MSS_0_MSS_MASTER_APB_PADDR_0_31to20, Dualshock_MSS_0_MSS_MASTER_APB_PADDR_0_19to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
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
        .MADDR_BITS      ( 16 ),
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
        .UPR_NIBBLE_POSN ( 3 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( Dualshock_MSS_0_MSS_MASTER_APB_PADDR_0 ),
        .PWRITE     ( Dualshock_MSS_0_MSS_MASTER_APB_PWRITE ),
        .PENABLE    ( Dualshock_MSS_0_MSS_MASTER_APB_PENABLE ),
        .PWDATA     ( Dualshock_MSS_0_MSS_MASTER_APB_PWDATA ),
        .PSEL       ( Dualshock_MSS_0_MSS_MASTER_APB_PSELx ),
        .PRDATAS0   ( CoreAPB3_0_APBmslave0_PRDATA ),
        .PREADYS0   ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERRS0  ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PRDATAS1   ( PRDATAS1_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS1   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS1  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS2   ( PRDATAS2_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS2   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS2  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PRDATAS16  ( PRDATAS16_const_net_0 ), // tied to 32'h00000000 from definition
        .PREADYS16  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS16 ( GND_net ), // tied to 1'b0 from definition
        .IADDR      ( IADDR_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PRDATA     ( Dualshock_MSS_0_MSS_MASTER_APB_PRDATA ),
        .PREADY     ( Dualshock_MSS_0_MSS_MASTER_APB_PREADY ),
        .PSLVERR    ( Dualshock_MSS_0_MSS_MASTER_APB_PSLVERR ),
        .PADDRS     ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWRITES    ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWDATAS    ( CoreAPB3_0_APBmslave0_PWDATA ),
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
        .PSELS16    (  ) 
        );

//--------CORESPI   -   Actel:DirectCore:CORESPI:5.1.104
CORESPI #( 
        .APB_DWIDTH        ( 32 ),
        .CFG_CLK           ( 10 ),
        .CFG_FIFO_DEPTH    ( 4 ),
        .CFG_FRAME_SIZE    ( 8 ),
        .CFG_MODE          ( 0 ),
        .CFG_MOT_MODE      ( 3 ),
        .CFG_MOT_SSEL      ( 0 ),
        .CFG_NSC_OPERATION ( 0 ),
        .CFG_TI_JMB_FRAMES ( 0 ),
        .CFG_TI_NSC_CUSTOM ( 0 ),
        .CFG_TI_NSC_FRC    ( 0 ),
        .FAMILY            ( 18 ) )
CORESPI_0(
        // Inputs
        .PCLK       ( Dualshock_MSS_0_FAB_CLK ),
        .PRESETN    ( Dualshock_MSS_0_M2F_RESET_N ),
        .PADDR      ( CoreAPB3_0_APBmslave0_PADDR_0 ),
        .PSEL       ( CoreAPB3_0_APBmslave0_PSELx ),
        .PENABLE    ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE     ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PWDATA     ( CoreAPB3_0_APBmslave0_PWDATA ),
        .SPISSI     ( GND_net ),
        .SPISDI     ( SPISDI ),
        .SPICLKI    ( GND_net ),
        // Outputs
        .PRDATA     ( CoreAPB3_0_APBmslave0_PRDATA ),
        .PREADY     ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERR    ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .SPIINT     (  ),
        .SPIRXAVAIL (  ),
        .SPITXRFM   (  ),
        .SPISS      (  ),
        .SPISCLKO   ( SPISCLKO_net_0 ),
        .SPIOEN     (  ),
        .SPISDO     ( SPISDO_net_0 ),
        .SPIMODE    (  ) 
        );

//--------Dualshock_MSS
Dualshock_MSS Dualshock_MSS_0(
        // Inputs
        .UART_0_RXD  ( UART_0_RXD ),
        .MSS_RESET_N ( MSS_RESET_N ),
        .MSSPRDATA   ( Dualshock_MSS_0_MSS_MASTER_APB_PRDATA ),
        .MSSPREADY   ( Dualshock_MSS_0_MSS_MASTER_APB_PREADY ),
        .MSSPSLVERR  ( Dualshock_MSS_0_MSS_MASTER_APB_PSLVERR ),
        .MAINXIN     ( MAINXIN ),
        // Outputs
        .UART_0_TXD  ( UART_0_TXD_net_0 ),
        .MSSPADDR    ( Dualshock_MSS_0_MSS_MASTER_APB_PADDR ),
        .MSSPSEL     ( Dualshock_MSS_0_MSS_MASTER_APB_PSELx ),
        .MSSPENABLE  ( Dualshock_MSS_0_MSS_MASTER_APB_PENABLE ),
        .MSSPWRITE   ( Dualshock_MSS_0_MSS_MASTER_APB_PWRITE ),
        .MSSPWDATA   ( Dualshock_MSS_0_MSS_MASTER_APB_PWDATA ),
        .GPIO_15_OUT ( GPIO_15_OUT_net_0 ),
        .GPIO_14_OUT ( GPIO_14_OUT_net_0 ),
        .GPIO_13_OUT ( GPIO_13_OUT_net_0 ),
        .FAB_CLK     ( Dualshock_MSS_0_FAB_CLK ),
        .M2F_RESET_N ( Dualshock_MSS_0_M2F_RESET_N ) 
        );


endmodule
