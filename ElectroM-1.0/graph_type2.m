% -----------------------------------------------------------------
%  graph_type2.m
% ----------------------------------------------------------------- 
%  programmer: Americo Cunha
%              americo.cunha@uerj.br
%
%  last update: August 9, 2021
% ----------------------------------------------------------------- 
%  This functions plots a graph with two curves.
%
%  input:
%  x1     - x data vector 1
%  y1     - y data vector 1
%  x2     - x data vector 2
%  y2     - y data vector 2
%  gtitle - graph title
%  leg1   - legend 1
%  leg2   - legend 2
%  xlab   - x axis label
%  ylab   - y axis label
%  xmin   - x axis minimum value
%  xmax   - x axis maximum value
%  ymin   - y axis minimum value
%  ymax   - y axis maximum value
%  gname  - graph name
%  flag   - output file format (optional)
%
%  output:
%  gname.eps - output file in eps format (optional)
% -----------------------------------------------------------------
function fig = graph_type2(x1,y1,x2,y2,...
                           gtitle,leg1,leg2,...
                           xlab,ylab,xmin,xmax,ymin,ymax,gname,flag)
    
    % check number of arguments
    if nargin < 14
        error('Too few inputs.')
    elseif nargin > 15
        error('Too many inputs.')
    elseif nargin == 14
        flag = 'none';
    end

    % check arguments
    if length(x1) ~= length(y1)
        error('x1 and y1 vectors must be same length')
    end
    
    if length(x2) ~= length(y2)
        error('x2 and y2 vectors must be same length')
    end

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
    
    fh1 = plot(x1,y1,'-','Color',MyCyan);
    hold all
    fh2 = plot(x2,y2,'--','Color',MyViolet);
    set(gcf,'color','white');
    set(gca,'position',[0.2 0.2 0.7 0.7]);
    set(gca,'Box','on');
    set(gca,'TickDir','out','TickLength',[.02 .02]);
    set(gca,'XMinorTick','on','YMinorTick','on');
    set(gca,'XGrid','off','YGrid','on');
    set(gca,'XColor',[.3 .3 .3],'YColor',[.3 .3 .3]);
    set(gca,'FontName','Helvetica');
    set(gca,'FontSize',18);
    %set(gca,'XTick',xmin:xmax);
    %set(gca,'YTick',ymin:ymax);
    %axis([xmin xmax ymin ymax]);
    
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
    
    set(fh1,'LineWidth',2.0);
    set(fh1,'MarkerSize',4.0);
    set(fh1,'MarkerFaceColor','w');
    set(fh1,'MarkerEdgeColor','b');
    set(fh2,'LineWidth',2.0);
    set(fh2,'MarkerSize',4.0);
    set(fh2,'MarkerFaceColor','w');
    set(fh2,'MarkerEdgeColor','r');
    leg = legend(leg1,leg2,'Location','Best');
    set(leg,'FontSize',14);
    %set(leg,'interpreter', 'latex');
    labX = xlabel(xlab,'FontSize',22,'FontName','Helvetica');
    labY = ylabel(ylab,'FontSize',22,'FontName','Helvetica');
    %set(labX,'interpreter','latex');
    %set(labY,'interpreter','latex');
    
    hold off
    
	title(gtitle,'FontSize',22,'FontName','Helvetica');
    
    if strcmp(flag,'eps')
        saveas(gcf,gname,'epsc2');
    end

return
% -----------------------------------------------------------------