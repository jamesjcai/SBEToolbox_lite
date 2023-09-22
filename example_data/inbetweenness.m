function [inBetweenScore, stressCentralityScore] = inbetweenness(path_cellarray, range)
% inbetweenness.m
%
% Created by Patrycja Missiuro {patrycja@mit.edu}, Whitehead Institute,
% Date: March 2006
% Copyright: Massachusetts Institute of Technology / Whitehead Institute,
% Cambridge, MA
%
% input: cellarray of all the shortest paths
%        range - optional, default [1 end] a vector that has indexes from where and to what to sum up values
% output:
%        inBetweenScore - computed based on the Freeman, 1977 algorithm
% where C_B(v) = sum(over v<>s<>t belonging to nodes(V))
% sigma_(s,t)(v)/sigma_(s,t) where v is a node belonging to graph V, s and
% t are two other nodes, sigman(..) is the number of shortest paths from s
% to t, sigma(v) is the number of shortest paths that v lies on
%           stressCentralityScore - closely related to inBetweenScore, it is not
% weighted by the number of paths but just sees in how many paths a node
% was present and returns that score.

% initialize range if not given
if ~exist('range', 'var')
    range = [1, size(path_cellarray, 1)];
end;

% initialize the inBetweenScore
inBetweenScore = zeros(size(path_cellarray, 2), 1);
stressCentralityScore = zeros(size(path_cellarray, 2), 1);
for indx_prot1 = range(1):range(2)
    for indx_prot2 = indx_prot1 + 1:size(path_cellarray, 2)
        paths = path_cellarray{indx_prot1, indx_prot2};
        num_paths = size(paths, 2);
        for i_path = 1:num_paths
            inBetweenScore(paths{i_path}) = inBetweenScore(paths{i_path}) + 1 / num_paths;
            stressCentralityScore(paths{i_path}) = stressCentralityScore(paths{i_path}) + 1;
        end;
    end;
end;