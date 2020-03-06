clear all;
close all;

%--------------INPUTS----------------
x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
y = [202.36, 239.03, 280.71, 309.12, 323.15, 332.78, 328.45, 306.40, 287.36, 247.97, 202.89, 161.11, 93.68, 20.78];

%-------USAGE MATLAB FUNCTION--------
p2 = polyfit(x,y,2);
disp("We want to find coefficient Ax^2 + Bx + C");
disp(" ");
disp("Using Matlab 'polyfit()' Function Coefficients: A B C ");
disp(p2); 

%-----POLYNOMIAL REGRESSION FUNCTION-----
for i=0:13
A(i+1,1) = (i^2);
A(i+1,2) = i;
A(i+1,3) =1;
end
ATranspose = transpose(A);
ATransMultipleA = ATranspose*A;
ATransMultipleY = ATranspose*transpose(y);
Results = inv(ATransMultipleA)*ATransMultipleY;

disp("Using Writed Function Coefficients: A B C ");
disp(transpose(Results));

%-----------------------FIRST QUESTION FINISH HERE---------------
figure;
hold on;

%--------FIND ACCELERATION AND V0 VALUES-----------
maxValueTime = (-Results(2)/(2*Results(1)));
maxValue=(Results(1)*(maxValueTime^2)+Results(2)*maxValueTime + Results(3));
g = ((maxValue-Results(3))/(maxValueTime^2-(maxValueTime^2/2)));
disp("The acceleration of gravity is:");
disp(g);
disp("The velocity zero is:");
disp(maxValueTime*g);
%---------MATHEMATICAL MODEL------------
disp("-4.9354x^2 + +50.2844x + 200.1443");

%------PLOTTING------------
specialt =1;
for t = 0:1/25:13.5
  sub1 = subplot(2,2,[1,3]);
    heigth = Results(1)*(t^2)+Results(2)*t + Results(3);
    if heigth<0
        heigth =0;
    end
    modet = mod(t,1);
    if modet == 0
        hold on;
        if specialt == t
        delete(deletedValue2);
        end
        if t~= 0
        specialt = specialt+1;
        end
        title('Ball with error-----Ball with calculated function');
        deletedValue2 = plot(5,y(t+1),"-o",'markerfacecolor','red');
    end
    deletedValue = plot(15,heigth,"-o",'markerfacecolor','blue');
    xlim(sub1,[0 20]);
    ylim(sub1,[0 350]);
    pause(1/50);
    delete(deletedValue);
  sub2= subplot(2,2,2);
        hold all;
        title('Location-Time');
        plot(t,heigth,"-o");
        xlim(sub2,[0 20]);
        ylim(sub2,[0 350]);
  sub3 = subplot(2,2,4);
        hold all;
        title('Velocity-Time');
        plot(t,((maxValueTime*g)-(g*t)),"-o");
        xlim(sub3,[0 20]);
        ylim(sub3,[-100 70]);
end

delete(deletedValue2);
deletedValue = plot(15,0,"-o",'markerfacecolor','blue','Parent',sub1);
xlim(sub1,[0 20]);
ylim(sub1,[0 350]);



