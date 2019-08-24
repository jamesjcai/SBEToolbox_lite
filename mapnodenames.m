function [M]=mapnodenames(sbeNode,M)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

if nargin<1, M=containers.Map(); end
for k=1:numel(sbeNode)
    M(sbeNode{k}) = k;
end