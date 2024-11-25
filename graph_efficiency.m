function [out] = graph_efficiency(G)
%[out]=graph_efficiency(G)
%
%Latora V and Marchiori M 2001 Phys. Rev. Lett. 87 198701
%
%The efficiency E[G] of a graph G is defined as: and measures the mean
%flow-rate of information over G
%
%SEE ALSO: DELTA_CENTRALITY

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

n = num_vertices(G);
if ~issparse(G)
    G = double(sparse(G));
end
[D] = all_shortest_paths(G);
D = triu(D, 1);
D = nonzeros(D);
%D=D(:);
%D=D(D>0);
out = 2 * sum(1./D) / (n * (n - 1));
