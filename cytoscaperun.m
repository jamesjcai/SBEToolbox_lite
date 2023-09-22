function cytoscaperun(sbeG, sbeNode)
%CYTOSCAPERUN - view network using CytoScape
%
% Syntax: cytoscaperun(sbeG,sbeNode)
%
% Cytoscape is an open source bioinformatics software platform for
% visualizing molecular interaction networks and integrating these
% interactions with gene expression profiles and other state data.

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

[exedir, dlgshown] = pge_getprgmdir(sprintf('%s_prgmdir', mfilename));
if isempty(exedir) || dlgshown, return; end

oldpath = pwd;
cd(exedir);
writesbe2sif(sbeG, sbeNode, 'input.sif');
system('java -Xmx512M -jar cytoscape.jar --network input.sif -p plugins &');
cd(oldpath);