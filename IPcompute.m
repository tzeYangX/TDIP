clear all;
clc;

%使用之前应先创建输入文件和一个空的EXCEL表格，作为输出目标文件，并在下方更改名称
filename_in='20180126.xlsx';
filename_out='20180126-1.xlsx';

data=xlsread(filename_in);
[a,b]=size(data);

%此处为txt文件最后一个电位记录的位置
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

%样品编号
line=data(1,:);
line=line(2:b)';

%半衰时
t100=t100';
t200=t200';
t300=t300';

%极化率
eta_100=eta_100';
eta_200=eta_200';
eta_300=eta_300';

%文件输出
txt={'样品编号','100ms半衰时','100ms极化率','200ms半衰时','200ms极化率','300ms半衰时','300ms极化率'};
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