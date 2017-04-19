% Installation file. Adds local folders to path.

fprintf('Adding SBEToolbox_lite folders to Matlab path... ')

%addpath(genpath(fullfile(pwd,'lib')));
%addpath(fullfile(pwd));
addpath(fileparts(which(mfilename)));

fprintf('done.\n')
disp('Type "savepath" if you wish to store changes.')
% savepath;
