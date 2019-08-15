function [simMatrix]=sbe_localsim(A,varargin)
% local-information-based similarities
% nine well-known local measures
% framework of link prediction on the basis of node similarity
% ref: Tao Zhou et al.: Predicting Missing Links via Local Information
% https://arxiv.org/abs/0901.0553

p = inputParser;
defaultType = 'ra';
validTypes = {'cn','st','jc','aa','ra'};
checkType = @(x) any(validatestring(x,validTypes));

addRequired(p,'A',@isnumeric);
addOptional(p,'type',defaultType,checkType)
parse(p,A,varargin{:})
   
switch p.Results.type
    case {'cn','commonneighbors'}
        simMatrix=squareform(pdist(A,@(x,y)sum(x&y,2)));
    case {'st','Salton'}
        % Salton index is also called cosine similarity in the literature
        simMatrix=squareform(pdist(A,@(x,y)sum(x&y,2)));
        degs=sum(A);
        simMatrix=simMatrix./sqrt(degs'*degs);
    case {'jc','Jaccard'}
        % Salton index is also called cosine similarity in the literature
        simMatrix=pdist(A,@(x,y)sum(x&y,2));
        M=pdist(A,@(x,y)sum(x|y,2));
        simMatrix=simMatrix./M;
        simMatrix=squareform(simMatrix);
        simMatrix=simMatrix-diag(diag(simMatrix));
    case {'ss','Sorensen'}
        simMatrix=squareform(pdist(A,@(x,y)sum(x&y,2)));
        degs=sum(A);
        simMatrix=2*simMatrix./(degs'+degs);
    case {'aa','Adamic-Adar'}
        % https://stackoverflow.com/questions/38686462/matlab-fast-calculation-of-adamic-adar-score
        [R,C] = find(triu(A*A.'>0,1));
        degs=sum(A);
        vals = sum(1./log(bsxfun(@times,A(R,:).*A(C,:),degs)),2);
        simMatrix=zeros(size(A));
        simMatrix(sub2ind(size(simMatrix),R,C)) = vals;
        simMatrix=simMatrix+simMatrix';
    case 'ra'
        [simMatrix]=RA(A);
end
end





function [ simMatrix ] = RA( A )
% Compute the similarity matrix based on resource allocation (RA) index
% Reference:
%   Zhou T, L¨¹ L, Zhang Y C. Predicting missing links via local information[J]. 
%   The European Physical Journal B, 2009, 71(4): 623-630.
%
% INPUT:
%       A: The adjacency matrix of a network
%
% OUTPUT:
%       simMatrix: The result similarity matrix based on RA index
%
% Author: Peizhuo Wang (wangpeizhuo_37@163.com)
% Sep. 2016

AA = A ./ repmat(sum(A,2), [1,size(A, 1)]);

AA(isnan(AA)) = 0;
AA(isinf(AA)) = 0;
simMatrix = A * AA;
simMatrix = simMatrix .* A;% Only the original edge is considered
simMatrix_max = max(max(simMatrix));
simMatrix_min = min(min(simMatrix));
simMatrix = (simMatrix - ones(size(A, 1))*simMatrix_min) ./ (simMatrix_max-simMatrix_min);
simMatrix = simMatrix - diag(diag(simMatrix));

end