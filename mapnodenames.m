function [M]=mapnodenames(sbeNode,M)

if nargin<1, M=containers.Map(); end
for k=1:numel(sbeNode)
    M(sbeNode{k}) = k;
end