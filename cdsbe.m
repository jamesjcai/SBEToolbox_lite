function [pw1,pw0]=cdsbe
%CDSBE - Changes to SBEToolbox directory

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

pw0=pwd;
pw1=fileparts(which(mfilename));
cd(pw1);

% if ~strcmp(pw0,pw1)
%     [selectedButton,dlgShown]=uigetpref('sbetoolbox',... % Group
%            'cdsbe_ask',...                               % Preference
%            'Changing Working Directory',...              % Window title
%            {'Do you want to change current working directory to SBEToolbox directory?'},...
%            {'always','never';'Yes','No'},...       % Values and button strings
%            'ExtraOptions','Cancel',...             % Additional button
%            'DefaultButton','Cancel');
%     switch selectedButton
%         case {'always','Yes'}
%             cd(pw1);
%         case {'never','No','Cancel'}
%     end
% end



