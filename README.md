# PWM Generator Project

## Overview
This project was created as part of the GAC laboratory and represents a PWM (Pulse Width Modulation) generator. PWM is a technique used to control the amount of power delivered to a load by varying the duty cycle of a digital signal.

## Project Structure
The project consists of the following main components:
- `src/main.m`: Main script to run the application.
- `src/assets/html/navbar/navbar.html`: HTML file for the navigation bar.
- `src/components/pages/pwm-generator/pwm_generator.m`: MATLAB function to create the PWM generator component.
- `src/components/pages/pwm-generator/generate_signal.m`: MATLAB function to generate the PWM signal.

## Run app
```bash
$ matlab --nondesktop # Run MATLAB in terminal mode
```

```matlab
>> addpath('src')
>> main
```