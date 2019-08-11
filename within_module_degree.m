function [d]=within_module_degree(G,s,isnormalized)
%WITHIN_MODULE_DEGREE - within module degree
%
% [d]=within_module_degree(G,s,isnormalized)
% 
%ref: http://www.nature.com/nature/journal/v433/n7028/full/nature03288.html
% See also: PARTICIPATION_COEFFICIENT

if nargin<3
    isnormalized=true;
end
xs=unique(s);
n=num_vertices(G);
d=zeros(n,1);
for k=1:length(xs)
    i=find(s==xs(k));
    di=sum(G(i,i));
    if isnormalized
        d(i)=zscore(di);
    else
        d(i)=di;
    end
end