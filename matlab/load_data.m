function [sample, label, test_sample] = load_data()
    sample = [];
    label = [];
    load('data/train.mat');
    load('data/test.mat');
    vari = whos('-file', 'data/train.mat');
    for i = 1:length(vari)
        cur = eval(vari(i).name);
        sample = [sample; cur(:,1:3000)];
        label = [label; cur(:,3001)];
    end
    idx = find(label > 0 & label < 4);
    sample = sample(idx,:);
    label = label(idx);
    test_sample = final_test;
end