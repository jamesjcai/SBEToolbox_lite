function [res] = graph_meandist(G)
%GRAPH_MEANDIST -
%
%[res]=graph_meandist(G)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

n = num_vertices(G);
[D] = all_shortest_paths(double(sparse(G)));
idx = [];
for k = 1:n
    if sum(D(k, :) == inf) == n - 1
        idx = [idx, k];
    end
end
D(idx, :) = [];
D(:, idx) = [];
m = n - numel(idx);
res = nansum(D(:)) / (m * (m - 1));
