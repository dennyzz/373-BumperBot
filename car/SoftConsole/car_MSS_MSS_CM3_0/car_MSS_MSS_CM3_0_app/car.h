/*
 * car.h
 *
 *  Created on: Apr 3, 2017
 *      Author: weeyizhi
 */


#ifndef CAR_H
#define CAR_H


#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>
#include <assert.h>

#define CAR_ID 		1	//0-2


//Initialize the PWM width, EN, and DIR to zero
void initMotor( void );

// Write MMIO via APB
void setMotorAPB(uint16_t *rx_buff);

#endif
