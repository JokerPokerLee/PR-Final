addpath('draw');
addpath('data_process');
global sample label tsample tlabel test_sample final_test;
[sample, label, final_test] = load_data();
test_sample = final_test;
fft_sample = abs(fft(sample, 3000, 2));
osample = sample;
olabel = label;
[sample, label, tsample, tlabel] = get_cv(sample, label, 0.95);