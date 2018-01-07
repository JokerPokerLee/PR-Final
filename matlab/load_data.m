function [sample, label, test_sample] = load_data()
    sample = [];
    label = [];
    load('data/test.mat');
    vari = whos('-file', 'data/train.mat');
    for i = 1:length(vari)
        data = load('data/train.mat', vari(i).name);
        cur = data.(vari(i).name);
        lab = cur(:,3001);
        idx = find(lab > 0 & lab < 4);
        sample = [sample; cur(idx,1:3000)];
        label = [label; lab(idx)];
    end
    test_sample = final_test;
end