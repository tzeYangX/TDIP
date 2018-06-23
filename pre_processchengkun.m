clear all;
clc

%数据输入
%ob为实测数据，sti为正演数据，pre为预处理数据,resti为重新正演数据

data=xlsread('成昆铁路电法数据.xls');

data_ob=data(:,8);

data_sti=data(:,9);

data_pre=data_ob;


%数据坏点剔除

data_error=1000;

for i=1:length(data_pre)-1
    j=i;
    k=i+1;
    if abs(data_pre(k)-data_pre(j))>data_error
        k=k+1;
        if abs(data_pre(k)-data_pre(j))<data_error
%         sprintf('插值点结果为:%f\n',k-1)
          for n=j+1:k-1
             data_pre(n)=data_ob(j)+(n-j)*(data_ob(k)-data_ob(j))/(k-j);
          end
          else k=k+1;
        end
    end
end

% x=1:1:length(data_pre);
% subplot(2,1,1);
% plot(x,data_pre,'-ko');
% hleg1 = legend('处理后');
% 


%数据拟合

co_bg=inv(data_sti'*data_sti)*data_sti'*data_ob;

data_resti=data_sti*co_bg;



%多项式插值
interp_x=16;
interp_1=10;
interp_2=15;
interp_n=interp_x-interp_1+1;

interp_xx=1:(interp_2-interp_1+1);
interp_yy=data_pre(interp_1:interp_2);
interp_yy=interp_yy';
interp_co=polyfit(interp_xx,interp_yy,3);
data_pre(interp_x)=interp_co(1)*interp_n^3+interp_co(2)*interp_n^2+interp_co(3)*interp_n^1+interp_co(4);


% % 绘图
% x=1:1:length(data_ob);
% plot(x,data_pre,'-ko',x,data_resti,'-b');
% hleg1 = legend('实测数据','修正数据');

 
% 
% 后续分段处理
M_NUM=16;
i_start=17;
i=(length(data_pre)-i_start+1)/M_NUM;
win_start=12;
win_end=16;

 for j=1:i
     a=data_pre((i_start-1)*j+1:(i_start-1)*j+M_NUM);
     b=data_resti((i_start-1)*j+1:(i_start-1)*j+M_NUM);
     a=a*inv(a'*a)*a'*b;
%      a_mid=medfilt1(a,2);
%      a(win_start:win_end)=a_mid(win_start:win_end);
%      a=a_mid;
     a=smooth(a);
     data_pre((i_start-1)*j+1:(i_start-1)*j+M_NUM)=a;
 end
 
% % 
% 
% % 


data_temp=data_pre(17:32);


R=std(data_pre(17:32)-data_resti(17:32));
Q=std(data_pre(17:32));
result = kalman_filter(data_temp,Q,R,data_pre(17),0.5,data_resti(17:32));


x=1:1:M_NUM;
subplot(2,2,1)
plot(x,result,'-ko',x,data_resti(17:32),'-.b',x,data_pre(17:32));
hleg1 = legend('滤波数据','模拟数据');
subplot(2,2,2)
plot(x,data_pre(33:48),'-ko',x,data_resti(33:48),'-.b');
hleg1 = legend('滤波数据','模拟数据');
subplot(2,2,3)
plot(x,data_pre(49:64),'-ko',x,data_resti(49:64),'-.b');
hleg1 = legend('滤波数据','模拟数据');
subplot(2,2,4)
plot(x,data_pre(65:80),'-ko',x,data_resti(65:80),'-.b');
hleg1 = legend('滤波数据','模拟数据');
% 
% % 

% % 绘图
% x=1:1:length(data_pre);
% plot(x,data_pre,'-ko',x,data_sti,'-.r',x,data_resti,'-b');
% hleg1 = legend('预处理数据','原始正演数据','修正数据');
