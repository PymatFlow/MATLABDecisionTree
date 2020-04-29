clc
clear

% iran-matlab.ir

load ionosphere


mdl = fitctree(X,Y)


view(mdl)


figure,
view(mdl,'Mode','graph')

