#include "drivers/mss_gpio/mss_gpio.h"
#include "drivers/CoreSPI/core_spi.h"

#define SPI_BASE 0x40050000

int main()
{
	uint8_t buffer[100];
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
	while( 1 )
	{

	}
}


void transceive_frame()

