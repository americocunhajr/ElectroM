% -----------------------------------------------------------------
%  main_ElectroM_dimensionless.m
% ----------------------------------------------------------------- 
%  programmer: Americo Cunha
%              americo.cunha@uerj.br
%
%  last update: August 9, 2021
% -----------------------------------------------------------------
%  This is the main file for a program that compute the
%  dimensionless parameters values that are associated to
%  the electromechanical nonlinear dynamical system.
% -----------------------------------------------------------------
%  Reference:
%  A. Cunha Jr et al.
%  On the modeling of nonlinear electromechanical systems, 2021
% -----------------------------------------------------------------

clc
clear
close all


% program header
% -----------------------------------------------------------
disp('                                                    ')
disp(' ---------------------------------------------------')
disp(' ElectroM - Electromechanical Dynamics Code         ')
disp(' (dimensionless parameters values)                  ')
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

% % dimensional parameters values
% -----------------------------------------------------------
disp(' '); 
disp(' --- dimensional parameters values --- ');
disp(' ');

% ................................................................
% R. Lima and R. Sampaio,
% Pitfalls in the dynamics of coupled electromechanical systems
% http://dx.doi.org/10.5540/03.2018.006.02.0310
% ................................................................
M = 5.0        % cart mass (kg)
D = 0.05       % pin diameter (m)
L = 1.880e-4   % electric inductance (kg m^2)
J = 1.210e-4   % rotational inertia (N.m/rad/s^2)
B = 1.545e-4   % damping ratio (N.m/rad/s)
R = 0.307      % electrical resistance (Ohm)
G = 5.330e-2   % coupling coefficient (N.m/A or V/rad/s)
V = 20.0       % source voltage (V)
% ................................................................

% ................................................................
% B. Nayak and S. Sahu,
% Parameter estimation of DC motor through whale optimization algorithm
% http://dx.doi.org/10.11591/ijpeds.v10.i1.pp83-92
% ................................................................
% M = 1.0            % cart mass (kg)
% D = 0.05           % pin diameter (m)
% L = 0.01           % electric inductance (kg m^2)
% J = 0.4            % rotational inertia (N.m/rad/s^2)
% B = 0.02           % damping ratio (N.m/rad/s)
% R = 0.5            % electrical resistance (Ohm)
% G = 1.23*20/240;   % coupling coefficient (N.m/A or V/rad/s)
% V = 20.0           % source voltage (V)
% ................................................................

% ................................................................
% S. S. Saab and R. A. Kaed-Bey
% Parameter Identification of a DC Motor: An Experimental Approach
% https://doi.org/10.1109/ICECS.2001.957638
% ................................................................
% M = 1.0      % cart mass (kg)
% D = 0.05     % pin diameter (m)
% L = 0.658    % electric inductance (kg m^2)
% J = 1.4e-3   % rotational inertia (N.m/rad/s^2)
% B = 1.0e-4   % damping ratio (N.m/rad/s)
% R = 32.91    % electrical resistance (Ohm)
% G = 0.556;   % coupling coefficient (N.m/A or V/rad/s)
% V = 20.0     % source voltage (V)
% ................................................................

% ................................................................
% Shanmuga nithya B, Mythile A, Pavithra S, Nivetha N
% Parameter Identification Of A DC Motor
% https://www.ijstr.org/research-paper-publishing.php?month=feb2020
% ................................................................
% M = 1.0      % cart mass (kg)
% D = 0.05     % pin diameter (m)
% L = 1.5e-3   % electric inductance (kg m^2)
% J = 2.5e-4   % rotational inertia (N.m/rad/s^2)
% B = 1.0e-4   % damping ratio (N.m/rad/s)
% R = 0.5      % electrical resistance (Ohm)
% G = 0.05     % coupling coefficient (N.m/A or V/rad/s)
% V = 20.0     % source voltage (V)
% ................................................................

% ................................................................
% A. Petrovas, A. Pitrenas, and Z. Savickiene
% DC motor parameter identification using equation error method
% https://doi.org/10.1007/s00202-017-0514-6
% ................................................................
% M = 1.0        % cart mass (kg)
% D = 0.05       % pin diameter (m)
% L = 4.52e-3    % electric inductance (kg m^2)
% J = 1.0e-4     % rotational inertia (N.m/rad/s^2)
% B = 0.352e-4   % damping ratio (N.m/rad/s)
% R = 0.731e-3   % electrical resistance (Ohm)
% G = 185.0e-4   % coupling coefficient (N.m/A or V/rad/s)
% V = 20.0       % source voltage (V)
% ................................................................

% ................................................................
% D. Sendrescu
% Parameter Identification of a DC Motor via Distribution Based Approach
% https://doi.org/10.1109/MMAR.2012.6347919
% ................................................................
% M = 1.0        % cart mass (kg)
% D = 0.05       % pin diameter (m)
% L = 1.8e-4     % electric inductance (kg m^2)
% J = 3.87e-7    % rotational inertia (N.m/rad/s^2)
% B = 1.5e-3     % damping ratio (N.m/rad/s)
% R = 2.6        % electrical resistance (Ohm)
% G = 7.67e-3    % coupling coefficient (N.m/A or V/rad/s)
% V = 20.0       % source voltage (V)
% ................................................................


% compute time-scales and dimensionless parameters
% -----------------------------------------------------------
disp(' '); 
disp(' --- characteristic scales --- ');
disp(' ');

% characteristic mechanical time
T_theta = J*R/G^2

% characteristic electrical time
T_Q = L/R          

% characteristic current
dQdT_c = G^3/(J*R^2)

% characteristic angular velocity
dthetadT_c = G^2/(J*R)

% characteristic damping
B_c = G^2/R

% characteristic inductance
L_c = J*R^2/G^2

% characteristic voltage
V_c = G^3/(J*R)

% characteristic diameter
D_c = sqrt(J/M)
% -----------------------------------------------------------

% dimensionless parameters
% -----------------------------------------------------------
disp(' '); 
disp(' --- dimensionless parameters --- ');
disp(' ');

% dimensionless damping
b = B/B_c

% dimensionless inductante
l = L/L_c

% dimensionless voltage
nu = V/V_c

% dimensionless eccentricity
d = D/D_c
% -----------------------------------------------------------