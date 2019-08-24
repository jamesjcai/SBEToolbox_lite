function [kden]=networkdensity(sbeG)
% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

K=num_edges(sbeG);
N=num_vertices(sbeG);

kden = K/((N^2-N)/2);