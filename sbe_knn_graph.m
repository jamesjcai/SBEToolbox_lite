function [W] = sbe_knn_graph(X, k)
if nargin < 2, k = 3; end
W = createKnnGraph(knnsearch_same(X', k));
W = full(W);