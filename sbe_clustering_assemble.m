% https://github.com/neukzhou/robust_subspace_recovery/blob/2f7f537097a9cd4dbe5d7b0490fafe4f794e6f2c/utilities/detect_num_subspaces/Clustering_assemble.m

% Clustering_assemble.m
%
% By Chunguang LI
% Jan. 21, 2013

function [idx,ThreshM] =Clustering_assemble(idx_arr,n,k,thresh)
%
%
M =zeros(n);
T =size(idx_arr,1);
for i=1:T
    M = M + form_affinity_matrix(idx_arr(i,:),n);
end
M =M/T;
%thresh =T*0.5/T; %*1/k;
%thresh_M =(M >thresh);
%% How to define an optimal 'thresh'??
% Can we recover M from M/T via MC with rank k? It is structured low-rank!!!
%thresh =0.5;
idx =find_groups(M,k,thresh);
ThreshM =form_affinity_matrix(idx,n);
% figure;subplot(121);image(M*200);hold on;subplot(122);image(thresh_M*200);
% figure;subplot(121);image(M*200);subplot(122);idxM=(M>0.001);hist(M(idxM));

function M = form_affinity_matrix(idx,n)
if nargin<2
    n =size(idx,2);
end
M =zeros(n);
id =unique(idx);
for i =1:length(id)
    idx_i =find(idx == id(i));
    M(idx_i,idx_i)=ones(size(idx_i,2));
end

function [idx]= find_groups(M,k,thresh)
if nargin<3
    thresh=0.5;
end
logic_M =(M >thresh);
n =size(M,2);
id =1:max(k,n);
% Find the k connected components in the graph
markers =ones(1,n);
%idx_cell =cell(1,k);
idx =zeros(1,n);
c =0;
%% Detect the biggest groups and assign........
for i=1:n
    if (markers(i)) % find the index which are still turn-on.
        c =c+1;
        j_idx =find(logic_M(i,:)==1);
        idx(j_idx) =id(c);
        %idx_cell{c} =j_idx;
        markers(j_idx) =0; % turn-off all markers which are connecting with i
    end
end
%% Detect singular clusters and absorbing smaller clusters
group_idx_cell =cell(1,c);
size_group =zeros(1,c);
if c >k
    % counter the size of each groups
    for i=1:c
        group_idx =find(idx==i);
        group_idx_cell{1,i} =group_idx;
        size_group(i) =size(group_idx,2);
    end
    % sorting the size of each group in desending order
    [~,index] =sort(size_group,'descend');
    % find the singular clusters and absorb them
    non_singular_groups_idx =index(1:k);
    singular_groups_idx =index(k+1:c);
    for s=1:size(singular_groups_idx,2)
        group_idx =singular_groups_idx(s);
        data_idx =group_idx_cell{1,group_idx};        
        % detect
        singular_idx_match_g =ones(1,size(data_idx,2));
        for j =1:size(data_idx,2)
            idx =data_idx(j);
            tmp =M(idx,:);
            score =zeros(1,k);
            for g =1:k
                tmp_idx_g =group_idx_cell{1,non_singular_groups_idx(g)};
                % How to judge the optimal matching is a problem.....
                score(g) =sum(tmp(tmp_idx_g))/size(tmp_idx_g,2);
            end
            [~,match_idx] =max(score);
            singular_idx_match_g(j) =match_idx;
            % Absorbing 
            group_idx_cell{1,non_singular_groups_idx(singular_idx_match_g(j))} =[group_idx_cell{1,non_singular_groups_idx(singular_idx_match_g(j))},data_idx(j)];
        end
        for j =1:size(data_idx,2)
            % Absorbing 
            group_idx_cell{1,non_singular_groups_idx(singular_idx_match_g(j))} =[group_idx_cell{1,non_singular_groups_idx(singular_idx_match_g(j))},data_idx(j)];     
        end
        % removement the absorted
        group_idx_cell{1,group_idx} =[];
    end
    % Re-sorting
    c =0;
    id =1:k;
    idx_new =zeros(1,n);
    for i=1:size(group_idx_cell,2)
        tmp =group_idx_cell{1,i};
        if ~isempty(tmp)
            c =c +1;
            if (c<=k)
                idx_new(tmp) = id(c);
            else
                disp('Error in Resorting of Detect singular clusters and absorbing smaller clusters ...');
            end
        end        
    end
    idx =idx_new;
end