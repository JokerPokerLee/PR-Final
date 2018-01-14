%{
  fft transform
  add five peaks
%}
function [res] = process(sample)
  % assume that there are 1000 feature
  % symmetry property filter 501~1000 component
  % observed that component above 250 decrease to zero
  fft_sample = abs(fft(sample, 3000, 2));
  % 4 peak: [1, 20], [25, 40], [50, 70], [350, 480], [1450, 1550]
  p1 = 1:20;
  p2 = 25:40;
  p3 = 50:70;
  p4 = 350:480;
  p5 = 1450:1550;
  sam = medfilt2(fft_sample, [1 3]);
  sam = medfilt2(sam, [1 3]);
  mx1 = max(sam(:, p1), [], 2);
  mx2 = max(sam(:, p2), [], 2);
  mx3 = max(sam(:, p3), [], 2);
  mx4 = max(sam(:, p4), [], 2);
  mx5 = max(sam(:, p5), [], 2);
  fft_sample = [fft_sample(:,1:500), fft_sample(:,1450:1500)];
  % amp = max(abs(sample), [], 2);
  % fm = max(fft_sample, [], 2);
  % hf_mean = mean(fft_sample(:,500:1400), 2);
  res = [fft_sample, mx1, mx2, mx3, mx4, mx5];
end