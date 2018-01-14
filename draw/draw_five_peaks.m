function draw_five_peaks(fft_sample, olabel)
    [~, class_data] = classify(fft_sample, olabel);
    fft_mean1 = mean(class_data{1});
    fft_mean2 = mean(class_data{2});
    fft_mean3 = mean(class_data{3});
    x = 1:3000;
    subplot(2, 3, [1 2 3]);
    plot(x, fft_mean1(:,x), x, fft_mean2(:,x), x, fft_mean3(:,x));
    subplot(2, 3, 4);
    x = 1:150;
    plot(x, fft_mean1(:,x), x, fft_mean2(:,x), x, fft_mean3(:,x));
    subplot(2, 3, 5);
    x = 300:500;
    plot(x, fft_mean1(:,x), x, fft_mean2(:,x), x, fft_mean3(:,x));
    subplot(2, 3, 6);
    x = 1400:1600;
    plot(x, fft_mean1(:,x), x, fft_mean2(:,x), x, fft_mean3(:,x));
    subplot(2, 3, [1 2 3]);
    title('Mean value of FFT samples');
    subplot(2, 3, 4);
    title('First three peaks');
    subplot(2, 3, 5);
    title('Forth peak');
    subplot(2, 3, 6);
    title('Fifth peak');
end