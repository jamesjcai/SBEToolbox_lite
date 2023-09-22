function [idx] = findgenename(nodename, findwhat)

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

x = strfind(nodename, findwhat);
idx = ~cellfun(@isempty, x);