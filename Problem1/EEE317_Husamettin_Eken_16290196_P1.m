close;
%Take a input value for height
h = input('give me a height value');
%Then calculate total time to create discrete time array
t = (h/4.9)^(1/2);
%Matlab codes to keep figure window open
figure;
hold on;
%Then we start drawing real time free fall
for a = 0:(1/25):t %We arrange time array with 25 fps for each second
xlim([0 h/2]);%Arrangement of x axis
ylim ([0 h+20]);%Arrangement of y axis
c=plot(1,(h-(4.9*a*a)),'-o');%We draw height value and assign to a value to erase after see at figure 
pause(1/40);%We see here the drawing and waiting to be like real life time
delete(c);%At least we erase old drawing
end

%I am doing simulation time with process time so when height is bigger process are being bigger and my real total time and total process time being different. I couldn't solution for this.