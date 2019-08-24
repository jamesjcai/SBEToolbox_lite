function plotnet_addtoolbar

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

fh=gcf;
th = uitoolbar(fh);
% Add a push tool to the toolbar
a = 0.20:.05:0.95;
img1(:,:,1) = repmat(a,16,1)';
img1(:,:,2) = repmat(a,16,1);
img1(:,:,3) = repmat(flip(a,2),16,1);
% pth = uipushtool(th,'CData',img1,...
%            'TooltipString','axis off',...
%            'HandleVisibility','off','ClickedCallback','axis off');

pth = uitoggletool(th,'CData',img1,...
           'TooltipString','axis off',...
           'HandleVisibility','off','OnCallback','axis off','OffCallback','axis on');

% Add a toggle tool to the toolbar
img2 = rand(16,16,3);
tth = uitoggletool(th,'CData',img2,'Separator','on',...
           'TooltipString','axis square',...
           'HandleVisibility','off','OnCallback','axis square',...
           'OffCallback','axis normal');
       
% Add a toggle tool to the toolbar
img3 = rand(16,16,3);
tth2 = uitoggletool(th,'CData',img3,'Separator','on',...
           'TooltipString','set(gcf,''Color'',[1,1,1])',...
           'HandleVisibility','on','ClickedCallback','',...
           'OnCallback','set(gcf,''Color'',[1,1,1])',...
           'OffCallback','set(gcf,''Color'',''default'')');
       
       