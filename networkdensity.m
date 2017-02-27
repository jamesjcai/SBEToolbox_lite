function [kden]=networkdensity(sbeG)
K=num_edges(sbeG);
N=num_vertices(sbeG);

kden = K/((N^2-N)/2);