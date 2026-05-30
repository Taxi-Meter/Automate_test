# Automate_test

This project focuses on developing an End-to-End (E2E) Automation Testing suite for the Swag Labs web application (saucedemo.com) using Robot Framework. The primary objective is to validate the core user journey  from initial login, product selection, and checkout flow through to successful order completion.

### Requirements

- Python
- Robot framework
- Selenium
- VScode
- Git

### How to install

1. Download and install Python
2. Run command: ```pip install robotframework```
3. Run command: ```install robotframework-seleniumlibraly```
4. Download and install VScode 
5. Download and install Git

### How to test 

1. Open VScode
2. Copy HTTPS URL: https://github.com/Taxi-Meter/Automate_test.git
3. Open terminal 
4. Run command: ```git clone https://github.com/Taxi-Meter/Automate_test.git```
5. Open file swagLabs.robot
6. Run command:```robot .\swagLabs.robot```

### Any Assumptions Made 

- System Performance: The website responded instantly within the set delay of 1 second.
- Session Isolation: The test is run on the Chrome browser in incognito mode to ensure that a clean, fresh session starts every time it is run.
