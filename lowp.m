function y=lowp(x)
%低通滤波
%使用注意事项：通带或阻带的截止频率的选取范围是不能超过采样率的一半
%即,f1,f3的值都要小于Fs/2
%x:需要带通滤波的序列
%f1：通带截止频率
%f3：阻带截止频率
%rp：边带区衰减DB数设置
%rs：截止区衰减DB数设置
%FS：序列x的采样频率
f1=1;%通带截止频率
f3=5;%阻带截止频率
rp=0.1;rs=40;%通带边衰减DB值和阻带边衰减DB值
Fs=1000;%采样率

wp=2*f1/Fs;
ws=2*f3/Fs;
% 设计切比雪夫滤波器
[n,wn]=cheb1ord(wp/pi,ws/pi,rp,rs);
[b,a]=cheby1(n,rp,wp/pi);
%查看设计滤波器的曲线
% [h,w]=freqz(bz1,az1,256,Fs);
% h=20*log10(abs(h));
% plot(w,h);title('所设计滤波器的通带曲线');
% grid on;
freqz(b,a,512,1000); 
b
a
title('Chebyshev Type I Lowpass Filter')
y=filter(b,a,x)*1000;%对序列x滤波后得到的序列y
figure
plot(1:length(y),y);
end