% -----------------------------------------------------------------
%  main_ElectroM_pi_groups.m
% ----------------------------------------------------------------- 
%  programmer: Americo Cunha
%              americo.cunha@uerj.br
%
%  last update: August 9, 2021
% -----------------------------------------------------------------
%  This is the main file for a program that computes the 
%  PI grpoups associated to the electromechanical nonlinear 
%  dynamical system.
% -----------------------------------------------------------------
%  Reference:
%  A. Cunha Jr et al.
%  On the reduction of nonlinear electromechanical systems, 2022
% -----------------------------------------------------------------

clc
clear
close all

% program header
% -----------------------------------------------------------
disp('                                                    ')
disp(' ---------------------------------------------------')
disp(' ElectroM - Electromechanical Dynamics Code         ')
disp(' (PI dimensionless groups)                          ')
disp('                                                    ')
disp(' by                                                 ')
disp(' Americo Cunha                                      ')
disp(' Marcelo Pereira                                    ')
disp(' Rafael Avanco                                      ')
disp(' Angelo Tusset                                      ')
disp(' Jose Manoel Balthazar                              ')
disp(' ---------------------------------------------------')
disp('                                                    ')
% -----------------------------------------------------------

% dimensional quantities vectors
% [mass length time current]
% -----------------------------------------------------------------
T        = [0 0  1  0]; % time (sec)
theta    = [0 0  0  0]; % angular position (radian)
dthetadT = [0 0 -1  0]; % angular velocity (radian/sec)
dQdT     = [0 0  0  1]; % electrical current (Ampere)
L        = [1 2 -2 -2]; % electrical inductance (Henry)
R        = [1 2 -3 -2]; % electrical resistance (Ohm)
G        = [1 2 -2 -1]; % coupling coef. (Newton.meter/Ampere)
V        = [1 2 -3 -1]; % voltage (Volt)
J        = [1 2  0  0]; % rotational inertia (Newton.meter/radian/sec^2)
B        = [1 2 -1  0]; % damping coef. (Newton.meter/radian/sec)
M        = [1 0  0  0]; % mass (kilogram)
D        = [0 1  0  0]; % diameter (meter)
% -----------------------------------------------------------------

% dimensional matrix
% -----------------------------------------------------------------
DM = [J; G; R; L; B; dQdT; V; T; M; D; theta; dthetadT]';

% other orderings are possible, each one leading to a different
% (but theoretically equivalent) dimensionless formulation
% -----------------------------------------------------------------


% compute null space to discover the PI groups
% -----------------------------------------------------------------
PI_Groups = null(DM,'r')
% -----------------------------------------------------------------
