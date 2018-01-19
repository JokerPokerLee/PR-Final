function [acc, model, dist] = mlp(sample, label, tsample, tlabel)
	net = feedforwardnet([8, 6], 'trainbr');
    net.trainParam.epochs = 100;
	model = train(net, sample, label);
	[~, pred] = max(sim(model, tsample));
	[~, tlab] = max(tlabel);
	acc = 1.0 * length(find(pred == tlab)) / length(tlab);
    dist = zeros(3, 3);
    for i = 1:3
        for j = 1:3
            dist(i, j) = length(find(pred == i & tlab == j));
        end
    end
end