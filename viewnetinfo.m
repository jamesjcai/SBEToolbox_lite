function viewnetinfo(sbeG, sbeNode)
%fprintf('Number of nodes: %d\n',num_vertices(sbeG));
%fprintf('Number of edges: %d\n',num_edges(sbeG)/2);
fprintf('Number of nodes: %d\n', size(sbeG, 1));
fprintf('Number of edges: %d\n', int32(nnz(sbeG)/2));

%fprintf('Is symmetric: %d\n',issymnet(sbeG));
%fprintf('Is simple: %d\n',issimple(sbeG));

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite