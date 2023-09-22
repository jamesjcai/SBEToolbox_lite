function [res] = eccentricity_centrality(G)
%ECCENTRICITY_CENTRALITY - eccentricity centrality
%
% The eccentricity of a vertex j is the maximum of its finite distances to
% all other vertices, i.e. ecc(j) = max(dij). Computationally, ecc(j) is
% the maximum of each row of D(G). If all other vertices can be reached
% from j, then ecc(j) is the maximum number of steps needed to reach all of
% them. The radius of a digraph is the minimum eccentricity of all its
% vertices, radius(G) = min(ecc(j)). The diameter of a digraph is the
% maximum eccentricity, diameter(G) = max(ecc(j)).
%
% See Also: GRAPH_DIAMETER

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

if ~issparse(G)
    G = double(sparse(G));
end
[D] = all_shortest_paths(G);
res = max(D, [], 1);

%ecc=max(D,[],1);
%diam=max(ecc);
%radi=min(ecc);
