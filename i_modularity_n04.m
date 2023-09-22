function q = modularity_n04(G, s)
q = modularity_ws05(G, s);

%http://prola.aps.org/pdf/PRE/v69/i6/e066133
%Fast algorithm for detecting community structure in networks
% PHYSICAL REVIEW E 69, 066133 (2004)

%A number of alternative heuristic methods have been
%investigated, such as greedy algorithms (n04) and extremal optimization
%(da05)

%This method is also called Newman's agglometrative clusering algotithm

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite