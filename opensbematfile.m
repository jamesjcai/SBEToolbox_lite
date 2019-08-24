function [sbeG,sbeNode]=opensbematfile(filename)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

sbeG=[];
sbeNode=[];
if nargin < 1
    [filename,pathname] = uigetfile( ...
       {'*.mat', 'Matlab Variables Binary Files (*.mat)'; 
        '*.*',  'All Files (*.*)'}, ...
        'Open a file');
	
	if isequal(filename,0) || isequal(pathname,0)
		return;
	else
		filename=fullfile(pathname,filename); 
	end
end
disp(['Reading ',filename]);
try
    load(filename,'sbeG','sbeNode');
catch ME
    sbeG=[]; sbeNode=[];
    rethrow(ME)
end