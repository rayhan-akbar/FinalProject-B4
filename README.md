# Automatic Waiter Caller for Chef
## Introduction to the problem and the solution
The idea proposes a system to indicate whether food is ready to be served or not. It involves using two HC SR04 sensors, one placed at the food station and the other in the kitchen. If the food is detected but the chef has not triggered the sensor, it means the food is still being prepared (plating). When the food is detected and the chef triggers the sensor, an LED will light up, a buzzer will sound to call the waiter, and a servo will open the separating glass between the kitchen and the waiter. A MAX7219 display will also be used to show the status of the food such as "Cooking," "Plating," or "Ready."
## Hardware design and implementation details
The system requires the following hardware components:
1. Two HC SR04 sensors: One placed at the food station and the other in the kitchen.
2. An LED to indicate when the food is ready.
3. A buzzer to produce an audible alert for the waiter.
4. A servo motor to open the separating glass between the kitchen and the waiter area.
5. A MAX7219 display module to show the status of the food.

The HC SR04 sensors will be connected to an Arduino board, which will process the sensor data. The LED, buzzer, and servo motor will also be connected to the microcontroller to control their operation. The MAX7219 display module will communicate with the microcontroller using SPI to receive instructions for displaying the food status.
## Software implementation details
The software implementation involves programming the microcontroller to perform the following tasks:
1. Read the sensor data from the HC SR04 sensors to detect the presence of food.
2. Monitor the trigger input from the chef to determine when the food is ready.
3. Control the LED and buzzer to provide visual and audible alerts for the waiter.
4. Send commands to the servo motor to open the separating glass.
5. Update the MAX7219 display module with the appropriate food status ("Cooking," "Plating," or "Ready").
The program is done in assembly language using Arduino IDE
## Test results and performance evaluation
...
## Conclusion and future work
...
