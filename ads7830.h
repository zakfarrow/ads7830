#ifndef ADS7830_H 
#define ADS7830_H

#include <stdio.h>
#include <wiringPi.h>
#include <wiringPiI2C.h>

typedef struct {
  int fd;
  int address;
  int cmd;
} ADC_device;

int ADC_init(ADC_device *adc, int address);
int ADC_read(ADC_device *adc, int channel);

#endif /* ADS7830_H */
