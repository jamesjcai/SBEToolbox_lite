function writesbe2pajek(sbeG,sbeNode,sbePartition,saveaspaj,filename)
% writesbe2pajek(sbeG,sbeNode,sbePartition,saveaspaj,filename)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

if nargin < 5
    if saveaspaj
       [filename, pathname,filterindex] = uiputfile( ...
       {'*.paj', 'Pajek Project Files (*.paj)';
        '*.*',  'All Files (*.*)'}, ...
        'Save as');
        if ~(filename), return; end
        filename=[pathname,filename];
        if filterindex==1
            if ~(strfind(filename,'.')>1)
                filename=[filename,'.paj'];
            end
        end        
    else
        [filename, pathname,filterindex] = uiputfile( ...
           {'*.net', 'Pajek Format Files (*.net)';
            '*.*',  'All Files (*.*)'}, ...
            'Save as');
        if ~(filename), return; end
        filename=[pathname,filename];
        if filterindex==1
            if ~(strfind(filename,'.')>1)
                filename=[filename,'.net'];
            end
        end
    end
end
if nargin<4, saveaspaj=1; end
if nargin<3, sbePartition=[]; end

  
%adj2pajek2(sbeG,filename,'nodeNames',sbeNode,'partition',sbePartition);

n=num_vertices(sbeG);
if nargin<2, sbeNode=num2cellstr([1:n]); end


fid = fopen(filename,'wt','native'); 
if saveaspaj, fprintf(fid,'*Network %s\n',filename); end

fprintf(fid,'*Vertices  %6i\n',n);
for i=1:n
  %fprintf(fid,'%3i %s %s\n', i, sbeNode{i}, 'ellipse');
  fprintf(fid,'%5d %s %s\n', i, sbeNode{i}, 'ellipse');
end

fprintf(fid,'*Edges\n');
%fprintf(fid,'*Arcs\n'); % directed
for i=1:n
  for j=1:n
    if sbeG(i,j)
      %fprintf(fid,' %4i   %4i   %2i\n',i,j,sbeG(i,j));
       fprintf(fid,' %5d   %5d 1\n',i,j);      
    end
  end
end

if ~isempty(sbePartition)
    if saveaspaj,
        fid2=fid;
        fprintf(fid2,'*Partition %s.clu\n',filename(1:end-4));
    else
        fid2 = fopen(sprintf('%s.clu', filename(1:end-4)),'wt','native'); 
    end
  fprintf(fid2,'*Vertices  %6i\n',n);
  for i=1:n, fprintf(fid2, '%d\n', sbePartition(i)); end
  if ~saveaspaj, fclose(fid2); end
end
fclose(fid);
end



