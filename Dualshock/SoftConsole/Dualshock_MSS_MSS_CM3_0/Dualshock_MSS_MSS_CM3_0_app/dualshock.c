#include "dualshock.h"


// place command into buffer, incoming data will overwrite the buffer
void transceive_frame(spi_instance_t* spi, mss_gpio_id_t gpio, uint8_t* buffer, uint16_t size){
	int i = 0;
	MSS_GPIO_set_output(gpio, 0);
	for(i = 0; i < size; i++){
		buffer[i] = SPI_transfer_frame(spi, reversebyte(buffer[i]));
		buffer[i] = reversebyte(buffer[i]);
	}
	MSS_GPIO_set_output(gpio, 1);
}

uint8_t reversebyte(uint8_t b){
   b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
   b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
   b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
   return b;
}

void print_response(uint8_t* buffer, uint8_t size){
	int i;
	for(i = 0; i < size; i++){
		printf("0x%02X, ", buffer[i]);
	}
	printf("\b\b  \r");
}

void ds_configure(dualshock* ctrl, uint8_t* buffer){
	printf("configuring player at GPIO: %d", ctrl->gpio);
	memcpy(buffer, enter_config, sizeof(enter_config));
	transceive_frame(ctrl->spi, ctrl->gpio, buffer, sizeof(enter_config));

	memcpy(buffer, mode_switch, sizeof(mode_switch));
	transceive_frame(ctrl->spi, ctrl->gpio, buffer, sizeof(mode_switch));

	memcpy(buffer, exit_config, sizeof(exit_config));
	transceive_frame(ctrl->spi, ctrl->gpio, buffer, sizeof(exit_config));
}

void ds_config_exit(dualshock* ctrl, uint8_t* buffer){
	printf("exit config for player at GPIO: %d", ctrl->gpio);
	memcpy(buffer, exit_config, sizeof(exit_config));
	transceive_frame(ctrl->spi, ctrl->gpio, buffer, sizeof(exit_config));
}

uint8_t ds_digital_poll(dualshock* ctrl, uint8_t* buffer){
	memcpy(buffer, digital_poll, sizeof(digital_poll));
	transceive_frame(ctrl->spi, ctrl->gpio, buffer, sizeof(digital_poll));
	return buffer[1];
}
uint8_t ds_analog_poll(dualshock* ctrl, uint8_t* buffer){
	memcpy(buffer, analog_poll, sizeof(analog_poll));
	transceive_frame(ctrl->spi, ctrl->gpio, buffer, sizeof(analog_poll));
	return buffer[1];
}

uint8_t ds_parse(dualshock* ctrl, uint8_t* buffer){
	return 0;
}



// different "modes"
//0xFF = Disconnect
//0x41 = Digital
//0xF3 = Config
//0x73 = Analog (+ Digital)
void ds_update(dualshock* ctrl, uint8_t* buffer){
	int i;
	int exit = 0;
	do{
		ds_analog_poll(ctrl, buffer);
		//assert(buffer[0] == 0xFF); // first byte should be FF always
		//assert(buffer[2] == 0x5A);
		ctrl->mode = buffer[1];
		uint8_t rxbytes = (ctrl->mode & 0x0F) << 1;

		switch(ctrl->mode){
			case MODE_DISC:
				memset(ctrl->data, 0x80, 6); // clear the data when disconnected
				exit = 1;
				break;
			case MODE_CONF:
				ds_config_exit(ctrl, buffer);
				break;
			case MODE_DIGITAL:
				ds_configure(ctrl, buffer);
			case MODE_ANALOG:
				for(i = 0; i < rxbytes; i++){
					ctrl->data[i] = buffer[i+3];
				}
				if(ctrl->data[2] & 1<<6){ // std mode
					ctrl->ctrl_mode = TANK;
				}
				else if (ctrl->data[2] & 1<<5){
					ctrl->ctrl_mode = STD;
				}
				exit = 1;
				break;
			default:
				exit = 1;
				break;
		}
	}while(!exit); // exit conditions mode_analog! or config steps overdone.
	return ctrl->mode;
}




uint8_t ds_get_drivevals(dualshock* ctrl, uint8_t* left, uint8_t* right){
	if(ctrl->mode == MODE_DISC){
		*left = 0x80;
		*right = 0x80;
		return 1;
	}
	else{
		if(ctrl->ctrl_mode == TANK){
			*left = ctrl->data[5];
			*right = ctrl->data[3];
		}
		else if (ctrl->ctrl_mode == STD){
			*left = ctrl->data[5];
			*right = ctrl->data[3];
		}
		else{
			*left = ctrl->data[5];
			*right = ctrl->data[3];
		}
		return 0;
	}
}











