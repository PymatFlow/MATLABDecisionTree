clear
clc

close all

% iran-matlab.ir

train_data = readtable('breastcancer_train.xlsx');
test_data = readtable('breastcancer_test.xlsx');

x_train = train_data(:,2:end);
y_train = train_data(:,1);
x_test = test_data(:,2:end);
y_test = test_data(:,1);

rng(29);

TreeMod = fitctree(x_train, y_train);



[out_Tree_test,score] = predict(TreeMod, x_test);
Results = strings(size(test_data,1),1);
for i = 1:size(test_data,1)
    if (out_Tree_test(i) == y_test.label(i))
        Results(i) = 'Correct';
    else
        Results(i) = 'Wrong';
    end
end
tabulate(Results);

