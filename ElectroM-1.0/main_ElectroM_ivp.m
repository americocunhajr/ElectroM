% -----------------------------------------------------------------
%  main_ElectroM_ivp.m
% ----------------------------------------------------------------- 
%  programmers: Americo Cunha
%               americo.cunha@uerj.br
%  
%               Marcelo Pereira
%               marcelocpereira@globo.com
%
%  last update: August 9, 2021
% -----------------------------------------------------------------
%  This is the main file for a program that simulates the
%  nonlinear dynamics of the electromechanical system.
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
disp(' (nonlinear dynamics integration)                   ')
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


% simulation information
% -----------------------------------------------------------
case_name = 'ElectroM_ivp';

disp(' '); 
disp([' Case Name: ',num2str(case_name)]);
disp(' ');
% -----------------------------------------------------------


% define parameters and initial conditions
% -----------------------------------------------------------
disp(' '); 
disp(' --- defining parameters and initial conditions --- ');
disp(' ');
disp('    ... ');
disp(' ');

b          = 1.0;   % dimensionless damping
l          = 0.05;  % dimensionless inductance
nu         = 1.0;   % dimensionless voltage
d          = 10.0;  % dimensionless diameter
theta0     = 0.0;   % initial angular displacement
theta_dot0 = 0.0;   % initial angular velocity
q0         = 3.0;   % initial current
% -----------------------------------------------------------


% integrate the initial value problem
% -----------------------------------------------------------
tic

disp(' ');
disp(' --- integration of the nonlinear dynamics --- ');
disp(' ');
disp('    ... ');
disp(' ');

% ODE solver optional parameters
opt = odeset('RelTol',1.0e-6,'AbsTol',1.0e-9);

% initial time of analysis
t0 = 0.0;

% final time of analysis
t1 = t0 + 200.0;

% time interval of analysis
tspan = [t0 t1];

% physical parameters vector
phys_param = [b l nu d];
    
% initial conditions (full)
IC1 = [theta0; theta_dot0; q0];

% full dynamics
[time1,y1] = ...
    ode45(@(t,y)ElectroM_rhs_full(t,y,phys_param),tspan,IC1,opt);
    
% initial conditions (reduced)
IC2 = [theta0; theta_dot0];

% reduced dynamics
[time2,y2] = ...
    ode45(@(t,y)ElectroM_rhs_red(t,y,phys_param),time1,IC2,opt);

% time series of angular displacement
Qdisp1 = y1(:,1);
Qdisp2 = y2(:,1);

% time series of angular velocity
Qvelo1 = y1(:,2);
Qvelo2 = y2(:,2);

% time series of angular acceleration
Qacce1 = (Qvelo1(2:end)-Qvelo1(1:end-1))./time1(2:end);
Qacce2 = (Qvelo2(2:end)-Qvelo2(1:end-1))./time2(2:end);

Qacce1 = [Qacce1; Qacce1(end)];
Qacce2 = [Qacce2; Qacce2(end)];

% time series of electric current
Qcurr1 = y1(:,3);
Qcurr2 = nu - Qvelo2;

% cart horizonyal displacement
Qx1 = d*cos(Qdisp1);
Qx2 = d*cos(Qdisp2);

toc
% -----------------------------------------------------------


% save simulation results
% -----------------------------------------------------------
tic

disp(' ')
disp(' --- saving simulation results --- ');
disp(' ');
disp('    ... ');
disp(' ');

save([num2str(case_name),'.mat']);

toc
% -----------------------------------------------------------


% post processing 
% -----------------------------------------------------------
post_ElectroM_ivp
% -----------------------------------------------------------
