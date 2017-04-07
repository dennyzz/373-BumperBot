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

int main()
{
	//receive from XBEE UART
	uint16_t rx_buff[3];
	rx_buff[0] = 0x4321;
	rx_buff[1] = 0x9765;
	rx_buff[2] = 0xDCBA;

	initMotor();
	while( 1 )
	{
		//printf("begin of new loop\n");
		setMotorAPB(rx_buff);
	}
}
