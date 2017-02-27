function [bc,b,c]=bridging_centrality(G)

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

if ~issparse(G), G=sparse(G); end
if ~isa(G,'double'), G=double(G); end

[b]=betweenness_centrality(G);
n=num_vertices(G);
%x=2*nchoosek(n-1,2); %b=b./x;
b=b./((n-1)*(n-2));
[c]=bridging_coefficient(G);

bc=b.*c;
