function writeattribute2tab(data,nodename,filename,format)
%WRITEATTRIBUTE2TAB - Writes data in tabular form to the file system.


if nargin < 4
   format = '%f';
end
if nargin < 3 || isempty(filename)
    [F,P,I] = uiputfile( ...
       {'*.txt', 'Text (Tab delimited) (*.txt)';
        '*.csv', 'CSV (Comma delimited) (*.csv)';
        '*.*',  'All Files (*.*)'});
	if ~(F), return; end

	if (I==1)
		if (isempty(find(F=='.'))),
		F=[F,'.txt'];
		end
		delimiter = sprintf('\t');
	elseif (I==2)
		if (isempty(find(F=='.'))),
		F=[F,'.csv'];
		end
		delimiter = sprintf(',');
	end
   filename = [P,F];
end

fid = fopen(filename,'wt');
if fid == -1
   disp('Unable to open file.');
   return
end
fformat=['%s\t',format,'\n'];
for k=1:length(data)    
    fprintf(fid,fformat,nodename{k},data(k));
end
fclose(fid);
