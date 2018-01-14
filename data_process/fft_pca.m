function [norm_sample, norm_tsample] = fft_pca(sample, test_sample, p, mode)

	fft_sample = abs(fft(sample, 3000, 2));
    fft_sample = [fft_sample(:,1:500), fft_sample(:,1450:1500)];
	[vec, pca_param] = pca_vec(fft_sample, p, mode);

	% normalize train sample and test sample using pca_param
    % pick [1, 500] and [1450, 1500]
    % add five peaks
	% perform pca transformation using vec
	norm_sample = pca_trans(process(sample), vec, pca_param);
	norm_tsample = pca_trans(process(test_sample), vec, pca_param);

end