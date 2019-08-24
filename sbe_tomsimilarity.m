function [TOM]=sbe_tomsimilarity(adj,k)
% see also: sbe_adj2tom
if nargin<2
    k=1;
end
[TOM]=sbe_gtom(adj,k);

% https://github.com/ryananeff/WGCNA/blob/6883a01f8192a61d1af8e9338617f9f7b9806e2e/src/networkFunctions.c

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

