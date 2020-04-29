clear
clc

load ionosphere
% rng(1); % For reproducibility

% iran-matlab.ir

TREEModel = fitctree(X,Y,'Kfold',10);
for kk=1:10
    CompactTREEModel = TREEModel.Trained{kk}; % Extract trained, compact classifier
    cvs = TREEModel.Partition;
    testInds = cvs.test(kk);   % Extract the test indices
    XTest = X(testInds,:);
    YTest = Y(testInds,:);

    [label,score] = predict(CompactTREEModel,XTest);

    C = confusionmat(YTest,label);

    perf(kk) = sum(diag(C))/sum(C(:));
end

performance_final = 100* mean(perf)

    