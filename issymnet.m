function [y]=issymnet(G)
%
% [y]=issymnet(G)

% Systems Biology & Evolution Toolbox, (C) 2010
% Author: James J. Cai
% Email: jcai@cvm.tamu.edu
% Website: http://bioinformatics.org/sbetoolbox/
% Last revision: 7/12/2010

y=isequal(G,G.');
%y = max(max(G-G'))<=e
%y=norm(G'-G) <= sqrt(eps);
