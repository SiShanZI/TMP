function [DecEn,BinEn]=Sue_ArithEnco(EnSeq,Np)
DecEn=[];BinEn=[];
EnSeqL=length(EnSeq);
Nn=Np;
Cal=ones(1,Np);
Sides=sym([0:1/Np:1]);                  %符号运算保证精度
for i=1:EnSeqL                        
    Nn=Nn+1;
    Cal(EnSeq(i))=Cal(EnSeq(i))+1;      %累计每个字符出现的频次
    Sides(1)=Sides(EnSeq(i));           %重新分布概率区间
    Sides(Np+1)=Sides(EnSeq(i)+1);      
    Stepv=(Sides(Np+1)-Sides(1))/Nn;
    while(1)                            %提取小数位，减少小数位数
        Pa=floor(Sides(1)*10);          
        Pb=floor(Sides(Np+1)*10);
        if(Pa==Pb)
            DecEn=[DecEn,Pa];           %输出小数位编码,如需屏显，则disp(Pa)即可
            BinEn=[BinEn,dec2bin(double(Pa),4)];
            Stepv=Stepv*10;
            Sides(1)=Sides(1)*10-Pa;
            Sides(Np+1)=Sides(Np+1)*10-Pa;
        else
            break
        end
    end
    for j=2:Np
        Sides(j)=Sides(j-1)+Stepv*Cal(j-1);
    end
end
SiL=double(Sides(1));                   %最后的区间，双精度直观，任取其中一个数完成编码
SiR=double(Sides(Np+1));
P=1;                                    %编码不唯一，但通过下面的规则可保证解码唯一
while(1)                                %截断端点小数值（左端点进位，右端点舍位）
    Dec=floor(SiR*(10^P))-ceil(SiL*(10^P));
    if(Dec>1)                           %如果二者之差大于一个单位，则任取二者之间的一个数即可
        Reb=(ceil(SiL*(10^P))+floor(Dec/2))/(10^P);
        break                           %本程序取中点
    else
        P=P+1;
    end
end
while(P>0)                              %输出剩余小数位编码，如需屏显，则disp(floor(Reb*10))即可
    DecEn=[DecEn,floor(Reb*10)];
    BinEn=[BinEn,dec2bin(floor(Reb*10),4)];
    Reb=Reb*10-floor(Reb*10);
    P=P-1;
end
DecEn;
BinEn=BinEn-48;

