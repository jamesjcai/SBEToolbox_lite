function [c,cn]=order2cc(G,v)
%  Clustering coefficient of Node v
%
% See also: SOFFERCC

if nargin<2    
    v=1:size(G,1);
end

c=zeros(length(v),1);
cn=zeros(length(v),1);

G2=double(sparse(G));

for k=1:length(v)
    n=v(k);
    D=shortest_paths(G2,n);
    i_neib=D<=2&D>0; %G(:,n)&(D<=2);
    c1=sum(sum(G(i_neib,i_neib)))/2;
    cn(k)=c1;
    x=sum(i_neib);
    x=x*(x-1)/2;
    c(k)=c1./x;
end

