function plotnet(sbeG,xy,sbeNode)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

%if ~issparse(sbeG), sbeG=sparse(sbeG); end
if nargin<3
    sbeNode=num2str((1:size(sbeG,1))');
end
if nargin<2
    %xy=random_graph_layout(sbeG);
    xy=fruchterman_reingold_force_directed_layout(double(sparse(sbeG)),...
        'iterations',100);
end

gplot(sbeG,xy,'-');
h=findobj('type','line');
%set(h,'color',[.6 .6 .6],'linewidth',1,'LineSmoothing','on')
set(h,'color',[.6 .6 .6],'linewidth',0.5)
hold on;
%z=ones(size(xy(:,1)));
%plot3(xy(:,1), xy(:,2), z, 'r.');
%text(xy(:,1), xy(:,2), z, sbeNode);
plot(xy(:,1), xy(:,2), 'r.');
%text(xy(:,1), xy(:,2), sbeNode);
text(xy(:,1), xy(:,2), sbeNode,'rotation',30);

% set(gcf,'Color',[1,1,1]);

%set(gca,'XTick',[]);
%set(gca,'YTick',[]);
%axis off;
%axis square


% Create the toolbar
plotnet_addtoolbar
       

end
