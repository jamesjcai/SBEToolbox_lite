function plotnet(sbeG,xy,sbeNode)

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
z=ones(size(xy(:,1)));
plot3(xy(:,1), xy(:,2), z, 'r.');
text(xy(:,1), xy(:,2), z, sbeNode);
%text(xy(:,1), xy(:,2), sbeNode);
set(gcf,'Color',[1,1,1]);

%set(gca,'XTick',[]);
%set(gca,'YTick',[]);
%axis off;
axis square

% Create the toolbar
fh=gcf;
th = uitoolbar(fh);

% Add a push tool to the toolbar
a = 0.20:0.05:0.95;
img1(:,:,1) = repmat(a,16,1)';
img1(:,:,2) = repmat(a,16,1);
img1(:,:,3) = repmat(flip(a,2),16,1);
pth = uipushtool(th,'CData',img1,...
           'TooltipString','My push tool',...
           'HandleVisibility','off','ClickedCallback','axis off');
       
% Add a toggle tool to the toolbar
img2 = rand(16,16,3);
tth = uitoggletool(th,'CData',img2,'Separator','on',...
           'TooltipString','Your toggle tool',...
           'HandleVisibility','off','ClickedCallback','axis on');
       

end
