function plotnet2kinds(sbeG, sbeNode, sbePartition, xy)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

if ~issparse(sbeG), sbeG = sparse(sbeG); end
if nargin < 2
    sbeNode = num2str((1:size(sbeG, 1))');
end
if nargin < 4
    %xy=random_graph_layout(sbeG);
    xy = fruchterman_reingold_force_directed_layout(double(sbeG), 'iterations', 100);
end


gplot(sbeG, xy);
hold on;
%plot(xy(:,1), xy(:,2),'r.','MarkerSize',24); hold off;
plot(xy(sbePartition, 1), xy(sbePartition, 2), 'r.');
plot(xy(~sbePartition, 1), xy(~sbePartition, 2), 'g.');

text(xy(:, 1)+0.1, xy(:, 2)+0.1, sbeNode);

set(gcf, 'Color', [1, 1, 1]);
set(gca, 'XTick', []);
set(gca, 'YTick', []);
%xlim([-1,10]);
%ylim([-2,7]);
axis off;
end
