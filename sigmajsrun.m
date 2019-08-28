function url = sigmajsrun(sbeG,sbeNode,xy)
%SIGMAJSRUN - view network using sigma.js
% Syntax: sigmajsrun(sbeG,sbeNode)
% 
% Protovis is a visualization toolkit for JavaScript using SVG.
%
% Systems Biology and Evolution Toolbox (SBEToolbox).
% Authors: James Cai, Kranti Konganti.
% (C) Texas A&M University.
%
% $LastChangedDate: 2013-07-18 14:24:01 -0500 (Thu, 18 Jul 2013) $
% $LastChangedRevision: 749 $
% $LastChangedBy: konganti $
%
input_file = 'addins/sigmajs/input.xml';

if ~issymnet(sbeG)
    [sbeG]=sbe_symmetrize_adjacency(sbeG);
end

writesbe2xml(sbeG,sbeNode,input_file,xy)

%d = dir(sigmajs_html_loc);
str = {'curve_edges', 'fisheye', 'force_atlas2', 'hide_non_neighbor', ...
    'highlight_neighbor'};


[s,v] = listdlg('PromptString','Select a template file:',...
                'SelectionMode','single',...
                'ListString',str);
if v==1
    url = strcat('addins/sigmajs/', strcat(str{s}, '.html'));
    web(url);
else
    url = '';
    return;
end




