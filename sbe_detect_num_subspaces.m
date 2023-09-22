% https://github.com/neukzhou/robust_subspace_recovery/blob/2f7f537097a9cd4dbe5d7b0490fafe4f794e6f2c/utilities/detect_num_subspaces/detect_num_subspaces.m

% detect_num_subspaces.m
%
% This code is used for detecting the maximal number of independent subspaces. In Matrix Completion (MC) in  a Uion of Subspaces
% (UoS) and Matrix Recovery (MR) in UoS, we have a Structured Low-Rank (SLR) sramework. The ''structural" information in SLR
% is produced by a subspace segmentation step, that is segmenting the data into k independent subspaces. Here the parameter k
% should be provided by users or estimated automatically.
%
% To estimate the number of independent subspaces, we have two methods:
%      1) manually detecting the position of eigen values gap of the graph Laplacian
%      2) train a gap detector and then automatically detect the gap
%      3) detecting the k which leads to the minimum confusion score in clustering ensemble method.
%
%
% Copyright by Chun-Guang Li
% May 14, 2014.
function [k, p1, p2, p3] = sbe_detect_num_subspaces(s, L, opt)
if nargin < 3
    opt.alg = 'SpectralGap';
end
if nargin < 2
    L = [];
    opt.alg = 'SpectralGap';
end
k = [];
switch opt.alg

    case 'SpectralGap'
        % sorting in asendng order
        [s, ~] = sort(s, 'ascend');
        s = s / max(s);

        n = max(size(s));

        g = zeros(1, n);
        relative_g = zeros(1, n);
        weight_rel_g = zeros(1, n);
        %exp_g =exp(s');
        for i = 1:n - 1
            % absolute gap: difference
            g(i) = (s(i+1) - s(i));

            % relative gap: relative difference
            relative_g(i) = (s(i+1) - s(i)) / s(i+1);

            % weighted relative gap
            weight_rel_g(i) = relative_g(i) * s(i);
        end
        %  normalized with its maximum
        nml_g = g / max(g);
        p1 = nml_g;

        %% Detect the position of maximum
        [val, ~] = max(nml_g(2:fix(n/3)));
        [~, idx] = find(nml_g(2:fix(n/3)) == val);
        % take the maximum idx
        k(1) = max(idx) + 1;

        %  normalized with its maximum
        nml_relative_g = relative_g / max(relative_g);
        p2 = nml_relative_g;

        %% Detect the position of maximum
        [val, ~] = max(nml_relative_g(2:fix(n/3)));
        [~, idx] = find(nml_relative_g(2:fix(n/3)) == val);
        % take the maximum idx
        k(2) = max(idx) + 1;

        %  weighted relative gap: normalized with its maximum
        nml_weight_rel_g = weight_rel_g / max(weight_rel_g);
        p3 = nml_weight_rel_g;

        %% Detect the position of maximum
        [val, ~] = max(nml_weight_rel_g(1:fix(n/3)));
        [~, idx] = find(nml_weight_rel_g(1:fix(n/3)) == val);
        % take the maximum idx
        k(3) = max(idx);

        % fitting the peaks: detecting the peaks from optimal filter perspective
        t = 1:n;
        %y = exp(- abs(t-5));
        opt_match_1 = zeros(1, n);
        opt_match_2 = zeros(1, n);
        for i = 1:n
            y = exp(-4*abs(t-i));
            z = exp(-4*(t - i).^2);
            opt_match_1(i) = y * nml_weight_rel_g';
            opt_match_2(i) = z * nml_weight_rel_g';
        end

        %% Detect the position of maximum
        [val, ~] = max(opt_match_1(1:fix(n/3)));
        [~, idx] = find(opt_match_1(1:fix(n/3)) == val);
        % take the maximum idx
        k(4) = max(idx);
        p4 = opt_match_1;

        %delta_exp_g = v .* exp_g;
        if (0 == 1)
            m = 200;
            figure;
            subplot(231);
            plot(s(1:m), 'k:*');
            hold on;
            subplot(232);
            plot(g(1:m), 'r:*');
            hold on;
            subplot(233);
            plot(relative_g(1:m), 'b-^');
            hold on;
            subplot(234);
            plot(weight_rel_g(1:m), 'g-+');
            hold on;
            subplot(235);
            plot(nml_weight_rel_g(1:m), 'k-s');
            subplot(236);
            plot(opt_match_1(1:m), 'm-o');
        end


    case 'NcutScore' % It is not reliable because for any k' < k, it is possible to give a zero cut error if there are two subspaces are well seperated
        max_k = opt.max_k;
        for ki = 1:max_k
            %groups = kmeans(kerNS,n,'maxiter',MAXiter,'replicates',REPlic,'EmptyAction','singleton');
            err = 0;
        end
        [~, idx] = min(err);
        k(1) = max(idx);

    case 'ConfusionScore'
        n = size(L, 2);
        [U, ~, ~] = svd(L);
        max_k = opt.max_k;
        T = opt.T;
        Score = zeros(1, max_k);
        Score(1) = 1;
        jj = 1;
        for ki = 2:max_k
            jj = jj + 1;
            X = U(:, end-ki+1:end);

            %% Repeat k-means T times
            idx_arr = zeros(T, n);
            for ii = 1:T
                idx = kmeans(X, ki, 'emptyaction', 'singleton', 'replicates', 10, 'display', 'off');
                idx_arr(ii, :) = (idx)';
            end

            %% Assemble the T results via majority voting
            thresh = 0.6;
            [~, M] = Clustering_assemble(idx_arr, size(L, 2), ki, thresh);
            for ii = 1:T
                M_ii = form_affinity_matrix(idx_arr(ii, :), n);
                Score(jj) = Score(jj) + sum(abs(M_ii(:)-M(:)));
            end
            Score(jj) = Score(jj) / T;
            Score(1) = mean(Score);
        end
        [val, ~] = min(Score);
        [~, idx] = find(Score == val);
        k(1) = max(idx);
        p5 = Score;

        if (1 == 1)
            figure;
            plot(Score, 'r:o');
        end
end

    function M = form_affinity_matrix(idx, n)
        if nargin < 2
            n = size(idx, 2);
        end
        M = zeros(n);
        id = unique(idx);
        for i = 1:length(id)
            idx_i = find(idx == id(i));
            M(idx_i, idx_i) = ones(size(idx_i, 2));
        end