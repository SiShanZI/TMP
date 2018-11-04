function [Warn,KEY]=Z_Str_Agree(Lim,Sel)  
flag=1;
while(flag)                            
    string=sprintf('Message:(%d个字符之内！)',Lim);
    switch Sel
        case 01
            Answ=inputdlg({string},'Message Hiding!',[5 50]);
            KEY=0;
        otherwise
            Answ=inputdlg({string,'KEY:'},'Message Hiding!',[5 50]);
            KEY=str2num(char(Answ(2)));
    end
    Warn=abs(char(Answ(1)));            %将字符串转换为ASCII码向量
    Warn=[Warn,33];                     %添加终止符
    for i=1:length(Warn)                %暂定字符集{@ A~Z . / 0~9 : 空格 !}共42个，“!”为终止符，不作输入
        if(Warn(i)>=64&Warn(i)<=90)     %约定的映射关系
            Warn(i)=Warn(i)-63;
            flag=0;
        elseif(Warn(i)>=46&Warn(i)<=58) 
            Warn(i)=Warn(i)-18;
            flag=0;
        elseif(Warn(i)==32)
            Warn(i)=41;
            flag=0;
        elseif(Warn(i)==33)             %终止符
            Warn(i)=42;
            flag=0;
        else
            clc;clear all;
            flag=1;
            OK=errordlg('Illegal Word！','Error!','on');
            waitfor(OK);                %大神！
            break
        end
    end
end
                
