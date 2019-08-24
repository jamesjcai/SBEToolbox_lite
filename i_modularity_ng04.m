function q=modularity_ng04(G,s)

q = modularity_ws05(G, s);

%http://prola.aps.org/pdf/PRE/v69/i2/e026113
%Finding and evaluating community structure in networks
%M. E. J. Newman1,2 and M. Girvan2,3
%PHYSICAL REVIEW E 69, 026113 ~2004!


%same to:
%http://prola.aps.org/pdf/PRE/v69/i6/e066133
%Fast algorithm for detecting community structure in networks
% PHYSICAL REVIEW E 69, 066133 (2004)


% To quantify network modulairty a measure baed on the approach of Newman
% and Girvan (ng04 and n04) was used. Briefly, the Newman and Girvan
% algorithm finds the division of the nodes into modules that maximizeds a
% measure Q. This measure is defined by the fraction of the dedgees in the
% network that connect between nodes in a module minus the expected value
% of the same quantity in a network with the sae assignment of nodes into
% modules but random connections between the nodes.

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite