clear all;
clc

data=xlsread('12-28GEI数据.xlsx');

V50_1=data(:,1);
V50_2=data(:,3);
V50_3=data(:,5);
V50_pre1=data(:,2);
V50_pre2=data(:,4);
V50_pre3=data(:,6);

V100_1=data(:,7);
V100_2=data(:,9);
V100_3=data(:,11);
V100_pre1=data(:,8);
V100_pre2=data(:,10);
V100_pre3=data(:,12);


V150_1=data(:,13);
V150_2=data(:,15);
V150_3=data(:,17);
V150_pre1=data(:,14);
V150_pre2=data(:,16);
V150_pre3=data(:,18);

t1=9980;
t2=10150;

v50_1=V50_1(t1:t2);
v50_2=V50_2(t1:t2);
v50_3=V50_3(t1:t2);
v100_1=V100_1(t1:t2);
v100_2=V100_2(t1:t2);
v100_3=V100_3(t1:t2);
v150_1=V150_1(t1:t2);
v150_2=V150_2(t1:t2);
v150_3=V150_3(t1:t2);


x1=30;
x2=80;


v50_11=v50_1(x1:x2)*100;
v50_21=v50_2(x1:x2)*100;
v50_31=v50_3(x1:x2)*100;
v100_11=v100_1(x1:x2)*100;
v100_21=v100_2(x1:x2)*100;
v100_31=v100_3(x1:x2)*100;
v150_11=v150_1(x1:x2)*100;
v150_21=v150_2(x1:x2)*100;
v150_31=v150_3(x1:x2)*100;


% 
% x=1:length(v150_31);
% plot(x,v150_31,'r.');
% 


x=[10,11,14,32,33,34,35];
for i=1:length(x)
    y(i)=v50_11(x(i));
end
interp_co=polyfit(x,y,3);

for i=12:31
    v50_11(i)=interp_co(1)*i^3+interp_co(2)*i^2+interp_co(3)*i^1+interp_co(4);
end

v50_11=v50_11/100;
v50_1(x1:x2)=v50_11;
v50_result1=V50_1(t1:length(V50_1));
v50_11(35:length(v50_11))=mean(v50_11(35:length(v50_11)));
v50_result1(x1:x2)=v50_11;
v50_result1(x2:length(v50_result1))=V50_pre1((t1+x2-1):length(V50_pre1));
v50_result1=v50_result1';



x=[8,10,12,28,30,32];
for i=1:length(x)
    y(i)=v50_21(x(i));
end
interp_co=polyfit(x,y,3);

for i=8:40
    v50_21(i)=interp_co(1)*i^3+interp_co(2)*i^2+interp_co(3)*i^1+interp_co(4);
end

v50_21=v50_21/100;
v50_2(x1:x2)=v50_21;
v50_result2=V50_2(t1:length(V50_2));
v50_21(40:length(v50_21))=mean(v50_21(40:length(v50_21)));
v50_result2(x1:x2)=v50_21;
v50_result2(x2:length(v50_result2))=V50_pre2((t1+x2-1):length(V50_pre2));
v50_result2=v50_result2';


x=[9,12,13,29,30,31,32];
for i=1:length(x)
    y(i)=v50_31(x(i));
end
interp_co=polyfit(x,y,3);

for i=8:32
    v50_31(i)=interp_co(1)*i^3+interp_co(2)*i^2+interp_co(3)*i^1+interp_co(4);
end

v50_31=v50_31/100;
v50_3(x1:x2)=v50_31;
v50_result3=V50_3(t1:length(V50_3));
v50_31(40:length(v50_31))=mean(v50_31(40:length(v50_31)));
v50_result3(x1:x2)=v50_31;
v50_result3(x2:length(v50_result3))=V50_pre3((t1+x2-1):length(V50_pre3));
v50_result3=v50_result3';




x=[9,10,11,32,33,34,35,36];
for i=1:length(x)
    y(i)=v100_11(x(i));
end
interp_co=polyfit(x,y,3);

for i=12:31
    v100_11(i)=interp_co(1)*i^3+interp_co(2)*i^2+interp_co(3)*i^1+interp_co(4);
end

v100_11=v100_11/100;
v100_1(x1:x2)=v100_11;
v100_result1=V100_1(t1:length(V100_1));
v100_result1(x1:x2)=v100_11;
v100_result1(x2:length(v100_result1))=V100_pre1((t1+x2-1):length(V100_pre1));
v100_result1=v100_result1';


x=[11,12,13,14,15,31,32,33,34,35];
for i=1:length(x)
    y(i)=v100_21(x(i));
end
interp_co=polyfit(x,y,3);

for i=16:30
    v100_21(i)=interp_co(1)*i^3+interp_co(2)*i^2+interp_co(3)*i^1+interp_co(4);
end

v100_21=v100_21/100;
v100_2(x1:x2)=v100_21;
v100_result2=V100_2(t1:length(V100_2));
v100_result2(x1:x2)=v100_21;
v100_result2(x2:length(v100_result2))=V100_pre2((t1+x2-1):length(V100_pre2));
v100_result2=v100_result2';


% 
x=[10,11,12,30,31,32,33,34];
for i=1:length(x)
    y(i)=v100_31(x(i));
end
interp_co=polyfit(x,y,3);

for i=13:29
    v100_31(i)=interp_co(1)*i^3+interp_co(2)*i^2+interp_co(3)*i^1+interp_co(4);
end

v100_31=v100_31/100;
v100_3(x1:x2)=v100_31;
v100_result3=V100_3(t1:length(V100_3));
v100_31(35:length(v100_31))=mean(v100_31(35:length(v100_31)));
v100_result3(x1:x2)=v100_31;
v100_result3(x2:length(v100_result3))=V100_pre3((t1+x2-1):length(V100_pre3));
v100_result3=v100_result3';


x=[10,11,12,13,32,33,34,35,36,37,38];
for i=1:length(x)
    y(i)=v150_11(x(i));
end
interp_co=polyfit(x,y,3);

for i=13:31
    v150_11(i)=interp_co(1)*i^3+interp_co(2)*i^2+interp_co(3)*i^1+interp_co(4);
end

v150_11=v150_11/100;
v150_1(x1:x2)=v150_11;
v150_result1=V150_1(t1:length(V150_1));
v150_11(39:length(v150_11))=mean(v150_11(39:length(v150_11)));
v150_result1(x1:x2)=v150_11;
v150_result1(x2:length(v150_result1))=V150_pre1((t1+x2-1):length(V150_pre1));
v150_result1=v150_result1';


x=[8,9,10,11,12,30,31,33,35];
for i=1:length(x)
    y(i)=v150_21(x(i));
end
interp_co=polyfit(x,y,3);

for i=13:31
    v150_21(i)=interp_co(1)*i^3+interp_co(2)*i^2+interp_co(3)*i^1+interp_co(4);
end

v150_21=v150_21/100;
v150_2(x1:x2)=v150_21;
v150_result2=V150_2(t1:length(V150_2));
v150_21(36:length(v150_21))=mean(v150_21(36:length(v150_21)));
v150_result2(x1:x2)=v150_21;
v150_result2(x2:length(v150_result2))=V150_pre2((t1+x2-1):length(V150_pre2));
v150_result2=v150_result2';

x=[9,10,11,12,31,32,33,34];
for i=1:length(x)
    y(i)=v150_31(x(i));
end
interp_co=polyfit(x,y,3);

for i=13:30
    v150_31(i)=interp_co(1)*i^3+interp_co(2)*i^2+interp_co(3)*i^1+interp_co(4);
end

v150_31=v150_31/100;
v150_3(x1:x2)=v150_31;
v150_result3=V150_3(t1:length(V150_3));
v150_31(36:length(v150_31))=mean(v150_31(36:length(v150_31)));
v150_result3(x1:x2)=v150_31;
v150_result3(x2:length(v150_result3))=V150_pre3((t1+x2-1):length(V150_pre3));
v150_result3=v150_result3';







x=t1:length(V150_3);

subplot(2,1,1);
plot(x,V150_3(t1:length(V150_3)),'b.');
xlabel('时间(ms)');
ylabel('电压(V)');
hleg1 = legend('原始GEI时域激发极化信号');
subplot(2,1,2);
plot(x,v150_result3,'r.');
xlabel('时间(ms)');
ylabel('电压(V)');
hleg1 = legend('处理后的GEI时域激发极化信号');



