function viewnetsvg(sbeG,sbeNode,sbePartition)
%VIEWNETSVG - view network using SVG
% Syntax: viewnetsvg(sbeG,sbeNode)
% 
% Protovis is a visualization toolkit for JavaScript using SVG.

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

if nargin<3
    sbePartition=[];
end
cdsbe;
writesbe2protovis(sbeG,sbeNode,sbePartition,'addins/protovis/networkdata.js');
web('addins/protovis/output.html','-browser');