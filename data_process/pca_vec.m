% perform n to k de-dimension pca
% retain at least <prop> proportion message of sample after pca
% if mode equals to 1, prop determine how many component to select,
% otherwise prop indicate how much info to remain
function [vec, param] = pca_vec(sample, prop, mode)
  % n-dim sample
  n = size(sample, 2);
  param.mu = mean(sample);
  param.std = std(sample);
  sample = (sample - param.mu) ./ param.std;
  [COEFF, ~, latent] = pca(sample);
  p = cumsum(latent) ./ sum(latent);
  if mode == 1
    vec = COEFF(:, 1:prop);
    return
  end
  % init k to n
  k = n;
  for i = 1:size(p)
    if p(i) >= prop
      k = i;
      break;
    end
  end
  % get eigvec
  vec = COEFF(:,1:k);
end