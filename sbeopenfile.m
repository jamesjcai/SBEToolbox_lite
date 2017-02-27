function [sbeG,sbeNode]=sbeopenfile(filename,formatid)
%SBEOPENFILE - Open sequence file

% Population Genetics & Evolution Toolbox, (C) 2007
% Author: James J. Cai
% Email: jamescai@stanford.edu
% Website: http://bioinformatics.org/pgetoolbox/
% Last revision: 2/23/2007

 sbeG=[];
 sbeNode=[];
if nargin < 1
    [filename,pathname,filterindex] = uigetfile( ...
       {'*.txt;*.tab;*.tgf', 'Text Files (*.txt, *.tab, *.tgf)'; 
        '*.sif', 'SIF Files (*.sif)';
        '*.mat', 'MAT-file (*.mat)';        
        '*.*',  'All Files (*.*)'}, ...
        'Open a file');
	
	if (filterindex==4),
	      formatid=i_ask4formatid;
	else
	      formatid=filterindex;
	end

	if (formatid==4), return; end

	if isequal(filename,0) | isequal(pathname,0)
		return;
	else
		filename=fullfile(pathname,filename); 
	end
end

disp(['Reading ',filename]);
switch (formatid)
    case (1)
	 [sbeG,sbeNode]=readtab2sbe(filename);
    case (2)
     [sbeG,sbeNode]=readsif2sbe(filename);
    case (3)
     load(filename,'sbeG','sbeNode');
     return;
    case (4)
      disp('unknonw');
end




function [id] = i_ask4formatid()

	ButtonName=questdlg('What kind of file format?', ...
			    'Select sequence format', ...
			    'TEXT','SIF','MAT','Others');
	switch ButtonName,
	    case 'TEXT', 
		id=1;          
	    case 'SIF'
		id=2;    
	    case 'MAT'
		id=3;        
	    otherwise
		id=4;
	end

