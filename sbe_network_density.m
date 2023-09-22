function [d] = sbe_network_density(sbeG)
% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

k = num_edges(sbeG);
n = num_vertices(sbeG);
d = 2 * k / (n.^2 - n);
