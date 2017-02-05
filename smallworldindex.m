function [swidx]=smallworldindex(G1)

[kden]=networkdensity(G1);
G2=randnet_er(num_vertices(G1),kden/2);

G1=double(sparse(G1));
G2=double(sparse(G2));

cc1=clustering_coefficients(G1);
cc2=clustering_coefficients(G2);

% we define the characteristic path length ?(G) of a graph as the global
% mean of the finite entries of its distance matrix. Thus, the
% characteristic path length constitutes a measure of central tendency of
% D(G).

D1=all_shortest_paths(G1);
D2=all_shortest_paths(G2);
dd1=mean(D1(:));
dd2=mean(D2(:));

swidx=(mean(cc1)./mean(cc2))./(dd1./dd2);

%Humphries et al