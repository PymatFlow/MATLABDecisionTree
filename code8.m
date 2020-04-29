clear

% iran-matlab.ir

load ionosphere

tic
mdl = fitctree(X,Y,'MaxNumSplits',8);
toc
model_out_test = predict(mdl,X);
C = confusionmat(model_out_test,Y)
perf = 100*sum(diag(C))/sum(C(:))

view(mdl,'Mode','graph');
tic
mdl = fitctree(X,Y,'MaxNumSplits',3);
toc
model_out_test = predict(mdl,X);
C = confusionmat(model_out_test,Y)
perf = 100*sum(diag(C))/sum(C(:))
view(mdl,'Mode','graph');