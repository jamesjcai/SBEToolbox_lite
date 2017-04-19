function [pw1,pw0]=cdsbe
%CDSBE - Changes to SBEToolbox directory

% Population Genetics & Evolution Toolbox, (C) 2009
% Author: James J. Cai
% Email: jamescai@stanford.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 2/23/2007

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



