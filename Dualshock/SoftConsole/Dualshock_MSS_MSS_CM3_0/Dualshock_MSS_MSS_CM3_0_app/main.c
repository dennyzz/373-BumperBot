#include "dualshock.h"
#define SPI_BASE 0x40050000

int main()
{
	uint8_t buffer[20];
	MSS_GPIO_init();

	MSS_GPIO_config(MSS_GPIO_13, MSS_GPIO_OUTPUT_MODE);
	MSS_GPIO_config(MSS_GPIO_14, MSS_GPIO_OUTPUT_MODE);
	MSS_GPIO_config(MSS_GPIO_15, MSS_GPIO_OUTPUT_MODE);
	MSS_GPIO_set_output(MSS_GPIO_13, 1);
	MSS_GPIO_set_output(MSS_GPIO_14, 1);
	MSS_GPIO_set_output(MSS_GPIO_15, 1);

	spi_instance_t g_spi0;

	SPI_init(&g_spi0, SPI_BASE, 4);
	SPI_configure_master_mode(&g_spi0);

	dualshock player1;
	dualshock player2;
	dualshock player3;

	player1.gpio = MSS_GPIO_13;
	player1.spi = &g_spi0;
	player2.gpio = MSS_GPIO_14;
	player2.spi = &g_spi0;
	player3.gpio = MSS_GPIO_15;
	player3.spi = &g_spi0;

	while( 1 )
	{
		//printf("player1:\n\r");
		ds_update(&player1, buffer);
		//print_response(buffer, 9);
		//printf("\n");
		//printf("player2:\n\r");
		ds_update(&player2, buffer);
		//print_response(buffer, 9);
		//printf("\n");
		//printf("player3:\n\r");
		ds_update(&player3, buffer);
		//print_response(buffer, 9);
		//printf("\n");
	}
}
