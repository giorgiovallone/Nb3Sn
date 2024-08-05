# Nb<sub>3</sub>Sn Repository - by gvallone
## Introduction
This repository contains ANSYS macros and MATLAB macro/scripts/functions, aimed at the creation of numerical models at the 'strand level' of superconducting magnets based on Rutherfurd cables with Nb<sub>3</sub>Sn strands.

## ChangeLog
Update 08/05/2024:
Added Nb3Sn_CoilMat.inp - full 3D coil material properties using generalized Hill model. For more details see [4]

Update 10/10/2022:
Added coil esys macro.

## Content
### BareCableMacro_v2.mac
An ANSYS macro useful to create a 2D geometry of a bare Rutherford cable. The cable can then be used to generate stacks [1] or windings [2].

### CableWindingMacro.mac
An ANSYS macro that, starting from a bare cable, creates a 'coil block' in a cos(&theta;) magnet, with separate representation for each turn and the insulation.

### strain_function_cable_z.m
A MATLAB function to compute the exponential strain function [3] on superconducting Nb<sub>3</sub>Sn elements, starting from the strain tensor.

### coil_end_esys_v3.mac

APDL macro, defines the correct ref. system in the ends. Assumes a swept structured mesh. It works only if there are no double nodes - issue an nummrg,nodes before if that is not the case. The script is written for a cos(theta) quadrupole, modifications for other designs should be easy.
Call with:
*use,coil_end_esys_v3.mac,cname,csys0
where:
cname is the target component (volume)
csys0 is the starting number for reference systems

### OrthoCoil_v1.inp

APDL input code example showing how to implement anisotropic material properties from [4] and calling the coil_end_esys macro.

## References
[1] G. Vallone, B. Bordini, and P. Ferracin, “Computation of the reversible critical current degradation in Nb<sub>3</sub>Sn Rutherford cables for particle accelerator magnets”, IEEE Transactions on Applied Superconductivity, 2018.

[2] G. Vallone, E. Anderssen, B. Bordini, P. Ferracin, J.F. Troitino, S. Prestemon, "A Methodology to Compute the Critical Current Limit in Nb<sub>3</sub>Sn Magnets", Superconductor Science and Technology, 2021. 

[3] B. Bordini, P. Alknes, L. Bottura, L. Rossi, D. Valentinis, “An exponential scaling law for the strain dependence of the Nb<sub>3</sub>Sn critical current density,” Superconductor Science and Technology, 2013.

[4] G. Vallone, E. Anderssen, B. Bordini and P. Ferracin, "A Review of the Mechanical Properties of Materials Used in Nb3Sn Magnets for Particle Accelerators," in IEEE Transactions on Applied Superconductivity, vol. 33, no. 5, pp. 1-6, Aug. 2023, Art no. 4002806, doi: 10.1109/TASC.2023.3248544
