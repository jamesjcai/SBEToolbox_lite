function [sbeG,sbeNode]=randnet_er(n,p)
% RANDNET_ER Generates a random Erdos-Reyni (Gnp) graph
%
% A=randnet_er(n,p) generates a random Gnp graph with n vertices and where
% the probability of each edge is p.  The resulting graph is symmetric.
%
% This function is different from the Boost Graph library version, it was
% reimplemented natively in Matlab.
%
% Example:
%   A = randnet_erdosreyni(100,0.05);
% See Also: erdos_reyni

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

%%
sbeG=triu(rand(n)<p,1);
%A = sparse(A);
sbeG=sbeG|sbeG';
sbeNode=strread(num2str(1:size(sbeG,1)),'%s');

%for k=1:n, sbeNode{k}=sprintf('Node%d',k); end
%if nargin<1 n=10; end
%a=rand(n)>=0.8;
%G=triu(a,1)+triu(a,1)';