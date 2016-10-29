# MineExplorationVehicle_MuP
Academic Project for the course [EEE F215] Microprocessors and Interfacing
<img src="https://lh3.googleusercontent.com/act-K2ZiiSSH4yQz8Qbc3zlgYx9jksEhq94fgmfRBzW8dKTNRym05N2LKFW96mE2I2O_3RyjKOYPyux4FP9r2Ce4ppzCMTQyhgkrS7eMnEv1ejzSpW14Dm9LzIQpbn6HG2jm8ge9SWU4PjkpGKvomuvMjXWUXHze87CDP3hTlnXBnT3eKklfDiLw79EbnJpnnXn0YoMuL8lT-ZaumnRmgZJx9JyIlCXuJtTLf6aIQHTyJa7moRXjBZiG8_zZqQ2plUytvXXFavTEwaU2QLN85oSEG8FEmRD0T0BCZCvMpK-S50TcdUuWvHCBeT7tYgvSphNsY9NynGW_sX-D4cFxsOjjUXG8gS_H5l0cTF4TEo1hWGX_6jUsV1TCQNbWsoQeMplrwNQZszs2rzch2ysOdGz1m8opVyug_h-kVmUSQ9SqMSeZHAGj5NN-yIzUD0h6IBCYZIGVh1OcCBsGXm865gWmCiefmPo_jkhZVJwOLGyrwImcI_HVN8BJN9WMCDarvcA2-b1NIgM3685T4WZKHAeLojmmAf0jBV0BuAS87JQhC-qa7guricGSZHLJGtivKtiYUt4nk4WD36S8rl6BNtFb-1UDvBovokDiFK11Svy_m4fB=w775-h556-no"/>
# Problem Statement
A Mine Exploration Vehicle (MEV) is to be designed. The vehicle is six-wheeled with an on-board robotic arm to pick up samples and on-board scientific instruments and cameras (vehicle fig is shown below). The primary aim of the vehicle is to explore the terrain, measure atmospheric conditions in the mine and assess samples of rocks and soil. This can be controlled remotely from above the ground. All subsystems on the vehicle are controlled by the remote unit and are in contact with the remote unit through a RF modem.
# Assumptions
Due to the non-availability of RF modem (CC2420) in proteus, wired transmission via the keypad on the vehicle has been used to drive the Mine Exploration Vehicle (MEV).
Gyroscope is used to measure the tilt angle which needs to be less than 45° according to the problem. Since the gyroscope is not available in the proteus library, it is simulated via a potentiometer. The analog output of gyroscope is simulated using potentiometer.
