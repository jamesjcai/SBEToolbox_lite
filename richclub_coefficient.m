function [t]=richclub_coefficient(G,k)
%RICHCLUBCOEF - computes rich-club coefficient
%
% t(k) = 2*Ek/(Nk*(Nk-1)), where 
% Ek the number of edges among the Nk nodes haveing degreee higher than a
% given value k.
%
% REF: Colizza et al. Nature Physicas 2006
% http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0000335#s2

t=nan(1,length(k));
vect_k=sum(G);

for x=1:length(k)
    idx=vect_k>k(x);
    G2=G(idx,idx);
    [Nk]=size(G2,1);
    Ek=0.5*sum(G2(:));
    t(x)=2*Ek/(Nk*(Nk-1));
end
