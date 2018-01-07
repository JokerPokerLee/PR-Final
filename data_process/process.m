%{
  fft transform
  add amplitude
  add max frequency
%}
function [res] = process(sample)
  % assume that there are 1000 feature
  % symmetry property filter 501~1000 component
  % observed that component above 250 decrease to zero
  fft_sample = abs(fft(sample, 3000, 2));
  fft_sample = fft_sample(:,1:1500);
  amp = max(abs(sample), [], 2);
  fm = max(fft_sample, [], 2);
  res = [fft_sample];
end