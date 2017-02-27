function [C]=delta_centrality(G,fhandle,showwaitbar)
%DELTA_CENTRALITY - delta centrality of nodes
%
% Delta centrality measures the importance of a node related to the ability
% of the network to respond to the deactivation of the node from the network.
%
%Also known as: INFORMATION_CENTRALITY

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

if nargin<3
    showwaitbar=false;
end
if nargin<2
    fhandle=@graph_efficiency;
end
if ischar(fhandle), fhandle=str2func(fhandle); end
if ~isa(fhandle,'function_handle')
    error('Requires function handle');
end

n=num_vertices(G);
%if ~issparse(G)
%   G=double(sparse(G));
%end
[xe0]=fhandle(G);
C=zeros(n,1);

if showwaitbar
     h = waitbar(0,'Please wait...');
else
     h = 0;
end
for k=1:n
    G2=G;
    G2(:,k)=0;
    G2(k,:)=0;
    xek=fhandle(G2);
    C(k)=(xe0-xek)/xe0;
    if h, waitbar(k/n,h); end
end
if h, close(h); end



