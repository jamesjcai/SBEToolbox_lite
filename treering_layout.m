function [xy]=treering_layout(G,n_center)

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

%format compact
%format long e

n=num_vertices(G);
if nargin<2
    n_center=5;
end
if ~(n_center>0&&n_center<=n)
    error('N_CENTER needs to be >=1 and <=N')
end

degree_k=sum(G,2);
[~,y]=sort(degree_k);
idx=y(end-n_center+1:end);  % top 5
xy=zeros(n,2);

n1=length(G)-n_center+1;
theta = linspace(0,2*pi,n1);
xy1 = zeros(n1,2);
x = 2*cos(theta);
y = 2*sin(theta);
xy1(1:n1,1) = x(1:n1);
xy1(1:n1,2) = y(1:n1);
xy1(end,:)=[];

n2=n_center+1;
theta = linspace(0,2*pi,n2);
xy2 = zeros(n2,2);
x = cos(theta);
y = sin(theta);
xy2(1:n2,1) = x(1:n2);
xy2(1:n2,2) = y(1:n2);
xy2(end,:)=[];

idx2=setdiff(1:n,idx);
xy(idx,:)=xy2;
xy(idx2,:)=xy1;

