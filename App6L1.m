close all 
clear all
clc

%% Lab 1
% Ex E17

x = [-2 -1.5 -1 -0.5  0 0.5  1  1.5   2  2.5   3]';
y = [14  8.75 5  2.75 2 2.75 5  8.75 14 20.75 29];

h = x(2)-x(1);

fpa = (y(2)-y(1))/h;
fpb = (y(end)- y(end-1))/h;

Int = h/2*(y(1)+y(end)+2*sum(y(2:end-1)));
erreur_pred = h^2/12*(fpb-fpa);

%intégrale point par point
f(1)=0;
for n=2:1:length(x)
    f(n) = h/2*(y(1)+y(n)+2*sum(y(2:n-1)));
end
disp(f(11))
% Ex Simpson
fpppa = (y(4)-3*y(3)+3*y(2)-y(1))/h^3;
fpppb = (y(end)-3*y(end-1)+3*y(end-2)-y(end-3))/h^3;
int_s = h/3*(y(1)+y(end)+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-1)));
erreur_simp = -h^4/180*(y(end)-y(1))*(fpppb-fpppa);

F(1)=0;
for n=3:2:length(x)
    F(((n-1)/2)+1) = h/3*(y(1)+y(n)+4*sum(y(2:2:n-1))+2*sum(y(3:2:n-1)));
end

plot (x(1:2:end),F)
hold on
plot(x,f);







