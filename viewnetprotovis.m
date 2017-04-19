function viewnetprotovis(sbeG,sbeNode,sbePartition)
%VIEWNETSVG - view network using SVG
% Syntax: viewnetsvg(sbeG,sbeNode)
% 
% Protovis is a visualization toolkit for JavaScript using SVG.

if nargin<3
    sbePartition=[];
end
cdsbe;
writesbe2protovis(sbeG,sbeNode,sbePartition,'addins/protovis/networkdata.js');
web('addins/protovis/output.html','-browser');