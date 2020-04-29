clear
clc

load ionosphere

rng(1); % For reproducibility

% iran-matlab.ir

MdlDefault = fitctree(X,Y,'CrossVal','on');

view(MdlDefault.Trained{1},'Mode','graph')
view(MdlDefault.Trained{5},'Mode','graph')
view(MdlDefault.Trained{10},'Mode','graph')

classErrorDefault = kfoldLoss(MdlDefault)

PerfDefult = 100* (1 - classErrorDefault)

% Suppose that you want a classification tree that is not as complex
% (deep) as the ones trained using the default number of splits. 
% Train another classification tree, but set the maximum number 
% of splits at 7, which is about half the mean number of splits 
% from the default classification tree. Cross-validate the model 
% by using 10-fold cross-validation.


Mdl7 = fitctree(X,Y,'MaxNumSplits',2,'CrossVal','on');
view(Mdl7.Trained{1},'Mode','graph')

classError7 = kfoldLoss(Mdl7)
