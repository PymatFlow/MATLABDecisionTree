clear
%%%%%%

load ionosphere

CVO = cvpartition(Y,'HoldOut',0.3);

trainIdx = CVO.training;
testIdx = CVO.test;
    
input_training  = X(trainIdx,:);
target_training = Y(trainIdx,:);

input_test  = X(testIdx,:);
target_test = Y(testIdx,:);

mdl = fitctree(input_training,target_training);

model_out_test = predict(mdl,input_test);


C = confusionmat(model_out_test,target_test)


perf = 100*sum(diag(C))/sum(C(:))




labels = findgroups(target_test);
scores = findgroups(model_out_test);
posclass = 2;

[X,Y] = perfcurve(labels,scores,posclass);
plot(X,Y)
xlabel('False positive rate') 
ylabel('True positive rate')


