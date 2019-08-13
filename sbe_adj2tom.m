function [TOM]=sbe_adj2tom(adj,numSteps,varargin)
% The Topological Overlap Measure (TOM) was introduced in [1] to make networks less sensitive to spurious
% connections or to connections missing due to random noise. While the original work [1] considered
% unweighted networks, the authors of [2] generalized TOM to a weighted network.
% The central idea of TOM is to count the direct connection strengths as well as connection strengths
% \mediated" by shared neighbors. The standard, or \unsigned" TOM assumes that neighbor-mediated
% connections can always be considered as \reinforcing" the direct connection. This may not always be the
% case, and the signed TOM is an attempt to take this into account.    

if nargin<2
    numSteps=1;
end

p = inputParser;
defaultType = 'unsigned';
validTypes = {'unsigned','signed'};
checkType = @(x) any(validatestring(x,validTypes));
addRequired(p,'adj',@isnumeric);
addOptional(p,'type',defaultType,checkType)
parse(p,adj,varargin{:})

switch p.Results.type
    case 'unsigned'
        [TOM]=sbe_gtom(adj,numSteps);
    case 'signed'
        % adj=sbe_cor2adj(cor,'modified',true,'type','unsigned');
        % [TOM]=sbe_adj2tom(adj,1,'type','signed')
        
    % for calculating signed TOM
    % see Signed vs. Unsigned Topological Overlap Matrix Technical report
    % https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/Rpackages/WGCNA/TechnicalReports/signedTOM.pdf
        
        error('Unfinished.');
end
end


% https://github.com/ryananeff/WGCNA/blob/6883a01f8192a61d1af8e9338617f9f7b9806e2e/src/networkFunctions.c


%   switch (* tomType)
%   {
%     case TomTypeUnsigned:
%       for (size_t j=0; j< ng1; j++)
%       {
%         tom2 = tom + (ng+1)*j + 1;  
%         adj2 = adj + (ng+1)*j + 1;
%         for (size_t i=j+1; i< ng; i++)
%         {
%           double den1;
%           if ((* denomType) == TomDenomMin)
%              den1 = fmin(conn[i], conn[j]);
%           else
%              den1 = (conn[i] + conn[j])/2;
%           *tom2 = ( *tom2 - *adj2) / ( den1 - * adj2 ) ;
%           *(tom + ng*i + j) = *tom2;
%           if (*tom2 > 1) nAbove1++;
%           tom2++;
%           adj2++;
%         }
%       }
%       break;
%     case TomTypeSigned:
%       for (size_t j=0; j < ng1; j++)
%       {
%         tom2 = tom + (ng+1)*j + 1;  
%         adj2 = adj + (ng+1)*j + 1;
%         for (size_t i=j+1; i< ng; i++)
%         {
%           if ((*suppressTOMForZeroAdj == 0) || (*adj2 > 0))
%           {
%             double den1;
%             if ((* denomType) == TomDenomMin)
%                den1 = fmin(conn[i], conn[j]);
%             else
%                den1 = (conn[i] + conn[j])/2;
%             *(tom + ng*i + j) = *tom2 = fabs( *tom2 - *adj2) / ( den1 - fabs(*adj2) );
%             if (*tom2 > 1) 
%             {
%               Rprintf("TOM greater than 1: actual value: %f, i: %d, j: %d\n", *tom2, i, j);
%               nAbove1++;
%             }
%           } else {
%             *tom2 = 0;
%             *(tom + ng*i + j) = 0;
%             nSuppressed++;
%           }
%           tom2++;
%           adj2++;
%         }
%       }
%       break;
%   }
%   