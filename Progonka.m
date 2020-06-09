clc;
clear all
format longG
% отрезок [a,b]
a = 2; b = 5;
% константы краевых условий
c1 = 0.5; c2 = -0.3; c = 0; d1 = 0.45; d2 = 0; d = -1.2;
% функции p(x), q(x), f(x) 
p = @(x)(sqrt(100-x^2));
q = @(x)(5-2);
f = @(x)(x);
%шаг сетки
n = 30;
h = (b-a)/n; 
x = zeros(n+1,1);
x(1) = a;
x(n+1) = b;
v = zeros(n+1,1);
u = zeros(n+1,1);
v(1) = -c2/(c1*h - c2);
u(1) = h*c/(c1*h - c2);
for i = 2:n
   x(i) = x(1) + i*h;
   v(i) = -(1 + p(x(i))*h/2)/((q(x(i))*h^2 - 2) + ...
          (1 - p(x(i))*h/2)*v(i-1));
   u(i) = (f(x(i))*h^2 - (1 - p(x(i))*h/2)*u(i-1))/...
          ((q(x(i))*h^2 - 2) + (1 - p(x(i))*h/2)*v(i));
end
v(n+1) = 0;
u(n+1) = (h*d + d2*u(n))/((h*d1 + d2) + (-d2*v(n + 1)));
% решение системы
y(n+1) = u(n+1);
for i = n:-1:1
   y(i) = u(i) + v(i)*y(i+1); 
end
% вывод приближенных значений y(x)
for i = 1:n+1
   disp(y(i)); 
end

