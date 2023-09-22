function [A] = sbe_symmetrize_adjacency(A)
A = max(A, A');
%http://www.stanford.edu/~dgleich/programs/matlab_bgl/faq.html

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite