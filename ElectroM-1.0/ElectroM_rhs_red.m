% -----------------------------------------------------------------
%  ElectroM_rhs_red.m
% ----------------------------------------------------------------- 
%  programmer: Americo Cunha
%              americo.cunha@uerj.br
%
%  last update: August 9, 2021
% ----------------------------------------------------------------- 
%  This function defines the reduced set of differential equations
%  which governs the behavior of the electromechanical system.
% -----------------------------------------------------------------
%  Reference:
%  A. Cunha Jr et al.
%  On the modeling of nonlinear electromechanical systems, 2021
% -----------------------------------------------------------------
function dydt = ElectroM_rhs_red(t,y,phys_param)

    % preallocate memory for Ydot vector
    dydt = zeros(2,1);

    % physical parameters
    b  = phys_param(1);
    %l  = phys_param(2);
    nu = phys_param(3);
    d  = phys_param(4);

    theta     = y(1);
    theta_dot = y(2);
    q         = nu - theta_dot;
    sinO_2    = sin(theta)^2;
    sinOcosO  = sin(theta)*cos(theta);

    % state space system of equations
    dydt(1) = theta_dot;
    dydt(2) = (q-theta_dot*(b+d^2*sinOcosO*theta_dot))/(1+d^2*sinO_2);
end
% -----------------------------------------------------------------
