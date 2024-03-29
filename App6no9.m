clear all
close all
clc
%% Numero 9

P = [262.615 195.318 174.949 155.430 150.345 153.575 188.786 221.194 242.943 280.956 332.294];
v = [ 20.000 20.628 22.553 25.894 30.862 37.769 47.048 59.284 75.244 95.931 122.646];
h = [ 0 100 200 300 400 500 600 700 800 900 1000];

Y = log(2*P./v.^2);
X = h;

N = length(X);

param = inv([N,sum(X); sum(X),sum(X.^2)])*[sum(Y);sum(X.*Y)];

b = param(1);
m = param(2);

rho0 = exp(b);
hs = -1/m;

Ys = m*X+b;

RMS = sqrt(1/N*sum((Ys-Y).^2));
R2 = sum((Ys-mean(Y)).^2)/sum((Y-mean(Y)).^2);

Ps = exp(Ys).*v.^2/2;


% RMS = sqrt(1/N*sum((Ps-P).^2));
R2 = sum((Ps-mean(P)).^2)/sum((P-mean(P)).^2);


%% b)



it = 0;
h = 500;
y = 1/2*(20*cosh(h/400))^2*1.25*exp(-h/300)-200;
dy = exp(-h/300)*cosh(h/400)*(1.25*sinh(h/400)-25/30*cosh(h/400));
while abs(y)>1e-8 && it<1500
    h = h - y/dy;
    y = 1/2*(20*cosh(h/400))^2*1.25*exp(-h/300)-200;
    dy = exp(-h/300)*cosh(h/400)*(1.25*sinh(h/400)-25/30*cosh(h/400));
    it = it+1;
end

disp(h)
disp(it)









