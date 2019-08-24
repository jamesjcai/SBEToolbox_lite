function [c1,c2]=graph_clustercoeff(G)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

if ~issparse(G)
    Gx=sparse(G);
end
if ~isa(Gx,'double')
    Gx=double(Gx);
end

data=clustering_coefficients(Gx);
c1=nanmean(data);
if nargout>1
    c2=i_method2(G);
end


function C2=i_method2(G)
n=length(G);
CX=0;
CY=0;
for u=1:n
    V=find(G(u,:));
    k=length(V);
    if k>=2;                %degree must be at least 2
        S=G(V,V);
        CX=CX+sum(S(:));
        CY=CY+(k^2-k);
    end
end
C2=CX/CY;