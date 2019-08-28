function [W]=sbe_normalize_adjacency(W,varargin)

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

p = inputParser;
defaultType = 'JW02';
validTypes = {'JW02','SM00'};
checkType = @(x) any(validatestring(x,validTypes));

addRequired(p,'W',@isnumeric);
addOptional(p,'type',defaultType,checkType)
parse(p,W,varargin{:})

degs=sum(W,2);
switch p.Results.type
    case 'JW02'
        D=diag(degs.^-0.5);
        W=D*W*D;
    case 'SM00'
        D=diag(1./degs);
        W=D*W;
end

% ref: https://github.com/areslp/matlab/blob/master/spectual_clustering/SpectralClustering.m
% https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000641
