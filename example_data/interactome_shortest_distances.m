function [ShortestDists,ShortestPaths] = interactome_shortest_distances(InterProteinDists,index_from, index_to)
% interactome_shortest_distances.m
%
% Created by Patrycja Missiuro {patrycja@mit.edu}, Whitehead Institute, 
% Date: March 2006
% Copyright: Massachusetts Institute of Technology / Whitehead Institute,
% Cambridge, MA
% Input:
% InterProteinDists: a matrix with distances between nodes, 0s at the diagonal,
% and nonzeros where two nodes are directly linked, 
% Output: 
% matrix ShortestDists: upper triangular 0s at the
% diagonal, and i,j represent the
% distance between any 2 nodes in a protein network. If nodes are not
% connected at all, distance is Inf, in order to fetch data, we makes sure
% i < j

% initialize the matrix with zeros everywhere below and on the diagonal and
% with Infs above the diagonal
ShortestDists = triu(inf(size(InterProteinDists)),1);
% this is a cellarray of cellarrays
ShortestPaths = {};
% iterate over all the members and resub
for node_num = index_from:index_to %1:size(InterProteinDists,1)-1
    [dists, PathsWithNodeNum] = dijkstra_multipath_explore(node_num,InterProteinDists);
    ShortestDists(node_num,:) = dists';
    % paths do not include start and goal node, so there may not be any
    % paths specified if link is direct, or if there is no path
    ShortestPaths(node_num,:) = PathsWithNodeNum;
end;
