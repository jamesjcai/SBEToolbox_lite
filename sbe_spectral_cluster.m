function [C]=sbe_spectral_cluster(A,k)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

if nargin<2
    k=3;
end

diff=eps;

[~,L]=sbe_laplacian_matrix(A);

[V,~]=eigs(L,3,diff);    % diff = Sigma Value Near Eigenvalue
% opts.tol = 1e-2;
%[V,~]=eigs(L,k,'sr',opts);
%[V,~]=eigs(L,k,'sm',opts);
%[uN,sN,vN] = svd(L); V = vN(:,N-n+1:N);

% in case of the Jordan-Weiss algorithm, we need to normalize
% the eigenvectors row-wise
% V = bsxfun(@rdivide, V, sqrt(sum(V.^2, 2)));

V=V./vecnorm(V,2,2);

%     %% 4. Form Y by renormalizing X
%     Y = zeros(size(X));
%     for i=1:n
%         denominator = norm(X(i,:));
%         for j=1:k
%             Y(i,j) = X(i,j)/denominator;
%         end
%     end

% for i = 1:N
%     kerNS(i,:) = kerN(i,:) ./ norm(kerN(i,:)+eps);
% end

% now use the k-means algorithm to cluster U row-wise
% C will be a n-by-1 matrix containing the cluster number for
% each data point
C = kmeans(V, k, 'start', 'cluster', ...
                 'EmptyAction', 'singleton');
             
             
% https://github.com/RameshOswal/ABR-HW-6/blob/master/Q1/SpectralClustering.m
% https://github.com/xiongxoy/ISIMA-Spectral-Clustering/blob/a94f9c2063fef475695870ee6194d542b3769c21/spectral_clustering.m
% https://www.mathworks.com/matlabcentral/fileexchange/34412-fast-and-efficient-spectral-clustering

% https://github.com/joshuaas/SM2SC/blob/master/SpectralClustering.m
% DN = diag( 1./sqrt(sum(CKSym)+eps) );
% LapN = speye(N) - DN * CKSym * DN;
% [uN,sN,vN] = svd(LapN);
% kerN = vN(:,N-n+1:N);
% for i = 1:N
%     kerNS(i,:) = kerN(i,:) ./ norm(kerN(i,:)+eps);
% end

% groups = kmeans(kerNS,n,'maxiter',MAXiter,'replicates',REPlic,'emptyaction','singleton'); 

% https://github.com/eeGuoJun/AAAI2019_APMC/blob/1a74556de90e34e46f6670ac3ca98e3ad937fa71/JunGuo_AAAI_2019_APMC_code/files/SpectralClustering.m

