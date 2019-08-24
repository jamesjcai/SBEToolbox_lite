function [isit] = issimple(adj)
%ISSIMPLE Checks whether a graph is simple (no self-loops, no double edges)
% Gergana Bounova, February 20, 2006
%
% INPUTs: adj - adjacency matrix
% OUTPUTs: isit - a Boolean variable

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

isit = true;

% check for self-loops
self_loops = find(diag(adj)>0);
if not(isempty(self_loops))
  fprintf('graph has self loops\n');
  isit = false;
  return
end

% check for double edges
double_edges = find(adj>1);
if not(isempty(double_edges))
  fprintf('graph has double edges\n');
  isit = false;
  return
end