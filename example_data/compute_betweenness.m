% Filename: compute_betweenness.m
%
% Created by Patrycja Missiuro {patrycja@mit.edu}, Whitehead Institute,
% Date: March 2006
% Copyright: Massachusetts Institute of Technology / Whitehead Institute,
% Cambridge, MA
%
% Description:
% Top level script to compute betweenness.

% load the interactome matrix here, it should be symmetric across the
% diagonal, with 0s where there is no interaction and nonzeros where
% interaction occurs, the entries should be inversely
% proportional to the confidence score for interactions,

load('INTERACTOME_MATRIX_FILE.mat') % FILL in the name of your file containing interactions

% indicate the protein range you want to compute shortest paths for
index_from = 1;
index_to = size(Interactome_Matrix, 1) - 1;

% compute all the shortest paths between denoted pairs of nodes
[DistancesInteractome, ShortestPathsInteractome] = interactome_shortest_distances(Interactome_Matrix, index_from, index_to);

% accumulate all the paths to get inbetweenness, also gives you stress
% centrality score (less commonly used)
[inBetweenScore, stressCentralityScore] = inbetweenness(ShortestPathsInteractome, [index_from, index_to]);
