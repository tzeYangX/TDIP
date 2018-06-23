clear all;
clc;
% 
% x = -4:4; 
% y = [0 .15 1.12 2.36 2.36 1.46 .49 .06 0];
% cs = spline(x,y);
% xx = linspace(-4,4,100);
% plot(x,y,'o',xx,ppval(cs,xx),'-');
% 
% 
% x = 0:9; 
% y = sin(x); 
% xi = 0:.25:10; 
% yi = interp1(x,y,xi); 
% plot(x,y,'o',xi,yi);

x = -4:4; 
y = [0 .15 1.12 2.36 2.36 1.46 .49 .06 0];

trend_co=polyfit(x,y,4);





