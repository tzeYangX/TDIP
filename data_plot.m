clear all
close all
clc

data=xlsread('1228数据处理结果.xlsx');
data=data.*1000;

v50_1=data(:,1)';
v50_2=data(:,3)';
v50_3=data(:,5)';

v100_1=data(:,7)';
v100_2=data(:,9)';
v100_3=data(:,11)';


v150_1=data(:,13)';
v150_2=data(:,15)';
v150_3=data(:,17)';


x1=9980:1:10180;
v501=v50_1(1:201);
v502=v50_2(1:201);
v503=v50_3(1:201);

v1001=v100_1(1:201);
v1002=v100_2(1:201);
v1003=v100_3(1:201);

v1501=v150_1(1:201);
v1502=v150_2(1:201);
v1503=v150_3(1:201);

figure;
plot(x1,v501,'r.',x1,v502,'b.',x1,v503,'k.');
title('50mA衰减曲线');
xlabel('时间（ms）;')
ylabel('电压（mV）;')
figure;
plot(x1,v1001,'r.',x1,v1002,'b.',x1,v1003,'k.');
title('100mA衰减曲线');
xlabel('时间（ms）;')
ylabel('电压（mV）;')
figure;
plot(x1,v1501,'r.',x1,v1502,'b.',x1,v1503,'k.');
title('150mA衰减曲线');
xlabel('时间（ms）;')
ylabel('电压（mV）;')

n=length(v50_1)-1;
u501=v50_1(202:n);
u502=v50_2(202:n);
u503=v50_3(202:n);

u1001=v100_1(202:n);
u1002=v100_2(202:n);
u1003=v100_3(202:n);

u1501=v150_1(202:n);
u1502=v150_2(202:n);
u1503=v150_3(202:n);

x2=10180:20000;
figure;
plot(x2,u501,'r.',x2,u502,'b.',x2,u503,'k.');
title('50mA后续曲线');
xlabel('时间（ms）;')
ylabel('电压（mV）;')
figure;
plot(x2,u1001,'r.',x2,u1002,'b.',x2,u1003,'k.');
title('100mA后续曲线');
xlabel('时间（ms）;')
ylabel('电压（mV）;')
figure;
plot(x2,u1501,'r.',x2,u1502,'b.',x2,u1503,'k.');
title('150mA后续曲线');
xlabel('时间（ms）;')
ylabel('电压（mV）;')


