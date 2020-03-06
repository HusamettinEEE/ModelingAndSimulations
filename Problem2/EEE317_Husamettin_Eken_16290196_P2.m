clear all
close all
disp('working');
syms t1 t2 g m1 m2 k
k = 0.5;
g =9.8;

heigth =input('Please give a heigth value');
m1 = input('Please give small mass value');
m2 = input('Please give big mass value');

figure;
hold on;

t0 = (heigth/5)^(1/2);

Eqn1 = heigth ==(g*(((m1^2)/k^2)*exp((-k/m1)*t1)))+(g*(m1/k)*t1)-(g*((m1^2)/(k^2))) ;
t1 = double(solve(Eqn1,t1));


Eqn2 = heigth ==(g*(((m2^2)/k^2)*exp((-k/m2)*t2)))+(g*(m2/k)*t2)-(g*((m2^2)/(k^2))) ;
t2 = double(solve(Eqn2,t2));


o=1;
for i= 0:1/25:t1
    t1array(o) = heigth-((g*(((m1^2)/k^2)*exp((-k/m1)*i)))+(g*(m1/k)*i)-(g*((m1^2)/(k^2))));
    o= o+1;
end
o=1;
for i= 0:1/25:t1
    t2array(o) = heigth-((g*(((m2^2)/k^2)*exp((-k/m2)*i)))+(g*(m2/k)*i)-(g*((m2^2)/(k^2))));
    o= o+1;
end

o=1;
for i= 0:1/25:t1
    t0arraym1(o) = heigth-(4.9*i*i);
    o= o+1;
end
o=1;
for i= 0:1/25:t1
    t0arraym2(o) = heigth-(4.9*i*i);
    o= o+1;
end
o=1;


tic;
for a =0:1/25:t1
sub1=subplot(1,2,1);
unk= plot(4,t0arraym1(o),'-ro',8,t0arraym2(o),'-ro');
unk(1).MarkerSize =10;
unk(2).MarkerSize =20;
xlim(sub1,[0 10]);
ylim(sub1,[0 heigth+20]);
xlabel('Without friction');
sub2=subplot(1,2,2);
unk2= plot(4,t1array(o),'-bo',8,t2array(o),'-bo');
unk2(1).MarkerSize =10;
unk2(2).MarkerSize =20;
xlim(sub2,[0 10]);
ylim(sub2,[0 heigth+20]);
xlabel('With friction');
pause(1/25);
delete(unk);
delete(unk2);
o=o+1;

end
toc;

 unk=plot(4,0,'-ro',8,0,'-ro','Parent',sub1);
 unk(1).MarkerSize =10;
unk(2).MarkerSize =20;
 xlim(sub1,[0 10]);
ylim(sub1,[0 heigth+20]);
  unk2=plot(4,0,'-bo',8,0,'-bo','Parent',sub2);
  unk2(1).MarkerSize =10;
unk2(2).MarkerSize =20;
xlim(sub2,[0 10]);
ylim(sub2,[0 heigth+20]);