function [A]=symmetrizeadjmat(A)
A=max(A,A');
%http://www.stanford.edu/~dgleich/programs/matlab_bgl/faq.html
