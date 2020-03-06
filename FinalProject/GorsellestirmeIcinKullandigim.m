clear; close all; clc;


load fisheriris

species_num = grp2idx(species);

X = randn(100,10);
error_values = randn(16,1)
error_values = abs(error_values)
X(:,[1,3,5,7]) = meas(1:100,:);
X(1:16,5) = X(1:16,5)+error_values(1:16,1)
y = species_num(1:100);

rand_num = randperm(size(X,1));
X_train = X(rand_num(1:round(0.8*length(rand_num))),:);
y_train = y(rand_num(1:round(0.8*length(rand_num))),:);

X_test = X(rand_num(round(0.8*length(rand_num))+1:end),:);
y_test = y(rand_num(round(0.8*length(rand_num))+1:end),:);


c = cvpartition(y_train,'k',5);



X_train_w_best_feature = X_train(:,[1,5]);

Md1 = fitcsvm(X_train_w_best_feature,y_train,'KernelFunction','polynomial',...
      'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
      'expected-improvement-plus','ShowPlots',true)) % Bayes' Optimization ??.


X_test_w_best_feature = X_test(:,[1,5]);
test_accuracy_for_iter = sum((predict(Md1,X_test_w_best_feature) == y_test))/length(y_test)*100


figure;
hgscatter = gscatter(X_train_w_best_feature(:,1),X_train_w_best_feature(:,2),y_train);
hold on;
h_sv=plot(Md1.SupportVectors(:,1),Md1.SupportVectors(:,2),'ko','markersize',8);




gscatter(X_test_w_best_feature(:,1),X_test_w_best_feature(:,2),y_test,'rb','xx')

XLIMs = get(gca,'xlim');
YLIMs = get(gca,'ylim');
[xi,yi] = meshgrid([XLIMs(1):0.01:XLIMs(2)],[YLIMs(1):0.01:YLIMs(2)]);
dd = [xi(:), yi(:)];
pred_mesh = predict(Md1, dd);
redcolor = [1, 0.8, 0.8];
bluecolor = [0.8, 0.8, 1];
pos = find(pred_mesh == 1);
h1 = plot(dd(pos,1), dd(pos,2),'s','color',redcolor,'Markersize',5,'MarkerEdgeColor',redcolor,'MarkerFaceColor',redcolor);
pos = find(pred_mesh == 2);
h2 = plot(dd(pos,1), dd(pos,2),'s','color',bluecolor,'Markersize',5,'MarkerEdgeColor',bluecolor,'MarkerFaceColor',bluecolor);
uistack(h1,'bottom');
uistack(h2,'bottom');
legend([hgscatter;h_sv],{'setosa','versicolor','support vectors'})