function [p]=participation_coefficient(G,s)
%PARTICIPCOEF - participation coefficient.
%
% [p]=participcoef(G,s)
%ref: http://www.nature.com/nature/journal/v433/n7028/full/nature03288.html
%
% See also: WITHIN_MODULE_DEGREE

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

n=num_vertices(G);
p=zeros(n,1);
for k=1:n    
    kv=s(G(k,:));
    p(k)=1-sum((grpstats(kv,kv,'numel')./length(kv)).^2);
end