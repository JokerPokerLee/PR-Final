function [acc] = mlp(sample, label, tsample, tlabel)
	% mm = minmax(sample);
	% net = newff(mm, si, option.trf, option.btf, option.blf, option.pf);
	net = feedforwardnet([9, 7, 5]);
	model = train(net, sample, label);
	[~, pred] = max(sim(model, tsample));
	[~, tlab] = max(tlabel);
	acc = 1.0 * length(find(pred == tlab)) / length(tlab);
end