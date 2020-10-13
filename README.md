# Nb<sub>3</sub>Sn Repository - by gvallone
## Introduction
This repository contains ANSYS macros and MATLAB macro/scripts/functions, aimed at the creation of numerical models at the 'strand level' of superconducting magnets based on Rutherfurd cables with Nb<sub>3</sub>Sn strands.

More files will be added soon.

## Content
### BareCableMacro_v2.mac
An ANSYS macro useful to create a 2D geometry of a bare Rutherford cable. The cable can then be used to generate stacks [1] or windings [2].

### CableWindingMacro.mac
An ANSYS macro that, starting from a bare cable, creates a 'coil block' in a cos(&theta;) magnet, with separate representation for each turn and the insulation.

### strain_function_cable_z.m
A MATLAB function to compute the exponential strain function [3] on superconducting Nb<sub>3</sub>Sn elements, starting from the strain tensor.

## References
[1] G. Vallone, B. Bordini, and P. Ferracin, “Computation of the reversible critical current degradation in Nb<sub>3</sub>Sn Rutherford cables for particle accelerator magnets”, IEEE Transactions on Applied Superconductivity, 2018.

[2] G. Vallone, E. Anderssen, B. Bordini, P. Ferracin, J.F. Troitino, S. Prestemon, "A Methodology to Compute the Critical Current Limit in Nb<sub>3</sub>Sn Magnets", Superconductor Science and Technology, under review. 

[3] B. Bordini, P. Alknes, L. Bottura, L. Rossi, and D. Valentinis, “An exponential scaling law for the strain dependence of the Nb<sub>3</sub>Sn critical current density,” Superconductor Science and Technology, vol. 26, no. 7, p. 075 014, 2013.
