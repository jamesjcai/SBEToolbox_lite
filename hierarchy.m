function h = hierarchy(G)
% HIERARCHY - Degree of hierarchy
%
%   h = hierarchy(G) find degree of hierarchy, which measure normalized
%   coorlation between vertex degree of adjacent nodes
%
% Graph is assumed as undirected.

if directed(G)
    error('Graph must be undirected.');
end
B = modularity_matrix(G);
deg = degree(G);
m = sum(deg)/2; % number of edges
% n = size(G,1);
% x = deg' - 2*m/n; % normalize
x = sqrt(length(deg)) * deg' / sqrt(deg * deg');
% x = deg' / sqrt(deg * deg');
h = x' * B * x / (2*m);

% adj = adjacency(G);
% deg = degree(G);
% m = sum(deg);
% t1 = deg * adj * deg';
% t2 = sum(deg * adj);
% h = t1 / m - (t2 / m)^2;
% h = full(h); % just convert to full matrix, though h is scaler

