function [b]=bridging_coefficient(G)

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

n=num_vertices(G);
b=zeros(n,1);

if ~islogical(G)
    G=logical(G);
end
d=sum(G);   % degree;

for k=1:n
    b(k)=(1./d(k))./sum(1./d(G(:,k)));
end






