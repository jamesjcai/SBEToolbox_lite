function dispadjmat(sbeG)

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

n=size(sbeG,1);
for k=1:n
    fprintf('%d',sbeG(k,:));
    fprintf('\n');
end
imagesc(sbeG)
axis square
colormap copper
