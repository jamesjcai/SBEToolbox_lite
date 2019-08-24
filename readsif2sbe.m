function [sbeG,sbeNode]=readsif2sbe(filename)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

sbeG=[]; sbeNode=[];
if nargin < 1
    [filename, pathname] = uigetfile( ...
       {'*.sif', 'SIF Files (*.sif)';
        '*.*',  'All Files (*.*)'}, ...
        'Pick an SIF file');
	if ~(filename), return; end
	filename=[pathname,filename];
end
[a,x,b]=textread(filename,'%s%s%s');
c=[a;b];

[sbeNode,z,x]=unique(c);
n=numel(sbeNode);
y=reshape(x,[numel(x)/2 2]);
%z=[x(1:numel(x)/2),x(numel(x)/2+1:end)];
%all(y==z);

sbeG=false(n);
for k=1:numel(x)/2
    sbeG(y(k,1),y(k,2))=true;
    sbeG(y(k,2),y(k,1))=true;
end
end