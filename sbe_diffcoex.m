function [dissTOMC1C2]=sbe_diffcoex(adj1,adj2,vbeta)
if nargin<2
    vbeta=2;
end

% DiffCoEx is a method for identifying correlation pattern changes, which builds on the commonly used Weighted Gene Coexpression Network Analysis (WGCNA) framework for coexpression analysis.
%
% https://rdrr.io/github/ddeweerd/MODifieRDev/man/diffcoex.html
% https://rdrr.io/github/ddeweerd/MODifieRDev/src/R/diffcoex.R
% http://pklab.med.harvard.edu/scw2014/WGCNA.html

% The soft threshold parameter ? is taken as a positive integer and is used 
% to transform the correlation values so that the weight of large correlation 
% differences is emphasized compared to lower, less meaningful, differences. 
% ? should be regarded as a tuning parameter, and in practice it is advisable 
% to try different values of ?. 

% adjacency change matrix
adjchg=sqrt(0.5*abs(adj1-adj2)).^vbeta;

dissTOMC1C2 = 1-sbe_adj2tom(adjchg,1);


% cluster_method	
% the agglomeration method to be used. This should be (an unambiguous 
% abbreviation of) one of "ward", "single", "complete", "average", 
% "mcquitty", "median" or "centroid". This applies to hierachical clustering.

% Z=linkage(dissTOMC1C2,'average');
% T=cluster(Z,'cutoff',0.8);

% Z=linkage(dissTOMC1C2,'average');
% T=cluster(Z,'maxclust',200);


