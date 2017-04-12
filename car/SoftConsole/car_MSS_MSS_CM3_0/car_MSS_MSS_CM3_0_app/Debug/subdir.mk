################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../car.c \
../main.c \
../pwm.c 

OBJS += \
./car.o \
./main.o \
./pwm.o 

C_DEPS += \
./car.d \
./main.d \
./pwm.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\CMSIS -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\CMSIS\startup_gcc -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers\mss_gpio -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers\mss_nvm -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers\mss_nvm\drivers -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers\mss_nvm\drivers\F2DSS_NVM -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers\mss_pdma -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers\mss_rtc -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers\mss_rtc\drivers -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers\mss_rtc\drivers\mss_rtc -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\drivers\mss_timer -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\hal -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\hal\CortexM3 -IC:\Users\niechris\Documents\373_project\373-BumperBot-master\373-BumperBot-master\car\SoftConsole\car_MSS_MSS_CM3_0\car_MSS_MSS_CM3_0_hw_platform\hal\CortexM3\GNU -O0 -ffunction-sections -fdata-sections -g3 -Wall -c -fmessage-length=0 -v -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


