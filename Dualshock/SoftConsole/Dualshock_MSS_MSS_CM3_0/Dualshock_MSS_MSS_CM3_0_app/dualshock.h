#ifndef __DUALSHOCK__H_
#define __DUALSHOCK__H_

#include "drivers/mss_gpio/mss_gpio.h"
#include "drivers/CoreSPI/core_spi.h"
#include "drivers/mss_timer/mss_timer.h"

static const uint8_t digital_poll[] = {0x01, 0x42, 0x00, 0x00, 0x00};
static const uint8_t enter_config[] = {0x01, 0x43, 0x00, 0x01, 0x00};
static const uint8_t mode_switch[] = {0x01, 0x44, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00};
static const uint8_t exit_config[] = {0x01, 0x43, 0x00, 0x00, 0x5A, 0x5A, 0x5A, 0x5A, 0x5A};
static const uint8_t analog_poll[] = {0x01, 0x42, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

typedef struct dualshock{
	spi_instance_t* spi;
	mss_gpio_id_t gpio;
	uint8_t mode;
	uint8_t response;
	uint8_t data[6];
}dualshock;

enum DS_modes {MODE_DISC = 0xFF, MODE_DIGITAL = 0x41, MODE_CONF = 0xF3, MODE_ANALOG = 0x73};

// place command into buffer, incoming data will overwrite the buffer
void transceive_frame(spi_instance_t* spi, mss_gpio_id_t gpio, uint8_t* buffer, uint16_t size);
uint8_t reversebyte(uint8_t byte);
void print_response(uint8_t* buffer, uint8_t size);

void ds_configure(dualshock* ctrl, uint8_t* buffer);
void ds_config_exit(dualshock* ctrl, uint8_t* buffer);
uint8_t ds_digital_poll(dualshock* ctrl, uint8_t* buffer);
uint8_t ds_analog_poll(dualshock* ctrl, uint8_t* buffer);

uint8_t ds_parse(dualshock* ctrl, uint8_t* buffer);


void ds_update(dualshock* ctrl, uint8_t* buffer);


#endif
