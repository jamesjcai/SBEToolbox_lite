function kcore
% SEE ALSO: excessretention
%
%k-core analysis is an iterative process in which the nodes are removed
%from the graphs in order of least connected (Wuchty and Almaas, 2005).
%More specifically, for each iteration of k, given the network from the
%previous iteration, genes with less than k connections are removed from
%the graph. This will result in a series of subgraphs that gradually reveal
%the globally central region of the original network.
%
%Wuchty, S. and Almaas, E. (2005) Peeling the yeast protein network.
%Proteomics, 5, 444–449

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite





