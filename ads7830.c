#include "ads7830.h"

int ADC_init(ADC_device *adc, int address) {

  adc->fd = wiringPiI2CSetup(address);
  if (adc->fd == -1) {
    return -1;
  }
  adc->address = address;
  adc->cmd = 0x84;
  return 0;
}

int ADC_read(ADC_device *adc, int channel) {
  if (adc == NULL || adc->fd <= 0 || channel < 0 || channel > 7) {
    return -1;
  }

  int command = adc->cmd | (((channel << 2 | channel >> 1) & 0x07) << 4);

  wiringPiI2CWrite(adc->fd, command);

  return wiringPiI2CRead(adc->fd);
}
