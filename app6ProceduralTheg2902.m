close all
clear all
clc
%% 6
x = [-2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3];
f = [14 8.75 5 2.75 2 2.75 5 8.75 14 20.75 29];
x1 = x(1:2:end);
f1 = f(1:2:end);

F = 0.5/2*(f(1)+f(end)+2*sum(f(2:end-1)));
F1 = 1/2*(f1(1)+f1(end)+2*sum(f1(2:end-1)));
E = (0.5^2/12)*(((f(end)-f(end-1))/0.5)-((f(2)-f(1))/0.5));
E1 = (1^2/12)*(((f1(end)-f1(end-1))/1)-((f1(2)-f1(1))/1));

S  = (0.5/3)*(f(1)+f(end)+4*sum(f(2:2:end-1))+2*sum(f(3:2:end-1)));
S1 = (1/3)*(f1(1)+f1(end)+4*sum(f1(2:2:end-1))+2*sum(f1(3:2:end-1)));

dFa = (f(4)-3*f(3)+3*f(2)-f(1))/0.5^3;
dFb = (f(end)-3*f(end-1)+3*f(end-2)-f(end-3))/0.5^3;
dF1a = (f1(4)-3*f1(3)+3*f1(2)-f1(1))/01^3;
dF1b = (f1(end)-3*f1(end-1)+3*f1(end-2)-f1(end-3))/1^3;

Es = (0.5^4/180)*(dFb-dFa);
Es1 = (1^4/180)*(dF1b-dF1a);
%% 7
t = [0 1 2 3 4 5 6];
a = [0.7 0.9 0.5 0.1 0.3 1.7 4.9];
V = 1/2*(a(1)+a(end)+2*sum(a(2:end-1)))
%% 8
x0 = 0.709;
ite = 0;
xn = x0;
fn = xn^3-6*xn^2+7*xn+2;
dn = 3*xn^2-12*xn+7;
permis = 10^(-8);
while(abs(fn)>permis & ite<501)
    xn = xn - fn/dn;
    fn = xn^3-6*xn^2+7*xn+2;
    dn = 3*xn^2-12*xn+7;
    ite=ite+1;
end
%% 9
P = [262.615 195.318 174.949 155.430 150.345 153.575 188.786 221.194 242.943 280.956 332.294];
v = [20 20.628 22.553 25.894 30.862 37.769 47.048 59.284 75.244 95.931 122.646];
h = [0 1 2 3 4 5 6 7 8 9 10]*100;

a = ([length(h) sum(h);
     sum(h) sum(h.^2)]);
d = [sum(log((2*P)./v.^2)) sum(h.*(log(2*P./v.^2)))]';

param = a\d;

hs = -1/param(2);
po = exp(param(1));
%% b
hs = 300;
po = 1.25;

fn = 