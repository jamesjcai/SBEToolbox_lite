function [sbeG,sbeNode]=randnet_ph(v_deg)
% RANDNET_PH Generates a random graph using stickiness model Przulj & Higham (Gnp) graph
%
% V_DEG = list of degrees of N nodes
%
%REFENCE: doi: 10.1098/rsif.2006.0147
%J. R. Soc. Interface 2006 3, 711-716
%Natasa Przulj and Desmond J Higham
%Modelling protein-protein interaction networks via a stickiness index

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite
% Last revision: 7/12/2010

dgi=v_deg./sum(v_deg);
n=length(v_deg);
sbeG=false(n);
for i=1:n-1
for j=i+1:n
    if (rand<=dgi(i)*dgi(j))
	sbeG(i,j)=true;
    end
end
end
sbeG=sbeG|sbeG';
if (nargout>2)
	sbeNode=strread(num2str(1:size(sbeG,1)),'%s');
end
