function y=lowp(x)
%��ͨ�˲�
%ʹ��ע�����ͨ��������Ľ�ֹƵ�ʵ�ѡȡ��Χ�ǲ��ܳ��������ʵ�һ��
%��,f1,f3��ֵ��ҪС��Fs/2
%x:��Ҫ��ͨ�˲�������
%f1��ͨ����ֹƵ��
%f3�������ֹƵ��
%rp���ߴ���˥��DB������
%rs����ֹ��˥��DB������
%FS������x�Ĳ���Ƶ��
f1=1;%ͨ����ֹƵ��
f3=5;%�����ֹƵ��
rp=0.1;rs=40;%ͨ����˥��DBֵ�������˥��DBֵ
Fs=1000;%������

wp=2*f1/Fs;
ws=2*f3/Fs;
% ����б�ѩ���˲���
[n,wn]=cheb1ord(wp/pi,ws/pi,rp,rs);
[b,a]=cheby1(n,rp,wp/pi);
%�鿴����˲���������
% [h,w]=freqz(bz1,az1,256,Fs);
% h=20*log10(abs(h));
% plot(w,h);title('������˲�����ͨ������');
% grid on;
freqz(b,a,512,1000); 
b
a
title('Chebyshev Type I Lowpass Filter')
y=filter(b,a,x)*1000;%������x�˲���õ�������y
figure
plot(1:length(y),y);
end