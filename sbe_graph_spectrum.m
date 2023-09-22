function d = sbe_graph_spectrum(A)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

[~, D] = eig(sbe_laplacian_matrix(A));
d = sort(diag(D), 'descend');

%##################################################################
% The eigenvalues of the Laplacian of the graph.
%
% INPUTs: adjacency matrix, nxn
% OUTPUTs: laplacian eigenvalues, sorted
%
% Other routines used: laplacianMatrix.m
% GB: last updated, Oct 10 2012
%##################################################################
