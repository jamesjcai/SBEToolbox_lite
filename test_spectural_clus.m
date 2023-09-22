X = load('example_data\graph.data');

%%
c = sbe_spectral_cluster(sbe_affinity_matrix(pdist2(X, X)));
% figure; i_myscatter(X,c,2)   % function in scGEAToolbox
figure; gscatter(X(:, 1), X(:, 2), c)
