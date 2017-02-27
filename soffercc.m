function [cv]=soffercc(G,v)
% SOFFERCC - Clustering coefficient of Node v
%
% Soffer SN, V�zquez A: Network clustering coefficient without
% degreecorrelation biases. Physical Review E 2005, 71(5):57101.

if nargin<2
    %error('Two parameters needed.')
    v=1:size(G,1);
end

cv=zeros(length(v),1);
d=sum(G);


for k=1:length(v)

    n=v(k);
    
    i_neib=G(:,n);
    c1=sum(sum(G(i_neib,i_neib)))/2; 

    d_neib=d(i_neib);
    d_node=d(n);
    dv=min(d_node,d_neib)-1;
    dv=sort(dv,'descend');

    %c1
    %dv

    m=length(dv);
    s=0;
        for i=1:m-1
        for j=i+1:m
            if dv(i)>0&&dv(j)>0
                s=s+1;
            end
            dv(i)=dv(i)-1;
            dv(j)=dv(j)-1;
        end
        end
        %s
    cv(k)=c1./s;
end





