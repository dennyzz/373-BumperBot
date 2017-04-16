/*
 * main.c
 *
 *  Created on: Apr 3, 2017
 *      Author: weeyizhi
 */

#include "pwm.h"
#include "car.h"
#include "drivers/mss_uart/mss_uart.h"
#include <stdio.h>
#include <inttypes.h>


void uart1_rx_handler( mss_uart_instance_t * this_uart )
{
	static uint8_t rx_buff[8] = {128, 128, 128, 128, 128, 128, 128, 128};
	MSS_UART_get_rx( this_uart, rx_buff, sizeof(rx_buff));

	printf("%x %x %x %x %x %x %x %x\r\n", rx_buff[0], rx_buff[1], rx_buff[2], rx_buff[3], rx_buff[4], rx_buff[5], rx_buff[6], rx_buff[7]);

	setMotorAPB(rx_buff);

   //MSS_UART_polled_tx_string(&g_mss_uart1, rx_buff); //for testing if the xbee is working
}

int main()
{
	printf("main started");

	initMotor();

	MSS_UART_init(&g_mss_uart1, MSS_UART_57600_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);

    MSS_UART_set_rx_handler( &g_mss_uart1, uart1_rx_handler, MSS_UART_FIFO_EIGHT_BYTES );

	while( 1 )
	{
		//printf("\rin while loop\n");

//		uint8_t buff[8] = {0, 255, 128, 128, 128, 128, 128, 128};
//
//		printf("\rrx_buff0: %x\n", buff[0]);
//		printf("\rrx_buff1: %x\n", buff[1]);
//		printf("\rrx_buff2: %x\n", buff[2]);
//		printf("\rrx_buff3: %x\n", buff[3]);
//		printf("\rrx_buff4: %x\n", buff[4]);
//		printf("\rrx_buff5: %x\n", buff[5]);
//		printf("\rrx_buff6: %x\n", buff[6]);
//		printf("\rrx_buff7: %x\n", buff[7]);
//
//		setMotorAPB(buff);
	}
}
