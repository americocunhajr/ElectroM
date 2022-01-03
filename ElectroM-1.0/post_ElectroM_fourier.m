% -----------------------------------------------------------------
%  post_ElectroM_fourier.m
% ----------------------------------------------------------------- 
%  programmer: Americo Cunha
%              americo.cunha@uerj.br
%
%  last update: December 29, 2021
% -----------------------------------------------------------------
%  Script for post processing of the Fourier analysis data from
%  the electromechanical nonlinear dynamical system.
% -----------------------------------------------------------------
%  Reference:
%  A. Cunha Jr et al.
%  On the reduction of nonlinear electromechanical systems, 2022
% -----------------------------------------------------------------


% -----------------------------------------------------------
tic

disp(' ');
disp(' --- post processing --- ');
disp(' ');
disp('    ... ');
disp(' ');


% plot velocity PSD
% ...........................................................
leg1   = 'full model';
leg2   = 'reduced model';
xlab   = 'frequency';
ylab   = 'velocity power spectral density';
gtitle = ' ';
xmin   = 0.0;
xmax   = 1.0;
ymin   = 0.0;
ymax   = 1.0;
%ymin   = 'auto';
%ymax   = 'auto';
gname2 = [num2str(case_name),'__PSD_velo_vs_freq'];
flag   = 'eps';

fig01 = graph_type2(freq1,Qvelo1_psd,freq2,Qvelo2_psd,...
                    gtitle,leg1,leg2,xlab,ylab,...
                    xmin,xmax,ymin,ymax,gname2,flag);
% ...........................................................

% plot current PSD
% ...........................................................
leg1   = 'full model';
leg2   = 'reduced model';
xlab   = 'frequency';
ylab   = 'current power spectral density';
gtitle = ' ';
xmin   = 0.0;
xmax   = 1.0;
ymin   = 0.0;
ymax   = 1.0;
%ymin   = 'auto';
%ymax   = 'auto';
gname2 = [num2str(case_name),'__PSD_curr_vs_freq'];
flag   = 'eps';

fig02 = graph_type2(freq1,Qcurr1_psd,freq2,Qcurr2_psd,...
                    gtitle,leg1,leg2,xlab,ylab,...
                    xmin,xmax,ymin,ymax,gname2,flag);
% ...........................................................

toc
% -----------------------------------------------------------