function [adj]=sbe_cor2adj(cor,varargin)
% Calculate WGCNA network adjacency
% Calculates (correlation or distance) network adjacency from given expression data or from a similarity.
%
% e.g., adj=sbe_cor2adj(cor,'softpower',2)

p = inputParser;
defaultType = 'unsigned';
validTypes = {'unsigned','signed','signedhybrid','hybrid2','distance'};
checkType = @(x) any(validatestring(x,validTypes));
addRequired(p,'cor',@isnumeric);
addParameter(p,'softpower',6,@isnumeric);
addOptional(p,'type',defaultType,checkType)
addOptional(p,'modified',false,@islogical);

p.KeepUnmatched = true;
parse(p,cor,varargin{:})
softpwr=p.Results.softpower;

switch p.Results.type
    case 'unsigned'
        adj=abs(cor);
        
        
    case 'signed'
        adj=(0.5*(1+cor));
    case 'signedhybrid'
         adj=cor;
         adj(cor<0)=0;
         adj(cor>0)=adj(cor>0);
    case 'hybrid2'
         % https://www.biorxiv.org/content/10.1101/288225v3
         % csuWGCNA: a combination of signed and unsigned WGCNA to capture negative correlations
         adj=(1+abs(cor))/2;
    case 'distance'
         dist=cor;
         adj=(1-(dist./max(dist)).^2);
end
adj=adj.^softpwr;
adj=adj-diag(diag(adj));

if p.Results.modified && p.Results.type=="unsigned"
    % for calculating signed TOM
    % see Signed vs. Unsigned Topological Overlap Matrix Technical report
    % https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/Rpackages/WGCNA/TechnicalReports/signedTOM.pdf
    adj=adj*sign(cor);
end

% checkAdjMat(adjMat, min = 0, max = 1)
% checkSimilarity(similarity, min = -1, max = 1)

% https://www.rdocumentation.org/packages/WGCNA/versions/1.67/topics/adjacency
% adjacency(datExpr, 
%           selectCols = NULL, 
%           type = "unsigned", 
%           power = if (type=="distance") 1 else 6,
%           corFnc = "cor", corOptions = list(use = "p"),
%           weights = NULL,
%           distFnc = "dist", distOptions = "method = 'euclidean'",
%           weightArgNames = c("weights.x", "weights.y"))
% adjacency.fromSimilarity(similarity, 
%                          type = "unsigned", 
%                          power = if (type=="distance") 1 else 6)
                             

% To begin with, one needs to define a measure of similarity between the
% gene expression profiles. This similarity measures the level of concordance
% between gene expression profiles across the experiments. The n×n similarity
% matrix S = [sij ] is transformed into an n × n adjacency matrix A = [aij ],
% which encodes the connection strengths between pairs of nodes. Since, the
% networks considered here are undirected, A is a symmetric matrix with nonnegative
% entries. By convention, the diagonal elements of A are set to 0,
% i.e. aii = 0. Without loss of generality, we assume aij # [0, 1] for weighted
% networks. The adjacency matrix is the foundation of all subsequent steps.
% In particular, it is used to define node connectivity (as the row sum).

% To define the adjacency matrix, one makes use of an adjacency function,
% which transforms the co-expression similarities into connection strengths.
% The adjacency function depends on certain parameters, which can be determined

% http://dibernardo.tigem.it/files/papers/2008/zhangbin-statappsgeneticsmolbio.pdf

% using different statistical or biological criteria.