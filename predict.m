function [pred] = predict(model)
    global test_sample;
	[~, pred] = max(sim(model, test_sample));
end