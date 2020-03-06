clear; close all; clc;

[soundofone,fs] =audioread('1.wav');
sound(soundofone,fs)
[soundoftwo,Fs]= audioread('2.wav');
sound(soundoftwo,Fs)
% x = soundofone(1:29952,1);
% x(:,2)= soundoftwo(1:29952,1);
 x(59904,2) = 0;
  for i=1:1:29952
    x(i,1)= i;
    x(i,2)= soundofone(i,1);
    x(i+29952,1)= i;
    x(i+29952,2)= soundoftwo(i,1);
 end

 y(1:29952,1) = soundofone(1:29952,1);
 y(29953:59904,1)= soundoftwo(1:29952,1);
 
 label(59904,1)= 0;
 for i=1:1:2*29952
    if i<29953
        label(i,1)= 1;
    else
        label(i,1)= 2;
    end
 end
 
SVMModel = fitcsvm(X,Y,'Standardize',true,'KernelFunction','RBF',...
    'KernelScale','auto');
classOrder = SVMModel.ClassNames
sv = SVMModel.SupportVectors;
figure
gscatter(x(:,1),x(:,2),label)
hold on
plot(sv(:,1),sv(:,2),'ko','MarkerSize',10)
legend('versicolor','virginica','Support Vector')
