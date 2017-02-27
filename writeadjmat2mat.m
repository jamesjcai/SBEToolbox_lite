function writeadjmat2mat(sbeG,isascii,filename)

if nargin<2
    isascii=true;
end
if nargin < 3
    [F,P,I] = uiputfile( ...
       {'*.tab', 'Text (Tab delimited) (*.txt)';
        '*.csv', 'CSV (Comma delimited) (*.csv)';
        '*.*',  'All Files (*.*)'});
	if ~(F), return; end
	if (I==1)
		if (isempty(find(F=='.',1))),
    		F=[F,'.txt'];
		end
		delimiter = sprintf('\t');
	elseif (I==2)
		if (isempty(find(F=='.',1))),
        	F=[F,'.csv'];
		end
		delimiter = sprintf(',');
	end
   % [F,P]=uiputfile('*');
   filename = [P,F];
end


if isascii
    fid = fopen(filename,'wt');
    if fid == -1
       disp('Unable to open file.');
       return;
    end
    n=size(sbeG,1);
    for i=1:n
    for j=1:n    
        fprintf(fid,'%d%s',sbeG(i,j),delimiter);
    end
        fprintf(fid,'\n');
    end
    fclose(fid);
end