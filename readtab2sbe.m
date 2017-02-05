function [sbeG,sbeNode]=readtab2sbe(filename,usenodenum,casesensitive)
%READTAB2SBE - reads Tab delimited file
%
% [sbeG,sbeNode]=readtab2sbe(filename,usenodenum)

sbeG=[]; sbeNode=[];

if nargin<3
    casesensitive = false;
end
if nargin<2
    usenodenum = false;
end
if nargin < 1
    [filename, pathname] = uigetfile( ...
       {'*.tab;*.txt', 'Tab Separated Text Files (*.tab, *.txt)';
        '*.*',  'All Files (*.*)'}, ...
        'Pick a Text file');
	if ~(filename), return; end
	filename=[pathname,filename];
end

if ~usenodenum
    [a,b]=textread(filename,'%s%s','delimiter','\t');
    c=upper([a;b]);
    if ~casesensitive
        c=upper(c);
    end
    
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
else
    [a,b]=textread(filename,'%d%d','delimiter','\t');
    c=[a;b];
    n=max(c(:));
    if min(c)~=1
        error('Node label should start from 1')
    end
    
    sbeG=false(n);
    for k=1:length(a)
        sbeG(a(k),b(k))=true;
        sbeG(b(k),a(k))=true;
    end
end
end
