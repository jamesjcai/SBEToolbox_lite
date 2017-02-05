function [out]=closeness_centrality(sbeG)
%
%Syntax: [out]=closeness_centrality(sbeG)
%
%Freeman, L.C., 1979. Centrality in networks: I. Conceptual clarification.
%Social Networks 1, 215–239.

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

n=num_vertices(sbeG);
if ~issparse(sbeG)
    sbeG=double(sparse(sbeG));
end
[D]=all_shortest_paths(sbeG);
out=(n-1)./sum(D,2);

% http://www.biomedcentral.com/1471-2105/8/153
% http://dx.doi.org/10.1016/j.socnet.2004.02.001
% http://www.plosone.org/article/info:doi/10.1371/journal.pone.0001049
