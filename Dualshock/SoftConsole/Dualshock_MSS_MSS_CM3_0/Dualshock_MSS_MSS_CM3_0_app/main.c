#include "dualshock.h"
#include <stdio.h>
#include <inttypes.h>
#include "drivers/mss_uart/mss_uart.h"
#include "drivers/CoreUARTapb/core_uart_apb.h"
#define SPI_BASE 0x40050000
#define UART_BASE 0x40051000
spi_instance_t g_spi0;
UART_instance_t g_uart;
uint8_t update = 0;
uint8_t robot_state = 0xFF;
int main()
{
	uint8_t buffer[20];
	MSS_GPIO_init();
	MSS_GPIO_config(MSS_GPIO_0, MSS_GPIO_OUTPUT_MODE);
	MSS_GPIO_config(MSS_GPIO_13, MSS_GPIO_OUTPUT_MODE);
	MSS_GPIO_config(MSS_GPIO_14, MSS_GPIO_OUTPUT_MODE);
	MSS_GPIO_config(MSS_GPIO_15, MSS_GPIO_OUTPUT_MODE);
	MSS_GPIO_set_output(MSS_GPIO_0, 0);
	MSS_GPIO_set_output(MSS_GPIO_13, 1);
	MSS_GPIO_set_output(MSS_GPIO_14, 1);
	MSS_GPIO_set_output(MSS_GPIO_15, 1);



	SPI_init(&g_spi0, SPI_BASE, 4);
	SPI_configure_master_mode(&g_spi0);

	MSS_TIM1_init(MSS_TIMER_PERIODIC_MODE);
	// MSS_TIM1_load_background(1000); // 10kHz
    MSS_TIM1_load_background(200000); // 100Hz
    MSS_TIM1_load_background(400000); // 50Hz
    MSS_TIM1_enable_irq();
    MSS_TIM1_start();

    MSS_UART_init(&g_mss_uart1, MSS_UART_57600_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);

    UART_init(&g_uart, UART_BASE, 0, 0);
    NVIC_EnableIRQ(Fabric_IRQn);

	dualshock player1;
	dualshock player2;
	dualshock player3;

	player1.gpio = MSS_GPIO_13;
	player1.spi = &g_spi0;
	player1.ctrl_mode  = TANK;
	player2.gpio = MSS_GPIO_14;
	player2.spi = &g_spi0;
	player2.ctrl_mode  = TANK;
	player3.gpio = MSS_GPIO_15;
	player3.spi = &g_spi0;
	player3.ctrl_mode  = TANK;

	while( 1 )
	{
		if(update){
			//printf("player1:\n\r");
			ds_update(&player1, buffer);
			// print_response(buffer, 9);
			// printf("\n");
			//printf("player2:\n\r");
			ds_update(&player2, buffer);
			//print_response(buffer, 9);
			//printf("\n");
			//printf("player3:\n\r");
			ds_update(&player3, buffer);
			//print_response(buffer, 9);
			//printf("\n");

			if(robot_state & 1<<0){
				ds_get_drivevals(&player1, &buffer[1], &buffer[0]);
			}
			else{
				buffer[0] = 0x80;
				buffer[1] = 0x80;
			}
			if(robot_state & 1<<1){
				ds_get_drivevals(&player2, &buffer[3], &buffer[2]);
			}
			else{
				buffer[2] = 0x80;
				buffer[3] = 0x80;
			}
			if(robot_state & 1<<2){
				ds_get_drivevals(&player3, &buffer[5], &buffer[4]);
			}
			else{
				buffer[4] = 0x80;
				buffer[5] = 0x80;
			}
			buffer[6] = 0xA5;
			buffer[7] = 0x5A;
			MSS_UART_polled_tx(&g_mss_uart1, buffer,8);
			// printf("sent: %d\r\n", buffer);
			update = 0;
		}
	}
}

void Timer1_IRQHandler( void ){
	MSS_TIM1_clear_irq();
	update = 1;
}

void Fabric_IRQHandler(void){
	if(UART_get_rx(&g_uart, &robot_state, 1) != 1){
		printf("UART RX screwup?\n");
	}
	printf("got: %d\r\n", robot_state);
}
