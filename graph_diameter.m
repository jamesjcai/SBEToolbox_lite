function [Diam,Rad,Pv,Cv]=graph_diameter(G)
% A graph's diameter is the largest number of vertices which must be traversed in order to travel from one vertex to another when paths which backtrack, detour, or loop are excluded from consideration.
%
% DIAM  - the diameter
% RAD   - the radius

if ~issparse(G)
    G=double(sparse(G));
end
[D]=all_shortest_paths(G);
Ec=max(D); % the eccentricity of all vertexes
Diam=max(D(:));
if nargout>1
    Rad=min(D(:));
end
if nargout>2
    Pv=find(Ec==Diam); % the periphery vertexes of the graph
    Cv=find(Ec==Rad);  % the center vertexes of the graph
end