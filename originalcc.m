function [c]=originalcc(G,n)
%  Clustering coefficient of Node n
%
%
% See also: SOFFERCC

if nargin<2
    %error('Two parameters needed.')
    v=1:size(G,1);
end

c=zeros(length(v),1);

for k=1:length(v)
    n=v(k);
    i_neib=G(:,n);
    c1=sum(sum(G(i_neib,i_neib)))/2; 
    x=sum(i_neib);
    x=x*(x-1)/2;
    c(k)=c1./x;
end





