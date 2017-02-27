function [sbeG,sbeNode,idx]=extractnode(sbeG,sbeNode,nodeid,dcutoff,D)
% extractnode(nodeid,sbeG,distcutoff,D)

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

if ~issparse(sbeG), sbeG=sparse(sbeG); end
if nargin<5
    %[D]=all_shortest_paths(double(sparse(sbeG)));
    %D=shortest_paths(double(sparse(sbeG)),nodeid);
    D=shortest_paths(double(sbeG),nodeid);
end
if nargin<4, dcutoff=1; end

    idx=D>dcutoff;
    sbeG(:,idx)=[];
    sbeG(idx,:)=[];
    sbeG=full(sbeG);
    sbeNode=sbeNode(~idx);
    idx=~idx;
end










