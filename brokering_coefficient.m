function [b]=brokering_coefficient(G)

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010


n=num_vertices(G);
data1=sum(G,2);
data1=data1./(n-1);
%data1=zscore(data1);


if ~issparse(G), G=sparse(G); end
if ~isa(G,'double'), G=double(G); end
data2=clustering_coefficients(G);

b=log(data1+1)-log(data2+1);





