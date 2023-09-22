function A = sbe_sgn2usgn(A, b)
% A - a matrix of correlation coefficients

% Systems Biology & Evolution Toolbox
% Author: James Cai
% Email: jcai@tamu.edu
% Website: https://github.com/jamesjcai/SBEToolbox_lite

if nargin < 2
    b = 2;
end
A = 0.5 * (A + 1);
A = exp(log(A)*b);
return


% https://bmcgenomics.biomedcentral.com/articles/10.1186/1471-2164-10-327

%{
x = randn(100,1);
y = randn(100,1);
X = [x y 2*y+3 -3*x+2];
A = corrcoef(X);
A=A-diag(diag(A));

A=0.5*(A+1);
A=A-diag(diag(A));
A

figure;
hold on
s=0:0.01:1;
for beta=1:6
    a=exp(log(s)*beta);
    plot(s,a,'-')
end

A
A=exp(log(A)*2);
A
%}
