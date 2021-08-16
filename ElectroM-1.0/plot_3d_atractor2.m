% -----------------------------------------------------------------
%  plot_3d_atractor2.m
% ----------------------------------------------------------------- 
%  programmer: Americo Cunha
%              americo.cunha@uerj.br
%
%  last update: August 9, 2021
% ----------------------------------------------------------------- 
%  This functions plots two 3D atractors for two dynamical systems
%  which time series are given.
%
%  input:
%  x1     - x data vector 1
%  y1     - y data vector 1
%  z1     - z data vector 1
%  time1  - time vector 1
%  x2     - x data vector 2
%  y2     - y data vector 2
%  z2     - z data vector 2
%  time2  - time vector 2
%  gtitle - graph title
%  xlab   - x axis label
%  ylab   - y axis label
%  ylab   - z axis label
%  xmin   - x axis minimum value
%  xmax   - x axis maximum value
%  ymin   - y axis minimum value
%  ymax   - y axis maximum value
%  zmin   - z axis minimum value
%  zmax   - z axis maximum value
%  gname  - graph name
%  flag   - output file format (optional)
%
%  output:
%  gname.eps - output file in eps format (optional)
% -----------------------------------------------------------------
function fig = plot_3d_atractor2(x1,y1,z1,time1,...
                                 x2,y2,z2,time2,...
                                 gtitle,xlab,ylab,zlab,...
                                 xmin,xmax,ymin,ymax,zmin,zmax,gname,flag)
                             
    % check number of arguments
    if nargin < 19
        error('Too few inputs.')
    elseif nargin > 20
        error('Too many inputs.')
    elseif nargin == 19
        flag = 'none';
    end

    % check arguments
    if length(x1) ~= length(y1) || ...
            length(x1) ~= length(z1) || ...
                    length(y1) ~= length(z1)
        error('vectors x1, y1, and z1 must be same length')
    end
    
    if length(x1) ~= length(time1)
        error('x1 and time1 vectors must be same length')
    end
    
    if length(x2) ~= length(y2) || ...
            length(x2) ~= length(z2) || ...
                    length(y2) ~= length(z2)
        error('vectors x2, y2, and z2 must be same length')
    end
    
    if length(x2) ~= length(time2)
        error('x2 and time2 vectors must be same length')
    end
    
	global xdata1 ydata1 zdata1 tdata1 fh1 th1
    global xdata2 ydata2 zdata2 tdata2 fh2 th2
    
    xdata1 = x1;
    ydata1 = y1;
    zdata1 = z1;
    tdata1 = time1;
    xdata2 = x2;
    ydata2 = y2;
    zdata2 = z2;
    tdata2 = time2;
    
    % custom colors
    MyCyan   = [0   206 209]/256;
    MyRed    = [255 102 102]/256;
    MyOrange = [255 153  51]/256;
    MyYellow = [255 255 102]/256;
    MyGreen  = [0   102   0]/256;
    MyBlue   = [0   0   255]/256;
    MyPurple = [127 0   255]/256;
    MyViolet = [153 0   153]/256;
    MyPink   = [255 0   127]/256;
    MyGray   = [128 128 128]/256;
    
    fig = figure('Name',gname,'NumberTitle','off');
    
    set(gcf,'color','white');
    set(gca,'TickDir','out','TickLength',[.02 .02]);
    set(gca,'XColor',[.3 .3 .3],'YColor',[.3 .3 .3],'zColor',[.3 .3 .3]);
    %set(gca,'Box','on');
    
    pos=get(gca,'position');
    pos(1)=1.00*pos(1);
    pos(2)=1.00*pos(2);
    pos(3)=0.90*pos(3);
    pos(4)=0.90*pos(4);
    set(gca,'position',pos);
    
    if ( strcmp(xmin,'auto') || strcmp(xmax,'auto') )
        xlim('auto');
    else
        xlim([xmin xmax]);
    end
    
    if ( strcmp(ymin,'auto') || strcmp(ymax,'auto') )
        ylim('auto');
    else
        ylim([ymin ymax]);
    end
    
    if ( strcmp(zmin,'auto') || strcmp(zmax,'auto') )
        zlim('auto');
    else
        zlim([zmin zmax]);
    end
    
    view(135, 45);

    hold on
    grid on

    % time display
    %th1 = text(0.85,0.85,['time = ',num2str(time1(1),'%.1f')],...
    %                     'Color','k','FontName',...
    %                     'Helvetica','FontSize',12,...
    %                     'Units','normalized');
    
    % plot initial data
    fh1 = plot3(x1(1),y1(1),z1(1),'Color',MyCyan,'linewidth',2);
    hold on
    fh2 = plot3(x2(1),y2(1),z2(1),'Color',MyViolet,'linewidth',2);
                         
    set(fh1,'LineWidth',2.0);
    set(fh1,'MarkerSize',2.0);
    set(fh1,'MarkerFaceColor','w');
    set(fh1,'MarkerEdgeColor','k');

    xlabel(xlab,'FontSize',16,'FontName','Helvetica');
    ylabel(ylab,'FontSize',16,'FontName','Helvetica');
    zlabel(zlab,'FontSize',16,'FontName','Helvetica');
            
%   text(0.0,1.10,'On the reduction of nonlinear electromechanical systems (2021)', ...
%                    'Units','normalized',...
%                    'FontName','Times New Roman',...
%                    'color',MyViolet, ...
%                    'FontWeight', 'Bold')
%         
% 	text(0.0,1.05,'A. Cunha Jr, M. Pereira, R. Avanço, A. M. Tusset and J. M. Balthazar', ...
%                     'Units', 'normalized', ...
%                     'FontName', 'Times New Roman', ...
%                     'color',MyViolet, ...
%                     'FontWeight', 'Bold')
                
    pause
                
    title(gtitle,'FontSize',16,'FontName','Helvetica');

    % time series length
    Ndata = numel(time1);
    
    % build timer
    TimerObj = timer('Period',0.001,... %period
                     'ExecutionMode','fixedRate',... %{singleShot,fixedRate,fixedSpacing,fixedDelay}
                     'BusyMode','drop',... %{drop, error, queue}
                     'TasksToExecute',Ndata-1,...
                     'StartDelay',0,...
                     'TimerFcn',@tcb,...
                     'StartFcn',[],...
                     'StopFcn',[],...
                     'ErrorFcn',[]);
      
    % start the timer
    start(TimerObj);
    
	saveas(gcf,gname,'epsc2');
    
end
% -----------------------------------------------------------------


% TimerFcn function
% -----------------------------------------------------------------
function tcb(src,evt)
      
    global xdata1 ydata1 zdata1 tdata1 fh1 th1
    global xdata2 ydata2 zdata2 tdata2 fh2 th2

    %What task are we on?  
    %Use this instead of for-loop variable ii
    taskEx = get(src,'TasksExecuted');

    % update the data.
    set(fh1,'XData',xdata1(1:taskEx),...
            'YData',ydata1(1:taskEx),...
            'ZData',zdata1(1:taskEx));
    set(fh2,'XData',xdata2(1:taskEx),...
            'YData',ydata2(1:taskEx),...
            'ZData',zdata2(1:taskEx));
          
	% update time display
	%set(th1,'String',['time = ',num2str(tdata1(taskEx),'%.1f')]);
    %set(th2,'String',['time = ',num2str(tdata2(taskEx),'%.1f')]);

	%force event queue flush
	drawnow;
    
end
% -----------------------------------------------------------------
