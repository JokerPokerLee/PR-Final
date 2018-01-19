function [acc, model, dist] = run_mlp()
    addpath('data_process');
    addpath('mlp');

    global sample label tsample tlabel test_sample;

    % fft, normalize and pca
    [norm_sam, norm_tsam] = fft_pca(sample, tsample, 6, 1);

    % remove outlier
    % linear scale to unit range
    [sam, lab, tsam, tlab] = fil_sca(norm_sam, label, norm_tsam, tlabel);

    % formation
    sam = sam';
    e = eye(3);
    lab = e(lab, :)';
    tsam = tsam';
    tlab = e(tlab, :)';
    test_sample = test_sample';
    
    % equal training set of each class
    % [sam, lab] = sub_sam(sam, lab, 1000);
    %--- It turns out that more sample more accurate. ---%
    
    rnd = 10;
    acc = zeros(1, rnd);
    bst = 0.0;
    bst_mod = 0;
    bst_dist = 0;
    avg_dist = zeros(3, 3);
    for i = 1:rnd
        fprintf('Round %d: ', i);
        [res, model, dist] = mlp(sam, lab, tsam, tlab);
        fprintf('%f\n', res);
        if res > bst
            bst = res;
            bst_mod = model;
            bst_dist = dist;
        end
        acc(i) = res;
        avg_dist = avg_dist + dist;
    end
    model = bst_mod;
    dist = bst_dist;
end