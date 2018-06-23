clear all;
clc;

%ʹ��֮ǰӦ�ȴ��������ļ���һ���յ�EXCEL�����Ϊ���Ŀ���ļ��������·���������
filename_in='20180126.xlsx';
filename_out='20180126-1.xlsx';

data=xlsread(filename_in);
[a,b]=size(data);

%�˴�Ϊtxt�ļ����һ����λ��¼��λ��
n=476;

for i=2:b

v=data(:,i);
v_end=mean(v(n-9:n));

t1=11;
for j=11:length(v)
    if v(j)>=((v(11)+v_end)/2)
     t1=t1+1;
    else
       break 
    end
end

t2=21;
for k=21:length(v)
    if v(k)>=((v(21)+v_end)/2)
     t2=t2+1;
    else
       break 
    end
end

t3=31;
for l=31:length(v)
    if v(l)>=((v(31)+v_end)/2)
     t3=t3+1;
    else
       break 
    end
end

t100(i-1)=(t1-1)*10-100;
t200(i-1)=(t2-1)*10-200;
t300(i-1)=(t3-1)*10-300;

eta_100(i-1)=(v(11)-v_end)/(v(2)-v_end)*100;
eta_200(i-1)=(v(21)-v_end)/(v(2)-v_end)*100;
eta_300(i-1)=(v(31)-v_end)/(v(2)-v_end)*100;
end

%��Ʒ���
line=data(1,:);
line=line(2:b)';

%��˥ʱ
t100=t100';
t200=t200';
t300=t300';

%������
eta_100=eta_100';
eta_200=eta_200';
eta_300=eta_300';

%�ļ����
txt={'��Ʒ���','100ms��˥ʱ','100ms������','200ms��˥ʱ','200ms������','300ms��˥ʱ','300ms������'};
xlswrite(filename_out,txt(1),'sheet1','A1');
xlswrite(filename_out,line,'sheet1','A2');

xlswrite(filename_out,txt(2),'sheet1','B1');
xlswrite(filename_out,t100,'sheet1','B2');

xlswrite(filename_out,txt(3),'sheet1','C1');
xlswrite(filename_out,eta_100,'sheet1','C2');

xlswrite(filename_out,txt(4),'sheet1','D1');
xlswrite(filename_out,t200,'sheet1','D2');

xlswrite(filename_out,txt(5),'sheet1','E1');
xlswrite(filename_out,eta_200,'sheet1','E2');

xlswrite(filename_out,txt(6),'sheet1','F1');
xlswrite(filename_out,t300,'sheet1','F2');

xlswrite(filename_out,txt(7),'sheet1','G1');
xlswrite(filename_out,eta_300,'sheet1','G2');