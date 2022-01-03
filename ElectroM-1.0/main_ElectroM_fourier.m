% -----------------------------------------------------------------
%  main_ElectroM_ivp.m
% ----------------------------------------------------------------- 
%  programmer: Americo Cunha
%              americo.cunha@uerj.br
%
%  last update: December 29, 2021
% -----------------------------------------------------------------
%  This is the main file for a program that computes Fourier analysis
%  on the nonlinear dynamics of the electromechanical system.
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
disp(' (Fourier analysis)                                 ')
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
case_name = 'ElectroM_fourier';

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

l          = 0.01;  % dimensionless inductance
b          = 1.0;   % dimensionless damping
nu         = 1.0;   % dimensionless voltage
d          = 10.0;  % dimensionless diameter
theta0     = 0.0;   % initial angular displacement
theta_dot0 = 0.0;   % initial angular velocity
q0         = 3.0;   % initial current
% -----------------------------------------------------------


% Fourier analysis
% -----------------------------------------------------------
tic

disp(' ');
disp(' --- Fourier analysis of the nonlinear dynamics --- ');
disp(' ');
disp('    ... ');
disp(' ');

% ODE solver optional parameters
opt = odeset('RelTol',1.0e-6,'AbsTol',1.0e-9);

% minimun frequency of the band
freq_min = 0.0;

% maximum frequency of the band
freq_max = 5.0;

% Nyquist sampling frequency
freq_samp = 2*freq_max;

% time step or sampling period
dt = 1/freq_samp;

% number of samples in a signal copy
Nsamp = 2048;

% number of points for FFT
Nfft = 2^(nextpow2(Nsamp));

% period of a signal copy
Tsignal = Nsamp*dt;

% upper bound of variance estimator
eps_v = 0.1;

% number of signal copies
Ncopies = round(2/eps_v)+1;

% initial time of analysis
t0 = 0.0;

% final time of analysis
t1 = t0 + (Ncopies+1)*Tsignal;

% number of time steps
Ndt = (Ncopies+1)*Nsamp;

% time interval of analysis
tspan = linspace(t0,t1,Ndt);
    
% initial conditions (full)
IC1 = [theta0; theta_dot0; q0];
    
% initial conditions (reduced)
IC2 = [theta0; theta_dot0];

% physical parameters vector
phys_param = [b l nu d];

% full dynamics
[time1,y1] = ...
    ode45(@(t,y)ElectroM_rhs_full(t,y,phys_param),tspan,IC1,opt);

% reduced dynamics
[time2,y2] = ...
    ode45(@(t,y)ElectroM_rhs_red(t,y,phys_param),time1,IC2,opt);

% time series of angular velocity
Qvelo1 = y1(:,2);
Qvelo2 = y2(:,2);

% time series of electric current
Qcurr1 = y1(:,3);
Qcurr2 = nu - Qvelo2;

% Fourier transform of the angular velocity
[Qvelo1_psd,freq1] = ...
 signal_psd(Qvelo1(Nsamp+1:end),freq_max,freq_samp,Nfft,Nsamp,Ncopies);
[Qvelo2_psd,freq2] = ...
 signal_psd(Qvelo2(Nsamp+1:end),freq_max,freq_samp,Nfft,Nsamp,Ncopies);

% PSD of the electric current
Qcurr1_psd = ...
 signal_psd(Qcurr1(Nsamp+1:end),freq_max,freq_samp,Nfft,Nsamp,Ncopies);
Qcurr2_psd = ...
 signal_psd(Qcurr2(Nsamp+1:end),freq_max,freq_samp,Nfft,Nsamp,Ncopies);

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
post_ElectroM_fourier
% -----------------------------------------------------------
