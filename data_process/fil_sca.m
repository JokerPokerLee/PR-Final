function [sam, lab, tsam, tlab] = fil_sca(sample, label, tsample, tlabel)
    global test_sample;

	% remove outliar (two std away from mean)
	[fil_sam, fil_lab, ~] = rm_outlier(sample, label, []);

	% linear scale data to [-1, 1]
	range.u = 1;
	range.l = -1;
	[sca_sam, sca_param] = linear_scale(fil_sam, range, []);
	[sca_tsam, ~] = linear_scale(tsample, range, sca_param);
    [test_sample, ~] = linear_scale(test_sample, range, sca_param);

	sam = sca_sam;
	lab = fil_lab;
	tsam = sca_tsam;
	tlab = tlabel;
end