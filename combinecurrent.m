clc;
clear all;

[filename, pathname, filterindex] = uigetfile( ...
    {  '*.txt','Current-files (*.txt)'; ...
    '*.mdl','Models (*.mdl)'; ...
    '*.*',  'All Files (*.*)'}, ...
    'Pick all current file', ...
    'MultiSelect', 'on');
nc = length(filename);filename=sort(filename);
[fout,outmsg] = fopen('all_currentdata.asc','wt+');
for j=1:nc
    ptem = cell2mat(filename(j))
    fid=fopen(ptem,'rt+'); 
    i=0;Lfirst=0;H=0.0;HH=0.0;
    strline = fgetl(fid) ;

    while ~feof(fid)
       la=length(strfind(strline,'/'));lb=length(strfind(strline,':'));strline
       a=strfind(strline,'/');  b=strfind(strline,':');
        if  la>0 & lb>0& length(a)>1& length(b)>1;
                temp=length(a) ; if temp<1 continue;end;
                ymd = strline(a(1)-4:a(2)+2);
                b=strfind(strline,':');
                tms = strline(b(length(b)-1)-2:b(length(b))+2);
            
                strline = fgetl(fid) ;la=length(strfind(strline,'/'));lb=length(strfind(strline,':'));
                if  ~(la>0 & lb>0);
                       while ~(la>0 & lb>0) & ~feof(fid);
                                  if strfind(strline,'H:')  ;
                                      H=str2num(strline(3:length(strline)));
                                  end
                                  lbb = strfind(strline,'B:'); lzz = strfind(strline,'Z:');  ldev = strfind(strline,'/');
                                  if (length(lbb)>0 | length(lzz)>0) & (length(ldev)==0);
                                            i=i+1;
                                            Icurrent(i) = str2num(strline(3:length(strline)));
                                            Lfirst=1;
                                  end
                                  strline = fgetl(fid) ;la=length(strfind(strline,'/'));lb=length(strfind(strline,':'));
                       end
                
                       if Lfirst==1;
                           la=length(strfind(strline,'/'));lb=length(strfind(strline,':'));
                           if  la>0 & lb>0;
                                   b=strfind(strline,':');
                                   ntms = strline(b(length(b)-1)-2:b(length(b))+2); 
                                  if strcmp(ntms,tms)
                                      strline = fgetl(fid) ; la=length(strfind(strline,'/'));lb=length(strfind(strline,':'));
                                           while ~(la>0 & lb>0) & ~feof(fid)
                                                        if strfind(strline,'H:')  
                                                            HH=str2num(strline(3:length(strline)));
                                                        end
                                                        lbb = strfind(strline,'B:'); lzz = strfind(strline,'Z:');  ldev = strfind(strline,'/');
                                                       if  (length(lbb)>0 | length(lzz)>0) & (length(ldev)==0)
                                                                  i=i+1;
                                                                  Icurrent(i) = str2num(strline(3:length(strline)));
                                                        end
                                                        strline = fgetl(fid) ;la=length(strfind(strline,'/'));lb=length(strfind(strline,':'));
                                           end
                                  end
                           end
                           Imean =  mean(Icurrent); Inewind= find(Icurrent>Imean); Inewmean=mean(Icurrent(Inewind));
                           if(H>0 & HH>0) Hmean=(H+HH)/2.0;
                           else Hmean=max(H,HH);
                           end
                           fprintf(fout,'%s %s %f %f\n',ymd,tms,Inewmean,Hmean);                   
                            i=0;Lfirst=0;H=0.0;HH=0.0;
                       end
                end
        else
            strline = fgetl(fid);
        end
    end
    fclose(fid);
end
fclose(fout);
% clear all;
