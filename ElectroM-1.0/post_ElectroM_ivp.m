% -----------------------------------------------------------------
%  post_ElectroM_ivp.m
% ----------------------------------------------------------------- 
%  programmers: Americo Cunha
%               americo.cunha@uerj.br
%  
%               Marcelo Pereira
%               marcelocpereira@globo.com
%
%  last update: August 9, 2021
% -----------------------------------------------------------------
%  Script for post processing of the simulation data from the
%  electromechanical nonlinear dynamical system.
% -----------------------------------------------------------------
%  Reference:
%  A. Cunha Jr et al.
%  On the modeling of nonlinear electromechanical systems, 2021
% -----------------------------------------------------------------


% -----------------------------------------------------------
tic

disp(' ');
disp(' --- post processing --- ');
disp(' ');
disp('    ... ');
disp(' ');

% number of time steps
Ndt1 = length(time1);
Ndt2 = length(time2);

% number of steps for steady state
Nss1 = round(0.8*Ndt1);
Nss2 = round(0.8*Ndt2);

% plot horizontal displacement
% ...........................................................
leg1 = 'full model';
leg2 = 'reduced model';
xlab   = 'time';
ylab   = 'horizontal displacement';
gtitle = ' ';
xmin   = t0;
xmax   = t1;
ymin   = -1.2*d;
ymax   =  1.2*d;
%ymin   = 'auto';
%ymax   = 'auto';
gname1 = [num2str(case_name),'__x_vs_time_full'];
gname2 = [num2str(case_name),'__x_vs_time_red'];
flag   = 'eps';
% fig00f = graph_type1(time1,Qx1,...
%                      gtitle,xlab,ylab,...
%                      xmin,xmax,ymin,ymax,gname1,flag);

fig00r = graph_type2(time1,Qx1,time2,Qx2,...
                     gtitle,leg1,leg2,xlab,ylab,...
                     xmin,xmax,ymin,ymax,gname2,flag);
% ...........................................................



% plot current vs horizontal displacement
% ...........................................................
leg1 = 'full model';
leg2 = 'reduced model';
xlab   = 'horizontal displacement';
ylab   = 'electric current';
gtitle = ' ';
xmin   = -1.2*d;
xmax   =  1.2*d;
ymin   = 'auto';
ymax   = 'auto';
gname1 = [num2str(case_name),'__curr_vs_x_full'];
gname2 = [num2str(case_name),'__curr_vs_x_red'];
flag   = 'eps';
% fig01f = graph_type1(Qx1(Nss1:end),Qcurr1(Nss1:end),...
%                      gtitle,xlab,ylab,...
%                      xmin,xmax,ymin,ymax,gname1,flag);

fig01r = graph_type2(Qx1(Nss1:end),Qcurr1(Nss1:end),Qx2(Nss2:end),Qcurr2(Nss2:end),...
                     gtitle,leg1,leg2,xlab,ylab,...
                     xmin,xmax,ymin,ymax,gname2,flag);
% ...........................................................


% plot angular displacement
% ...........................................................
leg1 = 'full model';
leg2 = 'reduced model';
xlab   = 'time';
ylab   = 'angular displacement';
gtitle = ' ';
xmin   = t0;
xmax   = t1;
%ymin   = 0.0;
%ymax   = 2000.0;
ymin   = 'auto';
ymax   = 'auto';
gname1 = [num2str(case_name),'__disp_vs_time_full'];
gname2 = [num2str(case_name),'__disp_vs_time_red'];
flag   = 'eps';
% fig02f = graph_type1(time1,Qdisp1,...
%                      gtitle,xlab,ylab,...
%                      xmin,xmax,ymin,ymax,gname1,flag);

fig02r = graph_type2(time1,Qdisp1,time2,Qdisp2,...
                     gtitle,leg1,leg2,xlab,ylab,...
                     xmin,xmax,ymin,ymax,gname2,flag);
% ...........................................................



% plot angular velocity
% ...........................................................
leg1 = 'full model';
leg2 = 'reduced model';
xlab   = 'time';
ylab   = 'angular velocity';
gtitle = ' ';
xmin   = t0;
xmax   = t1;
%ymin   = 0.0;
%ymax   = 2000.0;
ymin   = 'auto';
ymax   = 'auto';
gname1 = [num2str(case_name),'__velo_vs_time_full'];
gname2 = [num2str(case_name),'__velo_vs_time_red'];
flag   = 'eps';
% fig03f = graph_type1(time1,Qvelo1,...
%                      gtitle,xlab,ylab,...
%                      xmin,xmax,ymin,ymax,gname1,flag);

fig03r = graph_type2(time1,Qvelo1,time2,Qvelo2,...
                     gtitle,leg1,leg2,xlab,ylab,...
                     xmin,xmax,ymin,ymax,gname2,flag);
% ...........................................................


% plot electric current
% ...........................................................
leg1 = 'full model';
leg2 = 'reduced model';
xlab   = 'time';
ylab   = 'electric current';
gtitle = ' ';
xmin   = t0;
xmax   = t1;
%ymin   = -250.0;
%ymax   =  100.0;
ymin   = 'auto';
ymax   = 'auto';
gname1 = [num2str(case_name),'__curr_vs_time_full'];
gname2 = [num2str(case_name),'__curr_vs_time_red'];
flag   = 'eps';
% fig04f = graph_type1(time1,Qcurr1,...
%                      gtitle,xlab,ylab,...
%                      xmin,xmax,ymin,ymax,gname1,flag);

fig04r = graph_type2(time1,Qcurr1,time2,Qcurr2,...
                     gtitle,leg1,leg2,xlab,ylab,...
                     xmin,xmax,ymin,ymax,gname2,flag);
% ...........................................................


% % plot phase trajectoty disp vs velo
% % ...........................................................
% leg1 = 'full model';
% leg2 = 'reduced model';
% xlab   = 'angular displacement';
% ylab   = 'angular velocity';
% gtitle = ' ';
% xmin   = 'auto';
% xmax   = 'auto';
% ymin   = 'auto';
% ymax   = 'auto';
% % xmin   = 0.0;
% % xmax   = 2000.0;
% % ymin   = 0.0;
% % ymax   = 2000.0;
% gname1 = [num2str(case_name),'__disp_vs_velo_full'];
% gname2 = [num2str(case_name),'__disp_vs_velo_red'];
% flag   = 'eps';
% % fig05f = graph_type1(Qdisp1,Qvelo1,...
% %                      gtitle,xlab,ylab,...
% %                      xmin,xmax,ymin,ymax,gname1,flag);
% 
% fig05r = graph_type2(Qdisp1,Qvelo1,...
%                      Qdisp2,Qvelo2,...
%                      gtitle,leg1,leg2,xlab,ylab,...
%                      xmin,xmax,ymin,ymax,gname2,flag);
% % ...........................................................


% % plot phase trajectoty disp vs curr
% % ...........................................................
% leg1 = 'full model';
% leg2 = 'reduced model';
% xlab   = 'electric current';
% ylab   = 'angular displacement';
% gtitle = ' ';
% xmin   = 'auto';
% xmax   = 'auto';
% ymin   = 'auto';
% ymax   = 'auto';
% % xmin   = -250.0;
% % xmax   = 100.0;
% % ymin   = 0.0;
% % ymax   = 2000.0;
% gname1 = [num2str(case_name),'__curr_vs_disp_full'];
% gname2 = [num2str(case_name),'__curr_vs_disp_red'];
% flag   = 'eps';
% % fig06f = graph_type1(Qcurr1,Qdisp1,...
% %                      gtitle,xlab,ylab,...
% %                      xmin,xmax,ymin,ymax,gname1,flag);
% 
% fig06r = graph_type2(Qcurr1,Qdisp1,...
%                      Qcurr2,Qdisp2,...
%                      gtitle,leg1,leg2,xlab,ylab,...
%                      xmin,xmax,ymin,ymax,gname2,flag);
% % ...........................................................


% plot phase space trajectoty velo vs curr
% ...........................................................
leg1 = 'full model';
leg2 = 'reduced model';
xlab   = 'electric current';
ylab   = 'angular velocity';
gtitle = ' ';
xmin   = 'auto';
xmax   = 'auto';
ymin   = 'auto';
ymax   = 'auto';
xmin   = -3.0;
xmax   =  3.0;
ymin   =  0.0;
ymax   =  4.0;
gname1 = [num2str(case_name),'__curr_vs_velo_full'];
gname2 = [num2str(case_name),'__curr_vs_velo_red'];
flag   = 'eps';
% fig07f = graph_type1(Qcurr1,Qvelo1,...
%                      gtitle,xlab,ylab,...
%                      xmin,xmax,ymin,ymax,gname1,flag);

fig07r = graph_type2(Qcurr1,Qvelo1,...
                     Qcurr2,Qvelo2,...
                     gtitle,leg1,leg2,xlab,ylab,...
                     xmin,xmax,ymin,ymax,gname2,flag);
% ...........................................................


% plot dynamical system atractor
% ...........................................................
Nbegin = 1;
Njump  = 8;
%Nend   = 10000;
Nend   = Ndt1;

xlab   = 'displacement';
ylab   = 'velocity';
zlab   = 'current';
%gtitle = 'dynamical system atractor';
gtitle = ' ';
xmin   = min(Qdisp1(Nbegin:Nend));
xmax   = max(Qdisp1(Nbegin:Nend));
ymin   = min(Qvelo1(Nbegin:Nend));
ymax   = max(Qvelo1(Nbegin:Nend));
zmin   = min(Qcurr1(Nbegin:Nend));
zmax   = max(Qcurr1(Nbegin:Nend));
% xmin   = 0.0;
% xmax   = 80.0;
% ymin   = -2.0;
% ymax   =  4.0;
% zmin   = -3.0;
% zmax   =  3.0;
gname  = [num2str(case_name),'__atractor3d'];
flag   = 'eps';
fig08 = plot_3d_atractor2(Qdisp1(Nbegin:Njump:Nend),...
                          Qvelo1(Nbegin:Njump:Nend),...
                          Qcurr1(Nbegin:Njump:Nend),...
                           time1(Nbegin:Njump:Nend),...
                          Qdisp2(Nbegin:Njump:Nend),...
                          Qvelo2(Nbegin:Njump:Nend),...
                          Qcurr2(Nbegin:Njump:Nend),...
                           time2(Nbegin:Njump:Nend),...
                          gtitle,xlab,ylab,zlab,...
                          xmin,xmax,ymin,ymax,zmin,zmax,gname,flag);
% ...........................................................

toc
% -----------------------------------------------------------