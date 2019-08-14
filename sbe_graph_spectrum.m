function s=sbe_graph_spectrum(adj)

[~,D]=eig(sbe_laplacian_matrix(adj));
s=sort(diag(D),'descend');

%##################################################################
% The eigenvalues of the Laplacian of the graph.
%
% INPUTs: adjacency matrix, nxn
% OUTPUTs: laplacian eigenvalues, sorted
%
% Other routines used: laplacianMatrix.m
% GB: last updated, Oct 10 2012
%##################################################################

