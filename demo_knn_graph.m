%% synthetic data
N = 600;
[data1,data2] = synthesize_data(N,'fuzzy roll',true);

A=sbe_knn_graph(data1',8);
figure;
% i_myscatter(data1')
figure; scatter3(data1(1,:),data1(2,:),data1(3,:),10,'b','filled')
hold on
for i=1:N-1
for j=i+1:N
if A(i,j)>0
    line(data1(1,[i j]),data1(2,[i j]),data1(3,[i j]));
end    
% if A(i,j)==1
%     line(data1(1,[i j]),data1(2,[i j]),data1(3,[i j]));
% elseif A(i,j)==0.5
%     line(data1(1,[i j]),data1(2,[i j]),data1(3,[i j]),'color','red');    
% end
end
end


function [X1,X2] = synthesize_data(num_points, name, add_noise)
	% [X1,X2] = synthesize_data(num_points, name)
	% num_points - size of each data set
	% name       - creation mode: one of {'spiral','sine roll','wavelet','fuzzy roll'}

if nargin < 3, add_noise = false; end

switch name
case 'spiral'
	x = linspace(0,10,num_points);
	X1 = [x.*cos(x); x.*sin(x)];
	X2 = [rand*x.*sin(x); rand*x.*cos(x)];
case 'sine roll'
    x = linspace(0,10,num_points);
    X1 = [x; sin(x.^2); zeros(size(x))];
    X2 = [x.*cos(x); sin(x.^2); x.*sin(x)];
case 'wavelet'
    x = linspace(-5,5,num_points);
    X1 = [x; sin(5*x).*exp(-x.^2); x];
    X2 = [cos(5*x).*exp(-x.^2); x; x];
case 'fuzzy roll'
    x = linspace(0,10,num_points);
    X1 = [x; sin(x.^3)-3*cos(x); zeros(size(x))];
    X2 = [x.*cos(x); sin(x.^3)-3*cos(x); x.*sin(x)];
otherwise
	error(['Invalid data mode: ' name]);
end
if add_noise
    X1 = X1 + randn(size(X1))/50;
    X2 = X2 + randn(size(X2))/50;
end
end






