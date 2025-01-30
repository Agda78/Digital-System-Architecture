# System-Architecture-Design
Repository for the excercises of system architecture class at University
Every exercise was developed and tested on Vivado 2023.1 and the FPGA board Digilent Artix A7 100T

## Exercise Structure

Given the complexity of the Vivado projects to be loaded, I have decided to perform a series of copy-and-paste operations to simplify the folder structure of the exercises.

In general, I have divided each exercise into three main folders:  

1. `src/` – Contains the implementations of all the necessary components.  
2. `sim/` – Includes all the testbenches written for various simulations.  
3. `board_configuration/` – Contains both the constraint file used and the sketch for the component to be implemented on the board.  

Therefore, when copying the contents of this repository, be careful not to include the folder as a Vivado project but instead manually add the necessary files step by step.  
