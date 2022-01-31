%% iteracion de punto fijo 
close all
clear all
clc
syms x;
%f=((3*x-1)^(1/2));
%f = (x^(2) + 1)/3;
f = 3*x*(1-x);
fx = inline(f);
%aux = feval(fx,xi);
x0=0.3;
error = 100;
i=0;
fprintf('\ti  \txi  \terror \n');
while (abs(error)>0.0000001)
%for i=1:3
    i = i+1;
    xi= feval(fx,x0);
    error = xi - x0;
    %error=((xi-x0)/xi)*100;
    fprintf('\t%d  \t%f  \t%f \n',i,xi,abs(error))
    x0=xi;
    
end
%% metodo de NR
% Author - Ambarish Prashant Chandurkar
%The Newton Raphson Method
clc;
close all;
clear all;
syms x;
%f=x-2*sin(x); %Enter the Function here
%f = 2/x - 1/sin(x);
%f=sin(x)/x - 1/2;
%f=diff((x^2+log(x)^2)^(1/2));
f=3*x*(1-x)-x;
fx= inline(f);
g=diff(f); %The Derivative of the Function
gx = inline(g);
x0 = input('Enter the intial approximation:');
i = 0;
error = 1;
fprintf('\ti  \txi  \terror \n');
while(abs(error)>0.0000001)
    i = i + 1;
    f0=feval(fx,x0); %Calculating the value of function at x0
    f0_der=feval(gx, x0); %Calculating the value of function derivative at x0
    y=x0-f0/f0_der; % The Formula
    error=abs(y-x0);
    x0 = y;
    fprintf('\t%d  \t%f  \t%f \n',i,y,error)
end
%% metodo de la secante 
x0=input('Ingrese el intervalo inferior: ');
x1=input('Ingrese el intervalo superior: ');
syms x;
f=x-2*sin(x);
fx = inline(f); 
error = 1;
fprintf('\ti  \txi  \terror \n');
i=0;
while error > 0.0000001
   i = i+1;
   x2= x1 - (feval(fx,x1)*(x1-x0))/(feval(fx,x1)-feval(fx,x0));  
   error = abs(x2-x1);
   x0 = x1;
   x1 = x2;
   fprintf('\t%d  \t%f  \t%f \n',i,x2,error)
end