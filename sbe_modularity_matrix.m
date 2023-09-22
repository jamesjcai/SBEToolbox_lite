function B = sbe_modularity_matrix(A, gammav)
% MODMAT - Modularity matrix for undirected graph
%
%   B = modmat(G) find modularity matrix of the undirected graph. Each
%   element in the matrix is defined as:
%
%                  k_i * k_j
%   b_ij = A_ij - -----------
%                    2 * m
%
%   k_i, k_j: vertices degree of i and j
%   A_ij: adjacency, 1 if node i and node j are conected, 0 otherwise
%   m: the total number of edges
%
%   B = modmat(G, ng) incremental modularity matrix of subgroup of nodes ng
%
% Example:
%   G = set(G, 'directed', 0); % convert to undirected graph
%   G = simple(G); % convert to simple graph
%   q = modmat(G)
%
% Example:
%   % binary spectral partitioning
%   mod = modmat(G);
%   [v, e] = eig(mod);
%   d = []; for k = 1:size(G,1), d(k) = e(k,k); end  % take diagonal
%   [maxeig, maxeigidx] = max(d);
%   s = sign(v(:,maxeigidx)); % partitioning vector into two groups
%   q = modularity(G, s); % calculate modularity matrix
%   G = set(G, 'nodecolor', s); % change node color according to grouping
%   plot(G)
%
%
% See also SPECBIPART, MODULARITY, SIMPLE.

%
% Ref: M. E. Newman, PNAS 2006

% Modularity and community structure in networks
% by: M. E. J. Newman
% (17 Feb 2006)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite


if nargin < 2
    gammav = 1;
end
deg = sum(A, 1);
m = sum(deg);
B = A - (gammav * (deg' * deg)) / m;
