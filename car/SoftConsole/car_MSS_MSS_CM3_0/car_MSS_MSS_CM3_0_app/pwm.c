/*
 * pwm.c
 *
 *  Created on: Apr 3, 2017
 *      Author: weeyizhi
 */


#include "pwm.h"
#include <math.h>

// Set the H-Bridge EN and DIR values based on controller
uint32_t setBridgeCtrl(uint8_t en_R, uint8_t dir_R, uint8_t en_L, uint8_t dir_L) {
	uint32_t output = 0;
	if(en_R) {
		output |= EN_R_MASK;
	}
	if(dir_R) {
		output |=DIR_R_MASK;
	}
	if(en_L) {
		output |=EN_L_MASK;
	}
	if(dir_L) {
		output |=DIR_L_MASK;
	}
	return output;
}

// Set the duty of PWM
// The actual duty cycle in percent is (duty/2^8)*100%
uint32_t setPWMDuty(uint8_t duty_R, uint8_t duty_L) {
	uint32_t output = 0;
	output |= (duty_R << PWM_R_SHIFT) & PWM_R_MASK;
	output |= (duty_L << PWM_L_SHIFT) & PWM_L_MASK;
	return output;
}

// get duty of PWM (calibrated)
// note: duty/256*100% is the duty cycle in percentage
uint8_t getDuty(uint8_t uncalibrate_in) {
	int diff = abs((int)(uncalibrate_in) - CENTER);
	uint8_t duty;
	if(diff < DEAD_ZONE) {
		return 0;
	}
	else {
		duty = (uint8_t)(((SLOPE)*((double)(diff - DEAD_ZONE)/(CENTER - DEAD_ZONE)) + MIN_DUTY) * 255);
		if (duty > 255) {
			//printf("error value: %d\n\r", duty);
			return 255;
		}
		//printf("return value: %d\n", pwm);
		return duty;
	}
}

// get direction of wheel
uint8_t getDir(uint8_t uncalibrate_in) {
	if(uncalibrate_in < (CENTER - DEAD_ZONE)) {
		//wheel go backwards
		return 0;
	}
	else {
		return 1;
	}
}

// get EN of wheel
uint8_t getEn(uint8_t uncalibrate_in) {
	if(uncalibrate_in < (CENTER - DEAD_ZONE) || uncalibrate_in > (CENTER + DEAD_ZONE) ) {
		return 1;
	}
	else {
		return 0;
	}
}
