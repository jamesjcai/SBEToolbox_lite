function A = incidence2(B)
% A = incidence(B) - conversion from adjacency matrix to incidence matrix
%
% INPUT:    B - adjacency matrix of a graph (directed or undirected);
% OUTPUT:   A - incidence matrix; rows = vertices, columns = edges
%

% 08 Jul 2009   - created   Ondrej Sluciak <ondrej.sluciak@nt.tuwien.ac.at>



siz = size(B); 
if siz(1)~=siz(2); 
    error('B must be square'); 
end 
 
nrknots = siz(1); 
nredges = nnz(B); 
[IXknots1,IXknots2] = find(B); 
sones = ones(nredges,1); 
IXedges = (1:nredges)'; 
 
A = sparse([IXedges; IXedges],... 
             [IXknots1; IXknots2],... 
             [-sones; sones],... 
             nredges,nrknots); 