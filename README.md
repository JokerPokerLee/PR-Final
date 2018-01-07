# Pattern Recognition #

Rename the given files to `data/train.mat` and `data/test.mat`.

Use `addpath('matlab/');` command to add matlab scripts.

`vis/` directory stores some results of data visulization.
`mean.png` shows the mean value of all samples *AFTER FFT*.
`max.png` shows the max value of all samples *AFTER FFT*.
`min.png` seems to be trivial.

`note.txt` file records some thoughts when analysing the data.

`load_data.m` reads from `train.mat` and `test.mat` and stores the data in `sample`, `label` and `test_sample` variables.
`get_cv.m` divides samples into training part and cross validation part, training part size can be specified by ratio arguement.
