clear
clc

load fisheriris;
varnames = {'SL','SW','PL','PW'};
t1 = fitctree(meas,species,'MinParentSize',5,'PredictorNames',varnames);
view(t1,'Mode','graph');

model_out_test = predict(t1,meas);
C = confusionmat(model_out_test,species)
perf = 100*sum(diag(C))/sum(C(:))

t2 = prune(t1,'Level',1);
view(t2,'Mode','graph');

model_out_test = predict(t2,meas);
C = confusionmat(model_out_test,species)
perf = 100*sum(diag(C))/sum(C(:))

t3 = prune(t1,'Level',2);
view(t3,'Mode','graph');

model_out_test = predict(t3,meas);
C = confusionmat(model_out_test,species)
perf = 100*sum(diag(C))/sum(C(:))

% ------------------------------

load ionosphere
mdl = fitctree(X,Y)
view(mdl,'Mode','graph');

mdl1 = prune(mdl,'Level',1);
view(mdl1,'Mode','graph');

mdl2 = prune(mdl,'Level',3);
view(mdl2,'Mode','graph');