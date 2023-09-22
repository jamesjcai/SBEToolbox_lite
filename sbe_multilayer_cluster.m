function [C] = sbe_multilayer_cluster(A, k)
% sbe_multilayer_cluster;
% Clustering on Multi-Layer Graphs via Subspace Analysis on Grassmann Manifolds
% Xiaowen Dong, Pascal Frossard, Pierre Vandergheynst, Nikolai Nefedov
% https://arxiv.org/abs/1303.2221

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

if nargin < 2
    k = 10;
end

a = 0.5; % regularization paprameter
opts.tol = 1e-2;

Lx = zeros(size(A{1}));
Vx = zeros(size(A{1}));

for t = 1:length(A)
    [~, L] = sbe_laplacian_matrix(A{t});
    [V, ~] = eigs(L, k, 'sr', opts); % U'*U=I
    V = V ./ vecnorm(V, 2, 2);
    Lx = Lx + L;
    Vx = Vx + a * (V * V');
end

Lmod = Lx - Vx;
[Vmod, ~] = eigs(Lmod, k, 'sr', opts);
Vmod = Vmod ./ vecnorm(Vmod, 2, 2);
[C] = kmeans(Vmod, k);
