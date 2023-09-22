function [sbeG, idx] = extractedge(node1, node2, sbeG, distcutoff)
% [sbeG,idx]=extractedge(node1,node2,sbeG,distcutoff)

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

%[D]=all_shortest_paths(double(sparse(sbeG)));
D1 = shortest_paths(double(sparse(sbeG)), node1);
D2 = shortest_paths(double(sparse(sbeG)), node2);

if nargin < 4, distcutoff = 1; end
idx1 = (D1 <= distcutoff);
idx2 = (D2 <= distcutoff);
idx = idx1 | idx2;
sbeG(:, ~idx) = [];
sbeG(~idx, :) = [];
