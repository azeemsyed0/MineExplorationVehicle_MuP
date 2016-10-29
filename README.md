# MineExplorationVehicle_MuP
Academic Project for the course [EEE F215] Microprocessors and Interfacing
<br/><br/>
# Problem Statement
A Mine Exploration Vehicle (MEV) is to be designed. The vehicle is six-wheeled with an on-board robotic arm to pick up samples and on-board scientific instruments and cameras (vehicle fig is shown below). The primary aim of the vehicle is to explore the terrain, measure atmospheric conditions in the mine and assess samples of rocks and soil. This can be controlled remotely from above the ground. All subsystems on the vehicle are controlled by the remote unit and are in contact with the remote unit through a RF modem.
# Assumptions
Due to the non-availability of RF modem (CC2420) in proteus, wired transmission via the keypad on the vehicle has been used to drive the Mine Exploration Vehicle (MEV).
Gyroscope is used to measure the tilt angle which needs to be less than 45° according to the problem. Since the gyroscope is not available in the proteus library, it is simulated via a potentiometer. The analog output of gyroscope is simulated using potentiometer.
