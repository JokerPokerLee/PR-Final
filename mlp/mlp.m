function [acc] = mlp(sample, label, tsample, tlabel, si, option)
	mm = minmax(sample);
	% net = newff(mm, si, option.trf, option.btf, option.blf, option.pf);
	net = feedforwardnet(5);
	model = train(net, sample, label);
	[~, pred] = max(sim(model, tsample));
	[~, tlab] = max(tlabel);
	acc = 1.0 * length(find(pred == tlab)) / length(tlab);
end