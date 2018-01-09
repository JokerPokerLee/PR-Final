function [sample, label, cv_sample, cv_label] = get_cv(sample, label, ratio)
	m = size(sample, 1);
	k = floor(m * ratio);
	rp = randperm(m);
	idx = rp(1:k);
	cv_idx = rp(k + 1:m);
	cv_sample = sample(cv_idx,:);
	cv_label = label(cv_idx);
	sample = sample(idx,:);
	label = label(idx);
end