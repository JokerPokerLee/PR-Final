function res = pca_trans(data, vec, param)
    n = size(data, 2);
    k = size(vec, 1);
    if n > k
        extra_fea = data(:, k + 1:n);
        data = data(:,1:k);
    end
    data = (data - param.mu) ./ param.std;
    res = data(:, 1:k) * vec;
    if n > k
        res = [data(:, 1:k) * vec, extra_fea];
    end
end