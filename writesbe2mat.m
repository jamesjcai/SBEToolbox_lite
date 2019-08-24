function writesbe2mat(sbe_adjmat,sbe_nodeinfo,filename)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

if nargin < 3
    [filename, pathname,filterindex] = uiputfile( ...
       {'*.mat', 'Matlab Variables Binary Files (*.mat)'}, ...
        'Save as');
	if ~(filename), return; end
	filename=[pathname,filename];
	%if filterindex==1
	%	if isempty(find(filename=='.',1))
    %        filename=[filename,'.mat'];
    %    end
    %end
end
save(filename,'sbe_adjmat','sbe_nodeinfo');




