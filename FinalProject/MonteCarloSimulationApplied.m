clear; close all; clc;

%I change kernel type with manual.

load fisheriris

species_num = grp2idx(species);
test(200,1) =0;
for i=1:200
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
      'expected-improvement-plus','ShowPlots',true)) 


X_test_w_best_feature = X_test(:,[1,5]);
test_accuracy_for_iter = sum((predict(Md1,X_test_w_best_feature) == y_test))/length(y_test)*100

test(i) = test_accuracy_for_iter
end
figure;
plot(test)
xlim([0 200]);
ylim([0 100]);

title(mean(test))
