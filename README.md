# Automatic Waiter Caller for Chef
## Introduction to the problem and the solution

In today's busy restaurant environments, efficient communication between the chef and the waiter is crucial for delivering food promptly to customers. However, coordinating this process manually can be challenging and prone to errors. To address this issue, we propose an automatic waiter caller system for chefs. The system aims to indicate whether the food is ready to be served or not, ensuring effective coordination between the kitchen and the waitstaff.

## Hardware design and implementation details

The system incorporates several hardware components to achieve its objectives. It consists of a HC SR04 sensor placed near the food and a Hall effect sensor positioned in the kitchen. Additionally, an LED and a buzzer are employed to attract the waiter's attention. A servo is used to open a separating glass between the kitchen and the waiter area, allowing access to the food. Furthermore, a MAX7219 display is utilized to indicate the current status of the food, providing clear information to the waiter.

To implement the hardware design, the HC SR04 sensor is connected to the appropriate Arduino pins, and the Hall effect sensor is similarly connected. The LED and buzzer are connected to output pins to enable visual and auditory notifications. The servo is connected to the Arduino board to control the opening and closing of the separating glass. The MAX7219 display is connected to the Arduino, and the necessary communication protocol is established.
## Software implementation details

The software implementation is carried out using assembly language on the Arduino platform. The code is structured to handle the interactions between the sensors and the output devices. The program continuously monitors the HC SR04 sensor for food detection. If food is detected, but the Hall effect sensor is not triggered, the program sets the status to "Plating." When the food is ready, and the Hall effect sensor is triggered by the chef, the program activates the LED, sounds the buzzer, and updates the display to indicate "Ready." Additionally, the servo is instructed to open the separating glass.

The software implementation involves configuring the appropriate pins for sensor input and output device control. The code also includes the necessary logic for updating the display and controlling the servo.

## Test results and performance evaluation

To evaluate the system's performance and validate its functionality, testing was conducted using various scenarios. The following tests were performed:

1. Food Detection Test: The HC SR04 sensor accurately detected the presence of food in real-time. The system consistently recognized the food's availability and initiated the appropriate actions.

2. Hall Effect Sensor Test: The Hall effect sensor responded promptly to the chef's trigger, indicating that the food was ready to be served. This ensured efficient coordination between the kitchen and the waiter.

3. LED and Buzzer Activation Test: The LED and buzzer provided immediate visual and auditory cues to alert the waiter. These signals were found to be highly noticeable, ensuring quick responses from the waitstaff.

4. Servo Operation Test: The servo successfully opened the separating glass, allowing easy access to the food once it was ready. The servo mechanism operated smoothly and reliably throughout the testing phase.

5. MAX7219 Display Test: The MAX7219 display accurately presented the food's status, displaying "Cooking," "Plating," or "Ready" as expected. The display provided clear and concise information, aiding the waiter in managing food service effectively.

The tests consistently demonstrated the system's accurate detection, reliable triggering, and proper functioning of all the hardware components. The system performed reliably, ensuring efficient communication between the kitchen and the waiter, resulting in improved food service and customer satisfaction.

## Conclusion and future work

In conclusion, the automatic waiter caller system for chefs has proven to be a successful solution to streamline communication and coordination in a restaurant setting. By automating the process of notifying the waiter when the food is ready, the system enhances efficiency and reduces potential errors.

The successful implementation of the project validates the effectiveness of the proposed idea. The system successfully detects the readiness of the food using the HC SR04 sensor, triggers the appropriate signals with the Hall effect sensor, and displays real-time status updates on the MAX7219 display. The LED, buzzer, and servo mechanisms all functioned reliably to call the waiter's attention and provide seamless access to the food.

For future work, the system can be further enhanced by incorporating additional features. For example, integrating wireless communication protocols could enable seamless notifications to waiters' smart devices, eliminating the need for physical displays and enhancing mobility. Furthermore, advanced machine learning techniques could be explored to automate food detection and improve accuracy.

Overall, the implemented system has demonstrated its effectiveness in solving the problem of timely food service coordination, and it holds potential for further advancements in the realm of restaurant automation.
