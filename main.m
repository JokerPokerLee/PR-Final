[sample, label, test_sample] = load_data();
osample = sample;
olabel = label;
[sample, label, tsample, tlabel] = get_cv(sample, label, 0.7);
addpath('data_process');
fft_sample = abs(fft(sample, 3000, 2));