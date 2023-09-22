function A = sbe_affinity_matrix(X, methodid)
if nargin < 2
    methodid = 1;
end
switch methodid
    case 1
        % from PHATE/MAGIC
        A = full(compute_alpha_kernel_sparse(X));
    case 2
        % from PHATE/MAGIC
        A = full(compute_kernel_sparse(X));
    case 3
        % from Symmetric Nonnegative Matrix Factorization for Graph Clustering
        D = pdist2(X, X);
        A = scale_dist3(D, 7);
    case 4
        % from Symmetric Nonnegative Matrix Factorization for Graph Clustering
        D = pdist2(X, X);
        kn = floor(log2(size(X, 1))) + 1;
        A = scale_dist3_knn(D, 7, kn, false);
end
A = A - diag(diag(A));
